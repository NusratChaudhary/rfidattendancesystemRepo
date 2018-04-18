/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Main;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.UUID;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
                out.print("success");
            } else {
                out.print("error");
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
            String employeeID = UUID.randomUUID().toString().replace("-", "").substring(0, 7);

            insertEmployees.setString(1, employeeID);
            insertEmployees.setString(2, request.getParameter("firstName"));
            insertEmployees.setString(3, request.getParameter("lastName"));
            insertEmployees.setString(4, request.getParameter("gender"));
            insertEmployees.setInt(5, Integer.parseInt(request.getParameter("phoneNumber")));
            insertEmployees.setString(6, request.getParameter("email"));
            insertEmployees.setString(7, request.getParameter("address"));
            insertEmployees.setString(8, request.getParameter("password"));
            insertEmployees.setString(9, request.getParameter("dateOfBirth"));
            insertEmployees.setString(10, Constants.USER_ACTIVE);

            insertRfid.setString(1, UUID.randomUUID().toString().replace("-", "").substring(0, 7));
            insertRfid.setString(2, employeeID);
            insertRfid.setBytes(3, request.getParameter("img").getBytes());
            insertRfid.setString(4, Constants.RFID_ACTIVE);

            if (insertEmployees.executeUpdate() > 0 && insertRfid.executeUpdate() > 0) {
                con.commit();
                return true;
            } else {
                con.rollback();

                return false;
            }

        } catch (Exception e) {
            return false;
        }

    }

}
