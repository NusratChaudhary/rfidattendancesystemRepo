/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Main;

import Model.Attendance;
import Model.AttendanceLists;
import Model.Employee;
import Shared.ConnectionManager;
import Shared.Constants;
import Shared.Helper;
import Shared.SecretPinManager;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;
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
                    case Constants.GET_ALL_ATTENDANCE:
                        if (((Employee) request.getSession(false).getAttribute("userData")).isUserHr()) {
                            out.print(getAllEmployeeAttendance(null, null));
                        } else {
                            out.print(Constants.ERROR);
                        }
                        break;
                    case Constants.GET_CURRENT_CHECKINS:
                        out.print(getCurrentCheckinData());
                        break;
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
            Connection con = new ConnectionManager().getConnection();
            if (request.getParameter("task") != null && ((Employee) request.getSession(false).getAttribute("userData")).isUserHr() && request.getParameter("pin") == null) {
                switch (request.getParameter("task")) {
                    case Constants.UPDATE_ATTENDANCE:
                        out.print(updateRecord(con, Integer.parseInt(request.getParameter("attendanceId")), request.getParameter("checkIn"), request.getParameter("checkOut")));
                        break;
                    case Constants.DELETE_ATTENDANCE:
                        out.print(deleteRecord(con, Integer.parseInt(request.getParameter("attendanceId"))));
                        break;
                    case Constants.GET_SPECIFIC_RECORDS:
                        out.print(getAllEmployeeAttendance(request.getParameter("fromDate"), request.getParameter("toDate")));
                        break;
                }
            } else {
                if (request.getParameter("rfid") != null) {
                    String employeeStatus = getEmployeeStatus(con, Integer.parseInt(request.getParameter("rfid")));
                    if (employeeStatus.equals(Constants.OK)) {
                        switch (getEmployeeAttendanceStatus(Integer.parseInt(request.getParameter("rfid")), con)) {
                            case Constants.ATTENDANCE_IN:
                                out.print(CheckOutEmployee(Integer.parseInt(request.getParameter("rfid")), con));
                                break;
                            case Constants.ATTENDANCE_NOT_FOUND:
                                out.print(CheckInEmployee(Integer.parseInt(request.getParameter("rfid")), con));
                                break;
                            case Constants.ATTENDANCE_VERIFY:
                                out.print(Constants.ATTENDANCE_VERIFY);
                                break;
                            case Constants.ATTENDANCE_ALREADY_COMPLETED:
                                out.print(Constants.ATTENDANCE_ALREADY_COMPLETED);
                                break;
                            default:
                                out.print(Constants.ERROR);
                        }
                    } else {
                        out.print(employeeStatus);
                    }
                } else if (request.getParameter("pin") != null && request.getParameter("task") != null && request.getParameter("id") != null) {
                    switch (request.getParameter("task")) {
                        case Constants.VERIFY_CHECKIN:
                            out.print(verifyCheckInEmployee(
                                    Integer.parseInt(request.getParameter("id")),
                                    request.getParameter("pin"),
                                    new ConnectionManager().getConnection(),
                                    request.getSession(false))
                            );
                            break;
                        default:
                            out.print(Constants.ERROR);
                    }
                } else {
                    out.print("invalidRequest");
                }
            }
            try {
                con.close();
            } catch (SQLException ex) {
                Logger.getLogger(AttendanceController.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else {
            out.print("invalidRequest");
        }
    }

    private String getEmployeeAttendance(HttpSession session) {
        List<Attendance> employeeAttendance = new ArrayList<>();
        Connection con = new ConnectionManager().getConnection();
        String flag = null;
        try {
            int rfidNumber = ((Employee) session.getAttribute("userData")).getRfid().getRfidnumber();
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("select attendenceid,checkin,checkout,flag from ATTENDENCE where rfidnumber=" + rfidNumber);
            while (rs.next()) {
                if (rs.getString("flag").equals(Constants.ATTENDANCE_IN)) {
                    flag = "IN";
                } else if (rs.getString("flag").equals(Constants.ATTENDANCE_OUT)) {
                    flag = "PRESENT";
                } else if (rs.getString("flag").equals(Constants.ATTENDANCE_VERIFY)) {
                    flag = "VERIFICATION";
                } else {
                    flag = "ABSENT";
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

    protected String getAllEmployeeAttendance(String fromDate, String toDate) {
        Connection con = new ConnectionManager().getConnection();
        List<AttendanceLists> employeesAttendanceList = new ArrayList<>();
        List<Attendance> attendanceList = new ArrayList<>();
        try {
            String flag;
            Statement stmt = con.createStatement();
            Statement stmt2 = con.createStatement();
            Statement stmt3 = con.createStatement();
            ResultSet creationDateSet = null;
            if (fromDate != null && toDate != null) {
                creationDateSet = stmt.executeQuery("select  DISTINCT to_char(CREATIONDATE,'DD-MM-YY') AS CREATIONDATE from ATTENDENCE where TO_DATE(TO_CHAR(CREATIONDATE,'DD-MM-YY')) BETWEEN  TO_DATE('" + fromDate + "', 'DD-MM-YY') AND TO_DATE('" + toDate + "', 'DD-MM-YY')");
            } else {
                creationDateSet = stmt.executeQuery("select  DISTINCT to_char(CREATIONDATE,'DD-MM-YY') AS CREATIONDATE from ATTENDENCE");
            }
            while (creationDateSet.next()) {
                ResultSet attendanceSet = stmt2.executeQuery("select ATTENDENCEID,RFIDNUMBER,TO_CHAR(CHECKIN,'DD-MM-YY HH24:MI:SS') AS CHECKIN,TO_CHAR(CHECKOUT,'DD-MM-YY HH24:MI:SS') AS CHECKOUT,FLAG from attendence where to_char(CREATIONDATE,'DD-MM-YY')= '" + creationDateSet.getString("CREATIONDATE") + "'");
                attendanceList.clear();
                while (attendanceSet.next()) {
                    flag = attendanceSet.getString("flag");
                    switch (flag) {
                        case Constants.ATTENDANCE_IN:
                            flag = "Checked In";
                            break;
                        case Constants.ATTENDANCE_ABSENT:
                            flag = "Absent";
                            break;
                        case Constants.ATTENDANCE_OUT:
                            flag = "Checked Out";
                            break;
                        case Constants.ATTENDANCE_VERIFY:
                            flag = "Verification";
                            break;
                        default:
                            flag = "ERR";
                    }
                    ResultSet employeeDataSet = stmt3.executeQuery("select employeeId,firstName||' '||lastName as \"employeeName\"  from employees where employeeId IN (select employeeId from rfid where rfidnumber=" + attendanceSet.getInt("RFIDNUMBER") + ")");
                    employeeDataSet.next();
                    attendanceList.add(new Attendance(
                            attendanceSet.getInt("ATTENDENCEID"),
                            attendanceSet.getString("CHECKIN"),
                            attendanceSet.getString("CHECKOUT"),
                            flag,
                            employeeDataSet.getInt("employeeId"),
                            employeeDataSet.getString("employeeName"),
                            attendanceSet.getInt("RFIDNUMBER")
                    ));

                }
                employeesAttendanceList.add(new AttendanceLists(creationDateSet.getString("CREATIONDATE"), attendanceList));
            }
            ObjectMapper mapper = new ObjectMapper();
            if (mapper.writeValueAsString(employeesAttendanceList).equals("[]")) {
                return Constants.ATTENDANCE_NOT_FOUND;
            } else {
                return mapper.writeValueAsString(employeesAttendanceList);
            }

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

    private String getEmployeeAttendanceStatus(int rfidNumber, Connection con) {
        try {
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("select flag from ATTENDENCE WHERE TO_DATE(TO_CHAR(CHECKIN,'DD-MM-YYYY'),'DD-MM-YYYY')=TO_DATE(TO_CHAR(current_timestamp,'DD-MM-YYYY'),'DD-MM-YYYY') AND RFIDNUMBER=" + rfidNumber);
            if (rs.next()) {
                if (rs.getString("flag").equals(Constants.ATTENDANCE_IN)) {
                    return Constants.ATTENDANCE_IN;
                }
                if (rs.getString("flag").equals(Constants.ATTENDANCE_OUT)) {
                    return Constants.ATTENDANCE_ALREADY_COMPLETED;
                }
                if (rs.getString("flag").equals(Constants.ATTENDANCE_VERIFY)) {
                    return Constants.ATTENDANCE_VERIFY;
                }
            } else {
                return Constants.ATTENDANCE_NOT_FOUND;
            }

            return Constants.ERROR;
        } catch (Exception e) {
            System.out.println(e);
            return Constants.ERROR;
        }
    }

    private String CheckInEmployee(int rfidNumber, Connection con) {
        try {
            PreparedStatement ps = con.prepareStatement("insert into ATTENDENCE values(?,?,?,?,?,?)");
            ps.setInt(1, Math.abs(new Random().nextInt(9999999)));
            ps.setInt(2, rfidNumber);
            ps.setTimestamp(3, Helper.getCurrentTimeStamp());
            ps.setTimestamp(4, null);
            ps.setString(5, Constants.ATTENDANCE_VERIFY);
            ps.setTimestamp(6, Helper.getCurrentTimeStamp());
            int result = ps.executeUpdate();
            if (result == 1) {
                Employee emp = getEmployeeData(rfidNumber, con);
                SecretPinManager.sendPin(SecretPinManager.createPin(emp.getEmployeeId(), Constants.PIN_TYPE_OTP, con, emp.getPhoneNumber()));
                return Constants.ATTENDANCE_IN;
            } else {
                return Constants.ERROR;
            }
        } catch (Exception e) {
            System.out.println(e);
            return Constants.ERROR;
        }

    }

    private String verifyCheckInEmployee(int employeeId, String pinNumber, Connection con, HttpSession userSession) {
        try {
            String status = null;
            String pinStatus = SecretPinManager.validatePin(employeeId, Constants.PIN_TYPE_OTP, pinNumber, con);
            switch (pinStatus) {
                case Constants.OK:
                    Employee employee = (Employee) userSession.getAttribute("userData");
                    employee.getRfid().setVerifyCheckin(false);
                    ObjectMapper mapper = new ObjectMapper();
                    String userJson = mapper.writeValueAsString(employee);
                    userSession.setAttribute("userJson", userJson);
                    userSession.setAttribute("userData", employee);
                    status = Constants.OK;
                    break;
                case Constants.PIN_USED:
                    status = Constants.PIN_USED;
                    break;
                case Constants.PIN_INCORRECT:
                    status = Constants.PIN_INCORRECT;
                    break;
                case Constants.ERROR:
                    status = Constants.ERROR;
                    break;
            }
            return status;
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

    private String CheckOutEmployee(int rfidNumber, Connection con) {
        try {
            PreparedStatement pstmt = con.prepareStatement("update ATTENDENCE set Flag='" + Constants.ATTENDANCE_OUT + "', CHECKOUT=? where RFIDNUMBER=" + rfidNumber + " AND Flag='" + Constants.ATTENDANCE_IN + "'");
            pstmt.setTimestamp(1, Helper.getCurrentTimeStamp());
            // has to keep second condition flag because if emp stay for all night then sys wont get 
            // todays date it will get next days date on currenttimestamp
            int result = pstmt.executeUpdate();
            if (result == 1) {
                return Constants.ATTENDANCE_OUT;
            } else {
                return Constants.ERROR;
            }
        } catch (Exception e) {
            System.out.println(e);
            return Constants.ERROR;
        }
    }

    private String getEmployeeStatus(Connection con, int rfidNumber) {
        try {
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("select flag from employees where EMPLOYEEID= (select EMPLOYEEID from rfid where rfid.RFIDNUMBER=" + rfidNumber + ")");
            if (rs.next()) {
                if (rs.getString("flag").equals(Constants.USER_HOLIDAY)) {
                    return Constants.USER_HOLIDAY;
                }
                if (rs.getString("flag").equals(Constants.USER_INACTIVE)) {
                    return Constants.USER_INACTIVE;
                }
                if (rs.getString("flag").equals(Constants.USER_VERIFY)) {
                    return Constants.USER_VERIFY;
                }
                return Constants.OK;
            } else {
                return Constants.RFID_CARD_NOT_AVAILABLE;
            }
        } catch (Exception e) {
            System.out.println(e);
            return Constants.ERROR;
        }
    }

    private String deleteRecord(Connection con, int attendanceId) {
        try {
            Statement stmt = con.createStatement();
            int count = stmt.executeUpdate("delete from attendence where ATTENDENCEID=" + attendanceId);
            if (count == 1) {
                return Constants.OK;
            } else {
                return Constants.ERROR;
            }
        } catch (Exception e) {
            System.out.println(e);
            return Constants.ERROR;
        }
    }

    private String updateRecord(Connection con, int attendanceId, String checkIn, String checkOut) {
        try {
            Statement stmt = con.createStatement();
            int count = stmt.executeUpdate("update attendence set CHECKIN=TO_TIMESTAMP('" + checkIn + "', 'DD-MM-YY HH24:MI:SS'), CHECKOUT=TO_TIMESTAMP('" + checkOut + "', 'DD-MM-YY HH24:MI:SS') where ATTENDENCEID=" + attendanceId);
            if (count == 1) {
                return Constants.OK;
            } else {
                return Constants.ERROR;
            }
        } catch (Exception e) {
            System.out.println(e);
            return Constants.ERROR;
        }
    }

    private String getCurrentCheckinData() {
        Connection con = new ConnectionManager().getConnection();
        try {
            List<Attendance> attendanceList = new ArrayList<>();
            String flag = null;
            Statement stmt = con.createStatement();
            Statement stmt2 = con.createStatement();
            ResultSet attendanceSet = stmt.executeQuery("select ATTENDENCEID,RFIDNUMBER,TO_CHAR(CHECKIN,'DD-MM-YY HH24:MI:SS') AS CHECKIN,TO_CHAR(CHECKOUT,'DD-MM-YY HH24:MI:SS') AS CHECKOUT,FLAG from ATTENDENCE where TO_DATE(TO_CHAR(CHECKIN,'DD-MM-YYYY'),'DD-MM-YYYY') = TO_DATE(TO_CHAR(current_timestamp,'DD-MM-YYYY'),'DD-MM-YYYY')");
            while (attendanceSet.next()) {
                flag = attendanceSet.getString("flag");
                switch (flag) {
                    case Constants.ATTENDANCE_IN:
                        flag = "Checked In";
                        break;
                    case Constants.ATTENDANCE_ABSENT:
                        flag = "Absent";
                        break;
                    case Constants.ATTENDANCE_OUT:
                        flag = "Checked Out";
                        break;
                    case Constants.ATTENDANCE_VERIFY:
                        flag = "Verification";
                        break;
                    default:
                        flag = "ERR";
                }
                ResultSet employeeDataSet = stmt2.executeQuery("select employeeId,firstName||' '||lastName as \"employeeName\"  from employees where employeeId IN (select employeeId from rfid where rfidnumber=" + attendanceSet.getInt("RFIDNUMBER") + ")");
                employeeDataSet.next();
                attendanceList.add(new Attendance(
                        attendanceSet.getInt("ATTENDENCEID"),
                        attendanceSet.getString("CHECKIN"),
                        attendanceSet.getString("CHECKOUT"),
                        flag,
                        employeeDataSet.getInt("employeeId"),
                        employeeDataSet.getString("employeeName"),
                        attendanceSet.getInt("RFIDNUMBER")
                ));
            }
            ObjectMapper mapper = new ObjectMapper();
            if (mapper.writeValueAsString(attendanceList).equals("[]")) {
                return Constants.ATTENDANCE_NOT_FOUND;
            } else {
                return mapper.writeValueAsString(attendanceList);
            }
        } catch (Exception e) {
            System.out.println(e);
            return Constants.ERROR;
        } finally {
            try {
                con.close();
            } catch (SQLException ex) {
                Logger.getLogger(LiveCounter.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    private Employee getEmployeeData(int rfidNumber, Connection con) {
        try {
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("select EMPLOYEEID,PHONENUMBER from EMPLOYEES where  employeeId IN (select employeeId from RFID where RFIDNUMBER=" + rfidNumber + ")");
            rs.next();
            return new Employee(rs.getInt("EMPLOYEEID"), rs.getString("PHONENUMBER"));
        } catch (Exception e) {
            System.out.println(e);
            return null;
        }
    }
}
