/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Main;

import Model.Employee;
import Model.Rfid;
import Shared.ConnectionManager;
import Shared.*;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
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
public class Login extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/plain");
        PrintWriter out = response.getWriter();

        if (request.getHeader("api_key") != null && Helper.validateAPIKEY(request.getHeader("api_key"))) {
            out.print(loginUser(request));
        } else {
            out.print("invalidRequest");
        }

    }

    private String loginUser(HttpServletRequest request) {
        Connection con = new ConnectionManager().getConnection();
        try {
            if (!request.getParameter("email").equals("admin@symphid.com")) {
                Statement stmt = con.createStatement();
                ResultSet rs = stmt.executeQuery("select * from EMPLOYEES where EMAIL='" + request.getParameter("email") + "' AND PASSWORD='" + request.getParameter("password") + "'");
                while (rs.next()) {
                    if (!rs.getString("FLAG").isEmpty()) {
                        if (rs.getString("FLAG").equals(Constants.USER_ACTIVE)) {
                            if (request.getSession(false) != null) {
                                request.getSession(false).invalidate(); // remove non login session which is common behavior of servlet
                            }
                            HttpSession loginSession = request.getSession();
                            SessionManager.addSession(String.valueOf(rs.getInt("EMPLOYEEID")), loginSession.getId());
                            loginSession.setAttribute("id", rs.getInt("EMPLOYEEID"));
                            loginSession.setAttribute("userJson", getUserJson(con, rs.getInt("EMPLOYEEID"), rs));
                            loginSession.setAttribute("userData", getUserData(con, rs.getInt("EMPLOYEEID"), rs));
                            return Constants.LOGIN_SUCCESS;
                        }
                        if (rs.getString("FLAG").equals(Constants.USER_HOLIDAY)) {
                            return Constants.LOGIN_HOLIDAY;
                        }
                        if (rs.getString("FLAG").equals(Constants.USER_VERIFY)) {
                            return Constants.USER_VERIFY;
                        }
                    } else {
                        return Constants.LOGIN_INSUCCESS;
                    }

                }
                return Constants.LOGIN_INSUCCESS;
            } else {
                Statement stmt = con.createStatement();
                ResultSet rs = stmt.executeQuery("select count(*) as COUNT from admin where password='" + request.getParameter("password") + "'");
                rs.next();
                if (rs.getInt("COUNT") == 1) {
                    HttpSession loginSession = request.getSession();
                    loginSession.setAttribute("isUserAdmin", true);
                    loginSession.setAttribute("id", "admin");
                    return Constants.LOGIN_SUCCESS;
                } else {
                    return Constants.LOGIN_INSUCCESS;
                }
            }
        } catch (Exception e) {
            System.out.println(e);
            return Constants.LOGIN_INSUCCESS;
        } finally {
            try {
                con.close();
            } catch (SQLException ex) {
                Logger.getLogger(Login.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

    }

    private String getUserJson(Connection con, int id, ResultSet employeeResult) {
        try {
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("select RFIDNUMBER from RFID where EMPLOYEEID=" + id);
            if (rs.next()) {
                int rfidNumber = rs.getInt("RFIDNUMBER");
                boolean[] hrDetails = isUserHR(id, con);
                Employee employee = new Employee(
                        id,
                        Helper.convertDateToString(new Date(employeeResult.getDate("DOB").getTime()), "dd-MM-yyyy"),
                        employeeResult.getString("FIRSTNAME"),
                        employeeResult.getString("LASTNAME"),
                        employeeResult.getString("GENDER"),
                        employeeResult.getString("PHONENUMBER"),
                        employeeResult.getString("EMAIL"),
                        employeeResult.getString("ADDRESS"),
                        new Rfid(rfidNumber, isUserCheckinInVerification(String.valueOf(rfidNumber), con)),
                        0,
                        null,
                        hrDetails[0],
                        hrDetails[1]
                );

                ObjectMapper mapper = new ObjectMapper();
                return mapper.writeValueAsString(employee);
            }
            return Constants.ERROR;
        } catch (Exception e) {
            System.out.println(e);
            return Constants.ERROR;
        }
    }

    private Employee getUserData(Connection con, int id, ResultSet employeeResult) {
        try {
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("select RFIDNUMBER from RFID where EMPLOYEEID=" + id);
            if (rs.next()) {

                int rfidNumber = rs.getInt("RFIDNUMBER");
                boolean[] hrDetails = isUserHR(id, con);
                Employee employee = new Employee(
                        id,
                        Helper.convertDateToString(new Date(employeeResult.getDate("DOB").getTime()), "dd-MM-yyyy"),
                        employeeResult.getString("FIRSTNAME"),
                        employeeResult.getString("LASTNAME"),
                        employeeResult.getString("GENDER"),
                        employeeResult.getString("PHONENUMBER"),
                        employeeResult.getString("EMAIL"),
                        employeeResult.getString("ADDRESS"),
                        new Rfid(rfidNumber, isUserCheckinInVerification(String.valueOf(rfidNumber), con)),
                        0,
                        null,
                        hrDetails[0],
                        hrDetails[1]
                );

                return employee;
            }
            return null;
        } catch (Exception e) {
            System.out.println(e);
            return null;
        } finally {
            try {
                con.close();
            } catch (SQLException ex) {
                Logger.getLogger(Login.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    protected boolean[] isUserHR(int employeeId, Connection con) {
        try {
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("select flag from HR where employeeId=" + employeeId);
            if (rs.next() == true) {
                if (rs.getString("flag").equals(Constants.USER_ACTIVE)) {
                    return new boolean[]{true, true};
                } else {
                    return new boolean[]{true, false};
                }
            } else {
                return new boolean[]{false, false};
            }
        } catch (Exception e) {
            return new boolean[]{false, false};
        }
    }

    private boolean isUserCheckinInVerification(String rfidNumber, Connection con) {
        try {
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("select FLAG from ATTENDENCE WHERE TO_DATE(TO_CHAR(CHECKIN,'DD-MM-YYYY'),'DD-MM-YYYY')=TO_DATE(TO_CHAR(current_timestamp,'DD-MM-YYYY'),'DD-MM-YYYY') AND RFIDNUMBER=" + rfidNumber);
            if (rs.next() && rs.getString("FLAG").equals(Constants.ATTENDANCE_VERIFY)) {
                return true;
            } else {
                return false;
            }
        } catch (Exception e) {
            System.out.println(e);
            return false;
        }
    }
}
