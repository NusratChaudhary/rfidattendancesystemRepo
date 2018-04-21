/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Main;

import Shared.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.UUID;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author mohnish
 */
public class Registration extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/plain");
        PrintWriter out = response.getWriter();

        if (request.getParameter("api_key") != null && Helper.validateAPIKEY(request.getParameter("api_key"))) {

            if (registerUser(request)) {

                out.print(Constants.REGISTER_SUCCESS);
            } else {
                out.print(Constants.REGISTER_INSUCCESS);
            }

        } else {
            out.print("invalidRequest");
        }

    }

    private boolean registerUser(HttpServletRequest request) {

        try {

            Connection con = new ConnectionManager().getConnection();
            PreparedStatement insertEmployees = con.prepareStatement("insert into EMPLOYEES values (?,?,?,?,?,?,?,?,?,?)");
            PreparedStatement insertRfid = con.prepareStatement("insert into RFID values (?,?,?,?)");
            int employeeID = Math.abs(new Random().nextInt());  // maths.abs to get positive i.e converts negative to posotive

            insertEmployees.setInt(1, employeeID);
            insertEmployees.setString(2, request.getParameter("firstName"));
            insertEmployees.setString(3, request.getParameter("lastName"));
            insertEmployees.setString(4, request.getParameter("gender"));
            insertEmployees.setInt(5, Integer.parseInt(request.getParameter("phoneNumber")));
            insertEmployees.setString(6, request.getParameter("email"));
            insertEmployees.setString(7, request.getParameter("address"));
            insertEmployees.setString(8, request.getParameter("password"));
            insertEmployees.setString(9, request.getParameter("dateOfBirth"));
            insertEmployees.setString(10, Constants.USER_ACTIVE);

            insertRfid.setInt(1, Math.abs(new Random().nextInt()));
            insertRfid.setInt(2, employeeID);
            insertRfid.setBytes(3, request.getParameter("img").getBytes());
            insertRfid.setString(4, Constants.RFID_ACTIVE);

            if (insertEmployees.executeUpdate() > 0 && insertRfid.executeUpdate() > 0) {

                con.commit();

                String verificationMailLink = createVerificationURL(String.valueOf(employeeID));

                Thread mailThread = new Thread(new Runnable() {
                    public void run() {
                        new Mailer().sendMail(request.getParameter("email"), "Email Verification", Constants.EMAIL_VERIFICATION_TEMPLATE + verificationMailLink);
                    }
                });
                mailThread.start();

                return true;
            } else {
                con.rollback();

                return false;
            }

        } catch (Exception e) {
            return false;
        }

    }

    private String createVerificationURL(String id) {

        try {
            String rawUrl = Constants.MODE_VERIFY_EMAIL + "=" + id;
            String hashUrl = Helper.getMD5Hash(rawUrl);
            Connection con = new ConnectionManager().getConnection();
            PreparedStatement insertVerification = con.prepareStatement("insert into VERIFICATION values (?,?,?,?,?)");
            insertVerification.setString(1, UUID.randomUUID().toString().replace("-", "").substring(0, 7));
            insertVerification.setString(2, hashUrl);
            insertVerification.setString(3, id);
            insertVerification.setString(4, Constants.MODE_VERIFY_EMAIL);
            insertVerification.setString(5, Constants.PENDING);
            insertVerification.executeUpdate();

            return Constants.HOST_ADDRESS + "Verify?code=" + hashUrl;

        } catch (Exception ex) {
            Logger.getLogger(Registration.class.getName()).log(Level.SEVERE, null, ex);
            return "error";
        }

    }

}
