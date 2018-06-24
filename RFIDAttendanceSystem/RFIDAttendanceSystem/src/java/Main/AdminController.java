/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Main;

import Model.Employee;
import Shared.Constants;
import Shared.Helper;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author mohnish
 */
public class AdminController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/plain");
        PrintWriter out = response.getWriter();
        if (request.getHeader("api_key") != null && Helper.validateAPIKEY(request.getHeader("api_key"))) {
            if (request.getParameter("task") != null) {
                if (request.getSession(false).getAttribute("isUserAdmin") != null && (Boolean) request.getSession(false).getAttribute("isUserAdmin")) {
                    switch (request.getParameter("task")) {
                        case Constants.GET_ALL_ATTENDANCE:
                            out.print(new AttendanceController().getAllEmployeeAttendance(null, null));

                            break;
                        case Constants.GET_ALL_EMPLOYEES:
                            out.print(new EmployeeController().getAllEmployees());
                            break;
                    }
                } else {
                    out.print(Constants.ERROR);
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
                if (request.getSession(false).getAttribute("isUserAdmin") != null && (Boolean) request.getSession(false).getAttribute("isUserAdmin")) {
                    switch (request.getParameter("task")) {
                        case Constants.DELETE_EMPLOYEE:
                            out.print(new EmployeeController().deleteEmployee(request));
                            break;
                        case Constants.EDIT_EMPLOYEE:
                            Employee employee = new ObjectMapper().readValue(request.getParameter("employee"), Employee.class);
                            out.print(new EmployeeController().editEmployee(employee));
                            break;
                    }
                } else {
                    out.print(Constants.ERROR);
                }
            } else {
                out.print("invalidRequest");
            }
        } else {
            out.print("invalidRequest");
        }
    }
}
