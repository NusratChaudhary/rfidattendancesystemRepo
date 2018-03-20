<%-- 
    Document   : trigg
    Created on : 14 Mar, 2017, 7:39:01 AM
    Author     : mohnish
--%>

<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.Connection"%>
<%@page import="Main.Connection_Mgr"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       
        <% 
        Connection_Mgr obj=new Connection_Mgr();
        Connection con=obj.conn();
        List date=new ArrayList();
        List comm=new ArrayList();
String q="select date_time,comm from triggg order by date_time";


try {
    Statement stmt=con.createStatement();
    ResultSet rs=stmt.executeQuery(q);
    while (rs.next()) {            
            date.add(rs.getString("date_time"));
            comm.add(rs.getString("comm"));
        }
    
    
    } catch (Exception e) {
        out.print(e);
    }
        
        %>
        
        
        <div class="container">
            <table class="table table-hover table-bordered">
                <thead>
                    <tr>
                        <th>Date_Time</th>
                        <th>Comment</th>
                    </tr>
                </thead>
                <%
                for(int i=0;i<=date.size()-1;i++)
                {
                %>
                <tr>
                    <td><%=date.get(i)%></td> 
                    <td><%=comm.get(i)%></td> 
                </tr>
                            
                           <%} %>
            </table>
        </div>
        
        
    </body>
</html>
