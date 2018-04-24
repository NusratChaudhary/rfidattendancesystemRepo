/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Main;

import Shared.ConnectionManager;
import Shared.*;
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
            System.out.println("hello");
          out.print(loginUser(request));

        } else {
            out.print("invalidRequest");
        }

    }

    private String loginUser(HttpServletRequest request) {

        try {
            Connection con = new ConnectionManager().getConnection();
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("select flag from EMPLOYEES where EMAIL='" + request.getParameter("email") + "' AND PASSWORD='" + request.getParameter("password")+"'");
            while (rs.next()) {
                if (!rs.getString("flag").isEmpty()) {
                    if (rs.getString("flag").equals(Constants.USER_ACTIVE)) {
                        return Constants.LOGIN_SUCCESS;
                    }
                    if (rs.getString("flag").equals(Constants.USER_HOLIDAY)) {
                        return Constants.LOGIN_HOLIDAY;
                    }
                    if (rs.getString("flag").equals(Constants.USER_VERIFY)) {
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
        }

    }

}
