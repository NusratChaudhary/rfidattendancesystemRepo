/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Main;

import Model.Employee;
import Model.Request;
import Model.RequestResponse;
import Shared.ConnectionManager;
import Shared.Constants;
import Shared.Helper;
import Shared.Mailer;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;
import java.text.SimpleDateFormat;
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
public class RequestController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/plain");
        PrintWriter out = response.getWriter();
        if (request.getHeader("api_key") != null && Helper.validateAPIKEY(request.getHeader("api_key"))) {
            switch (request.getParameter("task")) {
                case Constants.GET_REQUESTS:
                    if (request.getParameter("id") != null) {
                        out.print(getAllRequest(request, request.getParameter("id")));
                    } else {
                        out.print(getAllRequest(request, null));
                    }
                    break;
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
            switch (request.getParameter("task")) {
                case Constants.ADD_REQUEST:
                    out.print(addRequest(request.getSession(false), request));
                    break;
                case Constants.CHANGE_REQUEST_STATUS:
                    out.print(makeRequestRead(request.getSession(false), request));
                    break;
                case Constants.POST_REPLY:
                    out.print(postReply(request.getSession(false), request));
                    break;
            }
        } else {
            out.print("invalidRequest");
        }

    }

    private String getAllRequest(HttpServletRequest request, String requestIds) {
        Connection con = new ConnectionManager().getConnection();
        List<Request> requestList = new ArrayList<Request>();
        String query = null;
        try {
            Statement stmt = con.createStatement();
            if (request.getHeader("Referer").contains("PendingRequest.jsp") && ((Employee) request.getSession(false).getAttribute("userData")).isUserHr()) {
                query = "select REQUESTID,REQUESTSUBJECT,REQUESTBODY,REQUESTREPLY,EMPLOYEEID,NVL(ADMINSTATUS,0) AS ADMINSTATUS,to_char(DATETIME,'DD-MM-YY') AS DATETIME,NVL(to_char(REPLYDATETIME,'DD-MM-YY'),'-') AS REPLYDATETIME,FLAG from request";
                if (requestIds != null) {
                    query = query + " WHERE REQUESTID NOT IN ( " + requestIds + " ) ORDER BY FLAG";
                } else {
                    query = query + " ORDER BY FLAG";
                }
            } else {
                query = "select REQUESTID,REQUESTSUBJECT,REQUESTBODY,REQUESTREPLY,EMPLOYEEID,NVL(ADMINSTATUS,0) AS ADMINSTATUS,to_char(DATETIME,'DD-MM-YY') AS DATETIME,NVL(to_char(REPLYDATETIME,'DD-MM-YY'),'-') AS REPLYDATETIME,FLAG from request where EMPLOYEEID=" + ((Employee) request.getSession(false).getAttribute("userData")).getEmployeeId() + "  ORDER BY FLAG";
            }
            ResultSet rs = stmt.executeQuery(query);

            while (rs.next()) {
                Statement stmt2 = con.createStatement();
                ResultSet rs2 = stmt2.executeQuery("select FIRSTNAME ||' '|| LASTNAME AS EMPLOYEENAME FROM EMPLOYEES WHERE EMPLOYEEID=" + rs.getInt("EMPLOYEEID"));
                rs2.next();
                requestList.add(new Request(
                        rs.getInt("REQUESTID"),
                        rs.getString("REQUESTSUBJECT"),
                        rs.getString("REQUESTBODY"),
                        rs.getString("REQUESTREPLY"),
                        rs.getInt("EMPLOYEEID"),
                        rs2.getString("EMPLOYEENAME"),
                        rs.getInt("ADMINSTATUS"),
                        dateFormatter(rs.getString("DATETIME")),
                        rs.getString("REPLYDATETIME"),
                        rs.getString("FLAG"),
                        rs.getString("FLAG").equals(Constants.REQUEST_RESPONDED),
                        rs.getString("FLAG").equals(Constants.REQUEST_READ) || rs.getString("FLAG").equals(Constants.REQUEST_RESPONDED)
                ));
            }
            ObjectMapper mapper = new ObjectMapper();
            if (mapper.writeValueAsString(requestList).equals("[]")) {
                return Constants.REQUESTS_NOT_FOUND;
            } else {
                return mapper.writeValueAsString(requestList);
            }
        } catch (Exception e) {
            System.out.println(e);
            return Constants.ERROR;
        } finally {
            try {
                con.close();
            } catch (Exception e) {
            }
        }
    }

    private String addRequest(HttpSession session, HttpServletRequest request) {
        Connection con = new ConnectionManager().getConnection();
        int requestId = Math.abs(new Random().nextInt());
        Employee employee = (Employee) session.getAttribute("userData");
        try {
            PreparedStatement ps = con.prepareStatement("insert into request values (?,?,?,?,?,?,?,?,?)");
            ps.setInt(1, requestId);
            ps.setString(2, request.getParameter("subject"));
            ps.setString(3, request.getParameter("message"));
            ps.setString(4, null);
            ps.setInt(5, employee.getEmployeeId());
            ps.setInt(6, 0);
            ps.setTimestamp(7, Helper.getCurrentTimeStamp());
            ps.setString(7, Constants.REQUEST_PENDING);
            ps.setTimestamp(9, null);
            ObjectMapper mapper = new ObjectMapper();

            if (ps.executeUpdate() == 1) {
                new Mailer().sendMail(employee.getEmail(), "[Request received] " + request.getParameter("subject"), "Your request (" + requestId + ") has been received and is being reviewed by our HR");
                RequestResponse response = new RequestResponse(requestId, null, Constants.OK);
                return mapper.writeValueAsString(response);
            } else {
                RequestResponse response = new RequestResponse(0, "Some Error Occured", Constants.ERROR);
                return mapper.writeValueAsString(response);
            }
        } catch (Exception e) {
            System.out.println(e);
            return Constants.ERROR;
        } finally {
            try {
                con.close();
            } catch (SQLException ex) {
                Logger.getLogger(RequestController.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    private String makeRequestRead(HttpSession session, HttpServletRequest request) {
        Connection con = new ConnectionManager().getConnection();
        try {
            if (((Employee) session.getAttribute("userData")).isUserHr()) {
                Statement stmt = con.createStatement();
                int count = stmt.executeUpdate("update request set FLAG='" + Constants.REQUEST_READ + "' where REQUESTID=" + Integer.parseInt(request.getParameter("id")));
                if (count == 1) {
                    return Constants.OK;
                } else {
                    return Constants.ERROR;
                }
            } else {
                return Constants.ERROR;
            }
        } catch (Exception e) {
            System.out.println(e);
            return Constants.ERROR;
        }
    }

    private String postReply(HttpSession session, HttpServletRequest request) {
        Connection con = new ConnectionManager().getConnection();
        try {
            if (((Employee) session.getAttribute("userData")).isUserHr()) {
                Statement stmt = con.createStatement();
                int count = stmt.executeUpdate("update request set FLAG='" + Constants.REQUEST_RESPONDED + "', REQUESTREPLY='" + request.getParameter("reply") + "', REPLYDATETIME=CURRENT_TIMESTAMP where REQUESTID=" + Integer.parseInt(request.getParameter("id")));
                if (count == 1) {
                    return Constants.OK;
                } else {
                    return Constants.ERROR;
                }
            } else {
                return Constants.ERROR;
            }
        } catch (Exception e) {
            System.out.println(e);
            return Constants.ERROR;
        }
    }

    private String dateFormatter(String date) {
        try {
            return new SimpleDateFormat("dd MMM yyyy").format(new SimpleDateFormat("dd-MM-yy").parse(date));
        } catch (ParseException ex) {
            Logger.getLogger(RequestController.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }
}
