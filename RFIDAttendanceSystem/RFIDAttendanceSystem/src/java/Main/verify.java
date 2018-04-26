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
import java.sql.Statement;
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
        try {
            Connection con = new ConnectionManager().getConnection();
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("select WORK,FLAG from VERIFICATION where CODE='" + code + "'");
            if (rs.first()) {
                rs.absolute(1); // goes to first row
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
        }
    }
    
    private String getEmailVerified(String code) {
        try {
            Connection con = new ConnectionManager().getConnection();
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("select REFERENCEID from VERIFICATION where CODE='" + code + "'");
            if (rs.first()) {
                rs.absolute(1); // goes to first row
                int counter = stmt.executeUpdate("update EMPLOYEES SET FLAG='" + Constants.USER_ACTIVE + "' where EMPLOYEEID=" + rs.getInt("REFERENCEID"));
                if (counter > 0) {
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
        }
    }
}
