/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Main;

import Model.Attendance;
import Model.Employee;
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
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
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
public class AttendanceController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/plain");
        PrintWriter out = response.getWriter();

        if (request.getHeader("api_key") != null && Helper.validateAPIKEY(request.getHeader("api_key"))) {
            if (request.getParameter("task") != null) {
                switch (request.getParameter("task")) {
                    case Constants.GET_EMP_ATTENDANCE:
                        out.print(getEmployeeAttendance(request.getSession(false)));
                        break;
                    default:
                        out.print("invalidRequest");
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

        
        
    }

    private String getEmployeeAttendance(HttpSession session) {
        List<Attendance> employeeAttendance = new ArrayList<>();
        Connection con = new ConnectionManager().getConnection();
        String flag = Constants.ATTENDANCE_ABSENT;
        try {
            int rfidNumber = ((Employee) session.getAttribute("userData")).getRfid().getRFIDNUMBER();
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("select attendenceid,checkin,checkout,flag from ATTENDENCE where rfidnumber=" + rfidNumber);
            if (rs.next() == false) {
                return Constants.ATTENDANCE_NOT_FOUND;
            }
            while (rs.next()) {
                if (rs.getString("flag").equals(Constants.ATTENDANCE_IN)) {
                    flag = "IN";
                } else if (rs.getString("flag").equals(Constants.ATTENDANCE_OUT)) {
                    flag = "OUT";
                }
                String checkIn = Helper.convertDateToString(new Date(rs.getTimestamp("checkin").getTime()), "dd-M-yyyy hh:mm:ss");
                String checkOut = Helper.convertDateToString(new Date(rs.getTimestamp("checkout").getTime()), "dd-M-yyyy hh:mm:ss");
                employeeAttendance.add(new Attendance(rs.getInt("attendenceid"), checkIn, checkOut, flag));
            }
            ObjectMapper mapper = new ObjectMapper();
            return mapper.writeValueAsString(employeeAttendance);
        } catch (Exception e) {
            System.out.println(e);
            return Constants.ERROR;
        } finally {
            try {
                con.close();
            } catch (SQLException ex) {
                Logger.getLogger(AttendanceController.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

}
