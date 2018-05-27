/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Main;

import Model.Employee;
import Model.Request;
import Shared.ConnectionManager;
import Shared.Constants;
import Shared.Helper;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author mohnish
 */
public class RequestController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/plain");
        PrintWriter out = response.getWriter();
        if (request.getHeader("api_key") != null && Helper.validateAPIKEY(request.getHeader("api_key"))) {
            switch (request.getParameter("task")) {
                case Constants.GET_REQUESTS:
                    out.print(getAllRequest(request.getSession(false), request));
                    break;
            }
        } else {
            out.print("invalidRequest");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/plain");
        PrintWriter out = response.getWriter();
        if (request.getHeader("api_key") != null && Helper.validateAPIKEY(request.getHeader("api_key"))) {
        } else {
            out.print("invalidRequest");
        }

    }

    private String getAllRequest(HttpSession session, HttpServletRequest request) {
        Connection con = new ConnectionManager().getConnection();
        List<Request> requestList = new ArrayList<Request>();
        String query = null;
        try {
            Statement stmt = con.createStatement();
            if (request.getHeader("Referer").contains("PendingRequest.jsp") && ((Employee) request.getSession(false).getAttribute("userData")).isUserHr()) {
                query = "select REQUESTID,REQUESTSUBJECT,REQUESTBODY,REQUESTREPLY,EMPLOYEEID,NVL(ADMINSTATUS,'-'),to_char(DATETIME,'DD-MM-YY'),NVL(to_char(REPLYDATETIME,'DD-MM-YY'),'-'),FLAG from request";
            } else {
                query = "select REQUESTID,REQUESTSUBJECT,REQUESTBODY,REQUESTREPLY,EMPLOYEEID,NVL(ADMINSTATUS,'-'),to_char(DATETIME,'DD-MM-YY'),NVL(to_char(REPLYDATETIME,'DD-MM-YY'),'-'),FLAG from request where EMPLOYEEID=" + ((Employee) request.getSession(false).getAttribute("userData")).getEmployeeId();
            }
            ResultSet rs = stmt.executeQuery(query);
            while (rs.next()) {
                requestList.add(new Request(
                        rs.getInt("REQUESTID"),
                        rs.getString("REQUESTSUBJECT"),
                        rs.getString("REQUESTBODY"),
                        rs.getString("REQUESTREPLY"),
                        rs.getInt("EMPLOYEEID"),
                        rs.getInt("ADMINSTATUS"),
                        rs.getString("DATETIME"),
                        rs.getString("REPLYDATETIME"),
                        rs.getString("FLAG"),
                        rs.getString("FLAG").equals(Constants.REQUEST_RESPONDED)
                ));
            }
            ObjectMapper mapper = new ObjectMapper();
            if (mapper.writeValueAsString(requestList).equals("[]")) {
                return Constants.REQUESTS_NOT_FOUND;
            } else {
                return mapper.writeValueAsString(requestList);
            }
        } catch (Exception e) {
            System.out.println(e);
            return Constants.ERROR;
        } finally {
            try {
                con.close();
            } catch (Exception e) {
            }
        }
    }
}
