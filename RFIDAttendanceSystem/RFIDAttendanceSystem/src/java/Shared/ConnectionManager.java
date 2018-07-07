/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Shared;

import Main.*;
import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author mohnish
 */
public class ConnectionManager {

    public Connection getConnection() {
        final String driver = "oracle.jdbc.OracleDriver";
        final String url = "jdbc:oracle:thin:@192.168.0.138:1521:XE";
        //final String url = "jdbc:oracle:thin:@localhost:1521:orcl";
        final String username = "hr";
        final String password = "hr";

        try {
            Class.forName(driver);
            Connection con = DriverManager.getConnection(url, username, password);
            System.out.println(con);
            return con;
        } catch (Exception e) {
            System.out.println(e);
            return null;
        }

    }

}
