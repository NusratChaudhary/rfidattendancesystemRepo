/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Main;

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
                        case Constants.ADD_NEW_HR:
                            out.print(addHrUser(Integer.parseInt(request.getParameter("employeeId"))));
                            break;
                        case Constants.DELETE_HR:
                            out.print(deleteHrUser(Integer.parseInt(request.getParameter("employeeId"))));
                            break;
                        case Constants.DISABLE_HR:
                            out.print(toggleHrUserStatus(Integer.parseInt(request.getParameter("employeeId")), false));
                            break;
                        case Constants.ENABLE_HR:
                            out.print(toggleHrUserStatus(Integer.parseInt(request.getParameter("employeeId")), true));
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

    private String addHrUser(int employeeId) {
        Connection con = new ConnectionManager().getConnection();
        try {
            PreparedStatement ps = con.prepareStatement("insert into hr values(?,?)");
            ps.setInt(1, employeeId);
            ps.setString(2, Constants.USER_ACTIVE);
            int count = ps.executeUpdate();
            return count == 1 ? Constants.OK : Constants.ERROR;
        } catch (Exception e) {
            System.out.println(e);
            return Constants.ERROR;
        } finally {
            try {
                con.close();
            } catch (SQLException ex) {
                Logger.getLogger(AdminController.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    private String deleteHrUser(int employeeId) {
        Connection con = new ConnectionManager().getConnection();
        try {
            Statement stmt = con.createStatement();
            int count = stmt.executeUpdate("delete from hr where employeeId=" + employeeId);
            return count == 1 ? Constants.OK : Constants.ERROR;
        } catch (Exception e) {
            System.out.println(e);
            return Constants.ERROR;
        } finally {
            try {
                con.close();
            } catch (SQLException ex) {
                Logger.getLogger(AdminController.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    private String toggleHrUserStatus(int employeeId, boolean flag) {
        Connection con = new ConnectionManager().getConnection();
        try {
            Statement stmt = con.createStatement();
            String userflag = flag ? Constants.USER_ACTIVE : Constants.USER_INACTIVE;
            int count = stmt.executeUpdate("update hr set flag='" + userflag + "' where employeeId=" + employeeId);
            return count == 1 ? Constants.OK : Constants.ERROR;
        } catch (Exception e) {
            System.out.println(e);
            return Constants.ERROR;
        } finally {
            try {
                con.close();
            } catch (SQLException ex) {
                Logger.getLogger(AdminController.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }
}
