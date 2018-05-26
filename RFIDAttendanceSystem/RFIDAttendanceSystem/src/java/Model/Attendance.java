/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

/**
 *
 * @author mohnish
 */
public class Attendance {

    private int AttendanceId;
    private String checkIn;
    private String checkOut;
    private String flag;
    private int employeeId;
    private String employeeName;
    private int rfidNumber;

    public Attendance() {
    }

    public Attendance(int AttendanceId, String checkIn, String checkOut, String flag) {
        this.AttendanceId = AttendanceId;
        this.checkIn = checkIn;
        this.checkOut = checkOut;
        this.flag = flag;
    }

    public Attendance(int AttendanceId, String checkIn, String checkOut, String flag, int employeeId, String employeeName, int rfidNumber) {
        this.AttendanceId = AttendanceId;
        this.checkIn = checkIn;
        this.checkOut = checkOut;
        this.flag = flag;
        this.employeeId = employeeId;
        this.employeeName = employeeName;
        this.rfidNumber = rfidNumber;
    }

    public int getAttendanceId() {
        return AttendanceId;
    }

    public void setAttendanceId(int AttendanceId) {
        this.AttendanceId = AttendanceId;
    }

    public String getCheckIn() {
        return checkIn;
    }

    public void setCheckIn(String checkIn) {
        this.checkIn = checkIn;
    }

    public String getCheckOut() {
        return checkOut;
    }

    public void setCheckOut(String checkOut) {
        this.checkOut = checkOut;
    }

    public String getFlag() {
        return flag;
    }

    public void setFlag(String flag) {
        this.flag = flag;
    }

    public int getEmployeeId() {
        return employeeId;
    }

    public void setEmployeeId(int employeeId) {
        this.employeeId = employeeId;
    }

    public String getEmployeeName() {
        return employeeName;
    }

    public void setEmployeeName(String employeeName) {
        this.employeeName = employeeName;
    }

    public void setRfidNumber(int rfidNumber) {
        this.rfidNumber = rfidNumber;
    }

    public int getRfidNumber() {
        return rfidNumber;
    }
}
