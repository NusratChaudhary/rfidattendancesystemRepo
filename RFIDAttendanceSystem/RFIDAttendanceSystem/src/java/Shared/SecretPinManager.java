/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Shared;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Random;
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
public class SecretPinManager extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    protected String createPin(int employeeId, String type) {
        Connection con = new ConnectionManager().getConnection();
        try {
            PreparedStatement ps = con.prepareStatement("insert into SECRETPIN values (?,?,?,?,?)");
            ps.setInt(1, Math.abs(new Random().nextInt()));
            ps.setInt(2, employeeId);
            ps.setInt(3, new Random().nextInt(999999));
            ps.setString(4, type);
            ps.setString(5, Constants.PIN_ACTIVE);
            int counter = ps.executeUpdate();
            return counter == 1 ? Constants.OK : Constants.ERROR;
        } catch (Exception e) {
            System.out.println(e);
            return Constants.ERROR;
        } finally {
            try {
                con.close();
            } catch (SQLException ex) {
                Logger.getLogger(SecretPinManager.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    protected String validatePin(int employeeId, String type, String pin) {
        Connection con = new ConnectionManager().getConnection();
        String query = "select count(*) as COUNTER from SECRETPIN  where PINNUMBER=" + pin;
        try {
            if (Helper.checkIfExist(con, query, "COUNTER", Constants.TYPE_INT, "1")) {
                Statement stmt = con.createStatement();
                ResultSet rs = stmt.executeQuery("select EMPLOYEEID,PINTYPE,FLAG from SECRETPIN where PINNUMBER=" + pin);
                rs.next();
                if (employeeId == rs.getInt("EMPLOYEEID")
                        && type.equals(rs.getString("PINTYPE"))
                        && Constants.PIN_ACTIVE.equals(rs.getString("FLAG"))) {
                    return Constants.OK;
                } else {
                    return Constants.PIN_INCORRECT;
                }
            } else {
                return Constants.PIN_INCORRECT;
            }
        } catch (Exception e) {
            System.out.println(e);
            return Constants.ERROR;
        } finally {
            try {
                con.close();
            } catch (SQLException ex) {
                Logger.getLogger(SecretPinManager.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

}
