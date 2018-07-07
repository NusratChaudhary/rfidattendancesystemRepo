/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Automate;

import Shared.ConnectionManager;
import Shared.Constants;
import Shared.Helper;
import Shared.SecretPinManager;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;

/**
 *
 * @author mohnish
 */
public class DawnJobs implements Job {

    @Override
    public void execute(JobExecutionContext jec) throws JobExecutionException {
        final Jobs jobs = new Jobs();
        Thread clearSecretPinsThread = new Thread() {
            @Override
            public void run() {
                jobs.clearSecretPinTable();
            }
        };
        Thread checkOutUsersThread = new Thread() {
            @Override
            public void run() {
                jobs.checkOutUsers();
            }
        };
        Thread sendAdminPinThread = new Thread() {
            @Override
            public void run() {
                jobs.sendAdminPin();
            }
        };// all methods are sync and we are using once object so when one mehtod gets called it locks object until it completes and then other thread in queue can access
        clearSecretPinsThread.start();
        checkOutUsersThread.start();
        sendAdminPinThread.start();
    }

}

class Jobs {

    Connection con = new ConnectionManager().getConnection();
    int taskCompleted = 0;

    synchronized void clearSecretPinTable() {
        System.out.println("JOB 1 Done");
        try {
            Statement stmt = con.createStatement();
            stmt.executeUpdate("truncate TABLE SECRETPIN");
        } catch (Exception e) {
            System.out.println(e);
        }
        taskCompleted++;
        closeConnection();
    }

    synchronized void checkOutUsers() {
        System.out.println("JOB 2 Done");
        try {
            SimpleDateFormat sdf = new SimpleDateFormat("dd-M-yyyy");
            SimpleDateFormat sdf2 = new SimpleDateFormat("dd-M-yyyy hh:mm:ss");
            Date date = sdf2.parse(sdf.format(new Date()) + " 17:00:00");
            PreparedStatement pstmt = con.prepareStatement("update ATTENDENCE set Flag='" + Constants.ATTENDANCE_OUT + "', CHECKOUT=? where CHECKOUT IS NULL AND  Flag='" + Constants.ATTENDANCE_IN + "'");
            pstmt.setTimestamp(1, new java.sql.Timestamp(date.getTime()));
            pstmt.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
        taskCompleted++;
        closeConnection();
    }

    synchronized void sendAdminPin() {
        System.out.println("JOB 3 Done");
        try {
            SecretPinManager.sendPin(SecretPinManager.createPin(1234567, Constants.PIN_TYPE_ADMINPIN, con, "9769884996"));
        } catch (Exception e) {
            System.out.println(e);
        }
        taskCompleted++;
        closeConnection();
    }

    void closeConnection() {
        if (taskCompleted == 3) {
            try {
                con.close();
            } catch (SQLException ex) {
                Logger.getLogger(Jobs.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }
}
