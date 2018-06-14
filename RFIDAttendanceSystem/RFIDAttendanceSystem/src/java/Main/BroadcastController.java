/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Main;

import Model.Broadcast;
import Model.Broadcasts;
import Model.Employee;
import Shared.ConnectionManager;
import Shared.Constants;
import Shared.Helper;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author mohnish
 */
public class BroadcastController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/plain");
        PrintWriter out = response.getWriter();

        if (request.getHeader("api_key") != null && Helper.validateAPIKEY(request.getHeader("api_key"))) {
            if (request.getParameter("task") != null) {
                switch (request.getParameter("task")) {
                    case Constants.LOAD_BROADCASTDATA:
                        out.print(loadBroadcastData(request.getSession(false)));
                        break;
                }
            } else {
                out.print("invalidRequest");
            }
        } else {
            out.print("invalidRequest");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/plain");
        PrintWriter out = response.getWriter();
        if (request.getHeader("api_key") != null && Helper.validateAPIKEY(request.getHeader("api_key"))) {
            if (request.getParameter("task") != null) {
                switch (request.getParameter("task")) {
                    case Constants.POST_BROADCAST:
                        out.print(postBroadcast(request.getSession(false), request.getParameter("multiselect"), request.getParameter("message")));
                        break;
                    case Constants.DELETE_BROADCAST:
                        out.print(deleteBroadcast(request.getSession(false), request.getParameter("id")));
                        break;
                }
            } else {
                out.print("invalidRequest");
            }
        } else {
            out.print("invalidRequest");
        }
    }

    private String loadBroadcastData(HttpSession session) {
        if (((Employee) session.getAttribute("userData")).isUserHr()) {
            List<Broadcast> broadcastList = new ArrayList<>();
            List<Employee> entireEmployeeList = new ArrayList<>();
            Connection con = new ConnectionManager().getConnection();
            try {
                Statement stmt = con.createStatement();
                ResultSet rs = stmt.executeQuery("select * from broadcast ORDER BY DATETIME");
                while (rs.next()) {

                    List<Employee> employeesList = new ArrayList<>();

                    if (rs.getString("BROADCASTTYPE").equals(Constants.INDIVIDUAL_MODE)) {
                        Statement stmt2 = con.createStatement();
                        ResultSet rs2 = stmt2.executeQuery("select EMPLOYEEID, FIRSTNAME, LASTNAME FROM EMPLOYEES WHERE EMPLOYEEID IN (select EMPLOYEEID from BROADCASTEMPLOYEEMAPPER WHERE ID=" + rs.getInt("ID") + ")");
                        while (rs2.next()) {
                            employeesList.add(new Employee(
                                    rs2.getInt("EMPLOYEEID"),
                                    rs2.getString("FIRSTNAME"),
                                    rs2.getString("LASTNAME"))
                            );
                        }
                    } else {
                        employeesList = null;
                    }
                    broadcastList.add(new Broadcast(
                            rs.getInt("ID"),
                            rs.getString("MESSAGE"),
                            rs.getString("BROADCASTTYPE"),
                            rs.getString("FLAG"),
                            employeesList)
                    );

                }
                Statement stmt3 = con.createStatement();
                ResultSet rs3 = stmt3.executeQuery("select EMPLOYEEID, FIRSTNAME, LASTNAME FROM EMPLOYEES");
                while (rs3.next()) {
                    entireEmployeeList.add(new Employee(
                            rs3.getInt("EMPLOYEEID"),
                            rs3.getString("FIRSTNAME"),
                            rs3.getString("LASTNAME"))
                    );
                }
                ObjectMapper mapper = new ObjectMapper();
                return mapper.writeValueAsString(new Broadcasts(entireEmployeeList, broadcastList));
            } catch (Exception e) {
                System.out.println(e);
                return Constants.ERROR;
            } finally {
                try {
                    con.close();
                } catch (SQLException ex) {
                    Logger.getLogger(BroadcastController.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        } else {
            return Constants.ERROR;
        }
    }

    private String postBroadcast(HttpSession session, String multiselect, String message) {
        if (((Employee) session.getAttribute("userData")).isUserHr()) {
            String type = Constants.BROADCAST_MODE;
            String[] listofEmployeeId = null;
            List<Employee> employeeIds = new ArrayList<>();
            Broadcast broadcast = new Broadcast();
            Connection con = new ConnectionManager().getConnection();
            try {
                if (multiselect != null) {
                    type = Constants.INDIVIDUAL_MODE;
                    listofEmployeeId = multiselect.split(",");
                }
                PreparedStatement ps = con.prepareStatement("insert into broadcast values (?,?,?,?,?)");
                int broadcastId = Math.abs(new Random().nextInt());
                ps.setInt(1, broadcastId);
                ps.setString(2, message);
                ps.setString(3, type);
                ps.setString(4, Constants.BROADCAST_ACTIVE);
                ps.setTimestamp(5, Helper.getCurrentTimeStamp());
                ps.executeUpdate();
                if (type.equals(Constants.INDIVIDUAL_MODE)) {
                    for (String employeeId : listofEmployeeId) {
                        PreparedStatement ps2 = con.prepareStatement("insert into BROADCASTEMPLOYEEMAPPER values (?,?)");
                        ps2.setInt(1, broadcastId);
                        ps2.setInt(2, Integer.parseInt(employeeId));
                        ps2.executeUpdate();
                    }
                    Statement stmt = con.createStatement();
                    ResultSet rs = stmt.executeQuery("select EMPLOYEEID, FIRSTNAME, LASTNAME FROM EMPLOYEES WHERE EMPLOYEEID IN (select EMPLOYEEID from BROADCASTEMPLOYEEMAPPER WHERE ID=" + broadcastId + ")");
                    while (rs.next()) {
                        employeeIds.add(new Employee(
                                rs.getInt("EMPLOYEEID"),
                                rs.getString("FIRSTNAME"),
                                rs.getString("LASTNAME"))
                        );
                    }
                } else {
                    employeeIds = null;
                }
                broadcast.setBroadcastType(type);
                broadcast.setFlag(Constants.BROADCAST_ACTIVE);
                broadcast.setId(broadcastId);
                broadcast.setMessage(message);
                broadcast.setEmployeesList(employeeIds);
                ObjectMapper mapper = new ObjectMapper();
                return mapper.writeValueAsString(broadcast);
            } catch (Exception e) {
                System.out.println(e);
                return Constants.ERROR;
            } finally {
                try {
                    con.close();
                } catch (SQLException ex) {
                    Logger.getLogger(BroadcastController.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        } else {
            return Constants.ERROR;
        }
    }

    private String deleteBroadcast(HttpSession session, String id) {
        if (((Employee) session.getAttribute("userData")).isUserHr()) {
            Connection con = new ConnectionManager().getConnection();
            try {
                Statement stmt = con.createStatement();
                int count = stmt.executeUpdate("delete from broadcast where id=" + Integer.parseInt(id));
                if (count == 1) {
                    return Constants.OK;
                } else {
                    return Constants.ERROR;
                }
            } catch (Exception e) {
                System.out.println(e);
                return Constants.ERROR;
            }
        } else {
            return Constants.ERROR;
        }
    }
}
