/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Shared;

import java.io.IOException;
import java.util.ArrayList;
import java.util.StringTokenizer;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author mohnish
 */
public class IncomingTrafficFilter implements Filter {

    private ArrayList<String> urlList;

    public void init(FilterConfig config) throws ServletException {
        String urls = "/AttendanceControl.jsp;/Broadcast.jsp;/EmployeeDetails.jsp;/EmployeeHome.jsp;/HrDashboard.jsp;/MakeaRequest.jsp;/PendingRequest.jsp;/ViewAttendance.jsp;/AdminController.java;/AttendanceController.java;/BroadcastController.java;/EmployeeController.java;/LiveCounter.java;/Registration.java;/RequestController.java;";
        StringTokenizer token = new StringTokenizer(urls, ";");
        urlList = new ArrayList<String>();
        while (token.hasMoreTokens()) {
            urlList.add(token.nextToken());
        }
        SecretPinManager.initializePin(); // init pins from db in mem if sudden shutdown happens
    }

    public void doFilter(ServletRequest req, ServletResponse resp,
            FilterChain chain) throws IOException, ServletException {
        //parsing to request response object
        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) resp;
        HttpSession session = request.getSession(false);

        if (urlList.contains(request.getServletPath()) && session.getAttribute("id") != null) {
            int employeeId = (Integer) session.getAttribute("id");
            if (SessionManager.sessionExists(String.valueOf(employeeId))) {
                chain.doFilter(req, resp);
            } else {
                session.invalidate();
                response.sendRedirect("welcome.jsp");
            }
        } else {
            chain.doFilter(req, resp);//sends request to next resource  
        }

    }

    public void destroy() {

    }

}
