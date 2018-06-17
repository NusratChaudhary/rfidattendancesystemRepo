/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Main;

import Model.Employee;
import Model.Employees;
import Model.Rfid;
import Shared.ConnectionManager;
import Shared.Constants;
import Shared.Helper;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
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
public class EmployeeController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/plain");
        PrintWriter out = response.getWriter();
        if (request.getHeader("api_key") != null && Helper.validateAPIKEY(request.getHeader("api_key"))) {
            if (((Employee) request.getSession(false).getAttribute("userData")).isUserHr()) {
                out.print(getAllEmployees());
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
            if (((Employee) request.getSession(false).getAttribute("userData")).isUserHr()) {
                switch (request.getParameter("task")) {
                    case Constants.DELETE_EMPLOYEE:
                        out.print(deleteEmployee(request));
                        break;
                    case Constants.EDIT_EMPLOYEE:
                        out.print(editEmployee(request));
                        break;
                }
            } else {
                out.print("invalidRequest");
            }
        } else {
            out.print("invalidRequest");
        }
    }

    protected String getAllEmployees() {
        Connection con = new ConnectionManager().getConnection();
        List<Employee> employeeList = new ArrayList<>();
        int totalEmployees = 0, employeesHoliday = 0, employeesDisabled = 0;
        try {
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("select * from EMPLOYEES");
            while (rs.next()) {
                if (!rs.getString("FLAG").equals(Constants.USER_DELETED)) {
                    int salary = 0;
                    String departmentName = null;
                    int rfidNumber = 0;
                    Statement stmt2 = con.createStatement();
                    ResultSet rs2 = stmt2.executeQuery("select RFIDNUMBER from RFID where EMPLOYEEID=" + rs.getInt("EMPLOYEEID"));
                    while (rs2.next()) {
                        rfidNumber = rs2.getInt("RFIDNUMBER");
                    }
                    Statement stmt3 = con.createStatement();
                    ResultSet rs3 = stmt3.executeQuery("select * from SALARY where EMPLOYEEID=" + rs.getInt("EMPLOYEEID"));
                    while (rs3.next()) {
                        salary = rs3.getInt("AMOUNT");
                        Statement stmt4 = con.createStatement();
                        ResultSet rs4 = stmt4.executeQuery("select DEPTNAME from DEPARTMENT where DEPTID=" + rs3.getInt("DEPTID"));
                        while (rs4.next()) {
                            departmentName = rs4.getString("DEPTNAME");
                        }
                    }
                    employeeList.add(new Employee(
                            rs.getInt("EMPLOYEEID"),
                            Helper.convertDateToString(new Date(rs.getDate("DOB").getTime()), "yyyy-MM-dd"),
                            rs.getString("FIRSTNAME"),
                            rs.getString("LASTNAME"),
                            rs.getString("GENDER"),
                            rs.getString("PHONENUMBER"),
                            rs.getString("EMAIL"),
                            rs.getString("ADDRESS"),
                            new Rfid(rfidNumber),
                            salary,
                            departmentName
                    ));
                    if (rs.getString("FLAG").equals(Constants.USER_HOLIDAY)) {
                        employeesHoliday++;
                    }
                    if (rs.getString("FLAG").equals(Constants.USER_INACTIVE)) {
                        employeesDisabled++;
                    }
                }
            }
            totalEmployees = employeeList.size();
            Employees employeesData = new Employees(totalEmployees, employeesHoliday, employeesDisabled, employeeList);
            ObjectMapper mapper = new ObjectMapper();
            return mapper.writeValueAsString(employeesData);
        } catch (Exception e) {
            System.out.println(e);
            return Constants.ERROR;
        } finally {
            try {
                con.close();
            } catch (SQLException ex) {
                Logger.getLogger(EmployeeController.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    protected String deleteEmployee(HttpServletRequest request) {
        Connection con = new ConnectionManager().getConnection();
        try {
            Statement stmt = con.createStatement();
            int count = stmt.executeUpdate("update employees set flag='" + Constants.USER_DELETED + "' where EMPLOYEEID=" + Integer.parseInt(request.getParameter("employeeId")));
            if (count == 1) {
                return Constants.OK;
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
                Logger.getLogger(EmployeeController.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    protected String editEmployee(HttpServletRequest request) {
        Connection con = new ConnectionManager().getConnection();
        try {
            Statement stmt = con.createStatement();

        } catch (Exception e) {
            System.out.println(e);
            return Constants.ERROR;
        } finally {
            try {
                con.close();
            } catch (SQLException ex) {
                Logger.getLogger(EmployeeController.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return null;
    }
}
