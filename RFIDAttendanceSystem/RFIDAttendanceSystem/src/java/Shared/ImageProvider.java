/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Shared;

import Model.Employee;
import Shared.ConnectionManager;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.IOException;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author mohnish
 */
public class ImageProvider extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("image/jpeg");
        HttpSession session = request.getSession(false);
        Connection con = new ConnectionManager().getConnection();
        try {
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("select IMAGE from RFID where RFIDNUMBER=" + (Integer) ((Employee) session.getAttribute("userData")).getRfid().getRFIDNUMBER());
            if (rs.next()) {
                Blob b = rs.getBlob(1);
                ServletOutputStream out = response.getOutputStream();
                BufferedInputStream bin = new BufferedInputStream(b.getBinaryStream());
                BufferedOutputStream bout = new BufferedOutputStream(out);
                int ch = 0;
                while ((ch = bin.read()) != -1) {
                    bout.write(ch);
                }
                bin.close();
                bout.close();
                out.close();
            }
        } catch (Exception e) {
            System.out.println(e);
        } finally {
            try {
                con.close();
            } catch (SQLException ex) {
                Logger.getLogger(ImageProvider.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

    }

}
