/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Main;

import Shared.*;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Hashtable;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import java.util.Set;
import java.util.TreeMap;
import org.apache.commons.io.FileUtils;
import org.apache.commons.io.IOUtils;

/**
 *
 * @author mohnish
 */
public class Registration extends HttpServlet {

    boolean userExist = false;
    boolean rfidNotAvailable = false;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/plain");
        PrintWriter out = response.getWriter();

        if (request.getHeader("api_key") != null && Helper.validateAPIKEY(request.getHeader("api_key"))) {

            boolean isMultipart = ServletFileUpload.isMultipartContent(request);
            if (isMultipart) {
                FileItemFactory factory = new DiskFileItemFactory();
                ServletFileUpload upload = new ServletFileUpload(factory);
                try {

                    Map<String, String> map = new Hashtable<String, String>();
                    List<FileItem> multiparts = upload.parseRequest(request);
                    InputStream imageStream = null;
                    for (FileItem item : multiparts) {

                        if (!item.isFormField()) {

                            imageStream = item.getInputStream();

                        }
                        if (item.isFormField()) {

                            map.put(item.getFieldName(), item.getString());
                        }
                    }

                    if (registerUser(map, imageStream)) {

                        out.print(Constants.REGISTER_SUCCESS);
                    } else {
                        if (userExist) {
                            out.print(Constants.REGISTER_ALREADY);
                        } else if (rfidNotAvailable) {
                            out.print(Constants.RFID_CARD_NOT_AVAILABLE);
                        } else {
                            out.print(Constants.REGISTER_INSUCCESS);
                        }

                    }

                } catch (Exception e) {
                    System.out.println(e);
                }
            } else {
                out.print("invalidRequest");
            }
        } else {
            out.print("invalidRequest");
        }
    }

    private boolean registerUser(Map mapItems, InputStream stream) {

        final String checkQuery = "select count(*) as counter from employees where email='" + mapItems.get("email").toString() + "'";
        Connection con = new ConnectionManager().getConnection();

        try {

            if (Helper.checkIfExist(con, checkQuery, "counter", Constants.TYPE_INT, "1")) {
                userExist = true;
                return false;

            } else {

                PreparedStatement insertEmployees = con.prepareStatement("insert into EMPLOYEES values (?,?,?,?,?,?,?,?,?,?)");
                PreparedStatement insertRfid = con.prepareStatement("insert into RFID values (?,?,?,?)");
                int employeeID = Math.abs(new Random().nextInt()); // maths.abs to get positive i.e converts negative to posotive
                insertEmployees.setInt(1, employeeID);
                insertEmployees.setString(2, mapItems.get("firstName").toString());
                insertEmployees.setString(3, mapItems.get("lastName").toString());
                insertEmployees.setString(4, mapItems.get("gender").toString());
                insertEmployees.setString(5, mapItems.get("mobileNumber").toString());
                insertEmployees.setString(6, mapItems.get("email").toString());
                insertEmployees.setString(7, mapItems.get("address").toString());
                insertEmployees.setString(8, mapItems.get("password").toString());
                insertEmployees.setDate(9, new java.sql.Date(new SimpleDateFormat("yyyy-MM-dd").parse(mapItems.get("dateOfBirth").toString()).getTime()));
                insertEmployees.setString(10, Constants.USER_VERIFY);

                byte[] fileContent = IOUtils.toByteArray(stream);
                //  Blob imageBlob = new oracle.sql.BLOB(fileContent);

                String rfidNumber = generateRfidNumber(con);
                if (rfidNumber.equals(Constants.RFID_CARD_NOT_AVAILABLE)) {
                    rfidNotAvailable = true;
                    return false;
                }
                insertRfid.setInt(1, Integer.valueOf(rfidNumber));
                insertRfid.setInt(2, employeeID);
                insertRfid.setBytes(3, fileContent);
                insertRfid.setString(4, Constants.RFID_INACTIVE);

                if (insertEmployees.executeUpdate() > 0 && insertRfid.executeUpdate() > 0) {

                    con.commit();

                    String verificationMailLink = createVerificationURL(employeeID);
                    new Mailer().sendMail(mapItems.get("email").toString(), "Email Verification", Constants.EMAIL_VERIFICATION_TEMPLATE + verificationMailLink);

                    return true;
                } else {
                    con.rollback();

                    return false;
                }
            }
        } catch (Exception e) {
            System.out.println(e);
            return false;
        } finally {
            try {
                con.close();
            } catch (SQLException ex) {
                Logger.getLogger(Login.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

    }

    private String createVerificationURL(int id) {

        try {
            String rawUrl = Constants.MODE_VERIFY_EMAIL + "=" + id;
            String hashUrl = Helper.getMD5Hash(rawUrl);
            Connection con = new ConnectionManager().getConnection();
            PreparedStatement insertVerification = con.prepareStatement("insert into VERIFICATION values (?,?,?,?,?)");
            insertVerification.setInt(1, Math.abs(new Random().nextInt()));
            insertVerification.setString(2, hashUrl);
            insertVerification.setInt(3, id);
            insertVerification.setString(4, Constants.MODE_VERIFY_EMAIL);
            insertVerification.setString(5, Constants.PENDING);
            insertVerification.executeUpdate();

            return Constants.HOST_ADDRESS + "Verify?code=" + hashUrl;

        } catch (Exception ex) {
            Logger.getLogger(Registration.class.getName()).log(Level.SEVERE, null, ex);
            return "error";
        }

    }

    private String generateRfidNumber(Connection con) {

        try {
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("select id from RFIDCARDS where flag='" + Constants.RFID_CARD_INACTIVE + "'");
            while (rs.next()) {
                stmt.executeUpdate("update RFIDCARDS set flag='" + Constants.RFID_CARD_ACTIVE + "' where id=" + rs.getInt("id"));
                return String.valueOf(rs.getInt("id"));
            }
            return Constants.RFID_CARD_NOT_AVAILABLE;
        } catch (Exception e) {
            System.out.println(e);
            return null;
        }
    }
}
