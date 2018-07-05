/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Shared;

import Model.Pin;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Hashtable;
import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author mohnish
 */
public class SecretPinManager {

    static Hashtable<Integer, Pin> pinList = new Hashtable<Integer, Pin>();

    public static Pin createPin(int employeeId, String type, Connection con, String mobileNumber) {
        try {
            int pinNumber = 0;
            int recordId = Math.abs(new Random().nextInt());
            while (true) {
                pinNumber = Math.abs(new Random().nextInt(999999));
                if (!pinList.containsKey(pinNumber)) {  // avoids duplicate pin number
                    break;
                }
            }
            PreparedStatement ps = con.prepareStatement("insert into SECRETPIN values (?,?,?,?,?,?)");
            ps.setInt(1, recordId);
            ps.setInt(2, employeeId);
            ps.setInt(3, pinNumber);
            ps.setString(4, type);
            ps.setString(5, Constants.PIN_ACTIVE);
            ps.setString(6, mobileNumber);
            ps.executeUpdate();
            Pin pinData = new Pin(recordId, pinNumber, employeeId, type, mobileNumber, true);
            pinList.put(pinNumber, pinData);
            return pinData;
        } catch (Exception e) {
            System.out.println(e);
            return null;
        }
    }

    public static String sendPin(Pin pinData) {
        try {
            if (pinData.getType().equals(Constants.PIN_TYPE_OTP)) {
                new SMSManager().SendSMS(pinData.getMobileNumber(), Constants.PIN_MESSAGE_OTP + pinData.getPinNumber());
            } else {
                new SMSManager().SendSMS(pinData.getMobileNumber(), Constants.PIN_MESSAGE_ADMIN + pinData.getPinNumber());
            }
            return Constants.OK;
        } catch (Exception e) {
            System.out.println(e);
            return Constants.ERROR;
        }
    }

    public static String validatePin(int employeeId, String type, String pin, Connection con) {
        try {
            if (pinList.containsKey(Integer.valueOf(pin))) {
                Pin pinData = pinList.get(Integer.valueOf(pin));
                if (pinData.getEmployeeId() == employeeId && pinData.getType().equals(type)) {
                    if (pinData.getIsActive()) {
                        if (changePINStatus(pinData, con)) {
                            pinData.setIsActive(false);
                            pinList.replace(Integer.valueOf(pin), pinData);
                            return Constants.OK;
                        } else {
                            return Constants.ERROR;
                        }
                    } else {
                        return Constants.PIN_USED;
                    }
                } else {
                    return Constants.PIN_INCORRECT;
                }
            } else {
                return Constants.PIN_INCORRECT;
            }
        } catch (Exception e) {
            System.out.println(e);
            return Constants.ERROR;
        }
    }

    public static boolean changePINStatus(Pin pinData, Connection con) {
        try {
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("select RFIDNUMBER from RFID where EMPLOYEEID=" + pinData.getEmployeeId());
            rs.next();
            int rfidNumber = rs.getInt("RFIDNUMBER");
            Statement stmt2 = con.createStatement();
            int count = stmt2.executeUpdate("update SECRETPIN set FLAG='" + Constants.PIN_USED + "' where ID=" + pinData.getId());
            Statement stmt3 = con.createStatement();
            count += stmt3.executeUpdate("update attendence set FLAG='" + Constants.ATTENDANCE_IN + "' where  TO_DATE(TO_CHAR(CHECKIN,'DD-MM-YYYY'),'DD-MM-YYYY')=TO_DATE(TO_CHAR(current_timestamp,'DD-MM-YYYY'),'DD-MM-YYYY') AND RFIDNUMBER=" + rfidNumber);
            return count == 2;
        } catch (Exception e) {
            System.out.println(e);
            return false;
        }
    }

    public static void initializePin() {
        Connection con = new ConnectionManager().getConnection();
        String query = "select * from SECRETPIN  where FLAG='" + Constants.PIN_ACTIVE + "'";
        pinList.clear();
        try {
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(query);
            while (rs.next()) {
                pinList.put(rs.getInt("PINNUMBER"), new Pin(rs.getInt("ID"), rs.getInt("PINNUMBER"), rs.getInt("EMPLOYEEID"), rs.getString("PINTYPE"), rs.getString("MOBILENUMBER"), true));
            }
        } catch (Exception e) {
            System.out.println(e);
        } finally {
            try {
                con.close();
            } catch (SQLException ex) {
                Logger.getLogger(SecretPinManager.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    public static void removePin(int pinNumber) {
        pinList.remove(pinNumber);
    }
}
