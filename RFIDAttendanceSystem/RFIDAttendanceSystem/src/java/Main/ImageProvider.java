/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Main;

import Shared.ConnectionManager;
import Shared.Helper;
import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author mohnish
 */
public class ImageProvider extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("image/png");
        if (request.getHeader("api_key") != null && Helper.validateAPIKEY(request.getHeader("api_key"))) {
            Connection con = new ConnectionManager().getConnection();
            try {
                Statement stmt = con.createStatement();
                ResultSet rs = stmt.executeQuery("select IMAGE from RFID where RFIDNUMBER=" + request.getParameter("rfidNumber"));
                Blob b = rs.getBlob(1);

                BufferedImage bImage = ImageIO.read(b.getBinaryStream());
                ByteArrayOutputStream bos = new ByteArrayOutputStream();
                ImageIO.write(bImage, "png", bos);
                byte[] imgData = bos.toByteArray();
                OutputStream o = response.getOutputStream();
                o.write(imgData);
                o.flush();
                o.close();
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

}
