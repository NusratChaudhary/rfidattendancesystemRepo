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
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("select * from EMPLOYEES where EMAIL='" + request.getParameter("email") + "' AND PASSWORD='" + request.getParameter("password") + "'");
            while (rs.next()) {
                if (!rs.getString("FLAG").isEmpty()) {
                    if (rs.getString("FLAG").equals(Constants.USER_ACTIVE)) {
                        HttpSession loginSession = request.getSession();
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

                Employee employee = new Employee(
                        id,
                        Helper.convertDateToString(new Date(employeeResult.getDate("DOB").getTime()), "dd-MM-yyyy"),
                        employeeResult.getString("FIRSTNAME"),
                        employeeResult.getString("LASTNAME"),
                        employeeResult.getString("GENDER"),
                        employeeResult.getString("PHONENUMBER"),
                        employeeResult.getString("EMAIL"),
                        employeeResult.getString("ADDRESS"),
                        new Rfid(rfidNumber),
                        isUserHR(employeeResult.getString("EMAIL"), con)
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

                Employee employee = new Employee(
                        id,
                        Helper.convertDateToString(new Date(employeeResult.getDate("DOB").getTime()), "dd-MM-yyyy"),
                        employeeResult.getString("FIRSTNAME"),
                        employeeResult.getString("LASTNAME"),
                        employeeResult.getString("GENDER"),
                        employeeResult.getString("PHONENUMBER"),
                        employeeResult.getString("EMAIL"),
                        employeeResult.getString("ADDRESS"),
                        new Rfid(rfidNumber),
                        isUserHR(employeeResult.getString("EMAIL"), con)
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

    private boolean isUserHR(String email, Connection con) {
        try {
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("select email from HR where email='" + email + "'");
            if (rs.next() == true) {
                return true;
            } else {
                return false;
            }
        } catch (Exception e) {
            return false;
        }      
    }
}
