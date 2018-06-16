/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Main;

import Shared.ConnectionManager;
import Shared.Constants;
import Shared.Helper;
import Shared.SMSManager;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.simple.JSONObject;

/**
 *
 * @author mohnish
 */
public class LiveCounter extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/plain");
        PrintWriter out = response.getWriter();
        
        if (request.getHeader("api_key") != null && Helper.validateAPIKEY(request.getHeader("api_key"))) {
            Connection con = new ConnectionManager().getConnection();
            JSONObject jsonObject = new JSONObject();
            jsonObject.put("Attendance", getAttendanceCount(con));
            jsonObject.put("PendingRequest", getPendingRequestCount(con));
            StringWriter stringWriter = new StringWriter();
            jsonObject.writeJSONString(stringWriter);
            out.print(stringWriter.toString());
            try {
                con.close();
            } catch (Exception e) {
            }
            
        } else {
            out.print("invalidRequest");
        }
        
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }
    
    private int getAttendanceCount(Connection con) {
        
        try {
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("select count(*) as counter from ATTENDENCE where TO_DATE(TO_CHAR(CHECKIN,'DD-MM-YYYY'),'DD-MM-YYYY') = TO_DATE(TO_CHAR(current_timestamp,'DD-MM-YYYY'),'DD-MM-YYYY')");
            if (rs.next() == false) {
                return 0;
            }
            while (rs.next()) {
                return rs.getInt("counter");
            }
            return 0;
        } catch (Exception e) {
            System.out.println(e);
            return 0;
        }
    }
    
    private int getPendingRequestCount(Connection con) {
        try {
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("select count(*) as counter from REQUEST where FLAG='" + Constants.REQUEST_PENDING + "'");
            if (rs.next() == false) {
                return 0;
            }
            while (rs.next()) {
                return rs.getInt("counter");
            }
            return 0;
        } catch (Exception e) {
            System.out.println(e);
            return 0;
        }
    }
    
}
