/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Shared;

import com.fasterxml.jackson.databind.ObjectMapper;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;

/**
 *
 * @author mohnish
 */
public class Helper {

    public static boolean validateAPIKEY(String key) {
        return key.equals(Constants.API_KEY);
    }

    public static String getMD5Hash(String data) throws NoSuchAlgorithmException {
        MessageDigest md = MessageDigest.getInstance("MD5");
        md.update(data.getBytes());

        byte byteData[] = md.digest();

        StringBuffer sb = new StringBuffer();
        for (int i = 0; i < byteData.length; i++) {
            sb.append(Integer.toString((byteData[i] & 0xff) + 0x100, 16).substring(1));
        }

        return sb.toString();
    }

    public static boolean checkIfExist(Connection con, String query, String columnName, String type, String conditionValue) {

        try {
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(query);
            while (rs.next()) {
                if (type.equals(Constants.TYPE_INT)) {
                    if (conditionValue != null) {
                        return rs.getInt(columnName) == Integer.parseInt(conditionValue);
                    } else {
                        return rs.getInt(columnName) == Integer.parseInt(conditionValue);
                    }
                }
                if (type.equals(Constants.TYPE_STRING)) {
                    if (conditionValue != null) {
                        return rs.getString(columnName).equals(conditionValue);
                    } else {
                        return rs.getString(columnName).isEmpty();
                    }
                }
            }
            return false;
        } catch (Exception e) {
            System.out.println(e);
            return false;
        }
    }

    public static String convertDateToString(Date date, String format) {
        DateFormat dateFormat = new SimpleDateFormat(format);
        return dateFormat.format(date);
    }

    public static java.sql.Timestamp getCurrentTimeStamp() {
        java.util.Date today = new java.util.Date();
        return new java.sql.Timestamp(today.getTime());  // 2018-05-20 06:32:58.157
    }
}
