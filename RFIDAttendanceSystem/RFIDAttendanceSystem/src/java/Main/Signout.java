/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Main;

import Shared.Constants;
import Shared.Helper;
import Shared.SessionManager;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author mohnish
 */
public class Signout extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/plain");
        PrintWriter out = response.getWriter();
        if (request.getHeader("api_key") != null && Helper.validateAPIKEY(request.getHeader("api_key"))) {
            HttpSession session = request.getSession();
            if (session.getAttribute("isUserAdmin") != null) {
                SessionManager.removeSession(String.valueOf(session.getAttribute("id")));
            } else {
                int employeeId = (Integer) session.getAttribute("id");
                SessionManager.removeSession(String.valueOf(employeeId));
            }
            session.invalidate();
            out.print(Constants.LOGGED_OUT);
        } else {
            out.print("invalidRequest");
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

}
