package Main;

import java.sql.Connection;
import java.sql.DriverManager;

public class Connection_Mgr {

    public Connection conn() {
        Connection con = null;
     final String driver = "oracle.jdbc.OracleDriver";
        final String url = "jdbc:oracle:thin:@localhost:1521:orcl";
        final String username = "hr";
        final String password = "hr";


        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");

            Class.forName(driver);
            con = DriverManager.getConnection(url, username, password);

        } catch (Exception e) {
            System.out.println(e);

        }
        return con;
    }

}
