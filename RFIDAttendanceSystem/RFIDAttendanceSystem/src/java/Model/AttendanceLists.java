/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.util.List;

/**
 *
 * @author mohnish
 */
public class AttendanceLists {

    private String date;
    private List<Attendance> attendanceList;

    public AttendanceLists(String date, List<Attendance> attendanceList) {
        this.date = date;
        this.attendanceList = attendanceList;
    }

    public AttendanceLists() {
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public List<Attendance> getAttendanceList() {
        return attendanceList;
    }

    public void setAttendanceList(List<Attendance> attendanceList) {
        this.attendanceList = attendanceList;
    }

}
