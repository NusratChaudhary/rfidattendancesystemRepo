/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Main;

import Shared.ConnectionManager;
import Shared.Constants;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author mohnish
 */
public class verify extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/plain");
        PrintWriter out = response.getWriter();

        String code = request.getParameter("code");

        switch (getTask(code)) {
            case Constants.MODE_VERIFY_EMAIL:
                out.print(getEmailVerified(code));
                break;
            case Constants.COMPLETED:
                out.print(Constants.ALREADY_VERIFIED);
                break;
            case Constants.ERROR:
                out.print(Constants.ERROR);
                break;
            default:
                out.print(Constants.ERROR);

        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    private String getTask(String code) {
        Connection con = new ConnectionManager().getConnection();

        try {
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("select WORK,FLAG from VERIFICATION where CODE='" + code + "'");
            if (rs.next()) {

                if (rs.getString("FLAG").equals(Constants.COMPLETED)) {
                    return Constants.COMPLETED;
                }
                return rs.getString("WORK");
            } else {
                return Constants.ERROR;
            }

        } catch (Exception e) {
            System.out.println(e);
            return Constants.ERROR;
        } finally {
            try {
                con.close();
            } catch (SQLException ex) {
                Logger.getLogger(Login.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    private String getEmailVerified(String code) {
        Connection con = new ConnectionManager().getConnection();

        try {
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("select REFERENCEID from VERIFICATION where CODE='" + code + "'");
            if (rs.next()) {
                int counter = stmt.executeUpdate("update EMPLOYEES SET FLAG='" + Constants.USER_ACTIVE + "' where EMPLOYEEID=" + rs.getInt("REFERENCEID"));
                if (counter > 0) {
                    stmt.executeUpdate("update VERIFICATION set flag='" + Constants.COMPLETED + "' where code='" + code + "'");
                    return Constants.COMPLETED;
                } else {
                    return Constants.ERROR;
                }
            } else {
                return Constants.ERROR;
            }
        } catch (Exception e) {
            System.out.println(e);
            return Constants.ERROR;
        } finally {
            try {
                con.close();
            } catch (SQLException ex) {
                Logger.getLogger(Login.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }
}
