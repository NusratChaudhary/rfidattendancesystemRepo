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
public class Attendance_M {

    private int AttendanceId;
    private String checkIn;
    private String checkOut;
    private String flag;

    public Attendance_M() {
    }

    public Attendance_M(int AttendanceId, String checkIn, String checkOut, String flag) {
        this.AttendanceId = AttendanceId;
        this.checkIn = checkIn;
        this.checkOut = checkOut;
        this.flag = flag;
    }

    public String getFlag() {
        return flag;
    }

    public void setFlag(String flag) {
        this.flag = flag;
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

}
