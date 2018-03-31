package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class HrDashboard_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("    <head>\r\n");
      out.write("        <link rel=\"shortcut icon\" type=\"image/png\" href=\"Resources/favicon.png\"/> \r\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\r\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css\" />\r\n");
      out.write("        <link rel=\"stylesheet\" href=\"CSS/mystyle.css\"/>\r\n");
      out.write("        <link rel=\"stylesheet\" href=\"CSS/animate.css\"/>\r\n");
      out.write("        <script src=\"https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js\"></script> \r\n");
      out.write("    </head>\r\n");
      out.write("    <body class=\"bg-light\">\r\n");
      out.write("        ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "header.jsp", out, false);
      out.write("\r\n");
      out.write("        <br/><br/>\r\n");
      out.write("        <div class=\"container \">\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("            <div class=\"row live-counter \">\r\n");
      out.write("\r\n");
      out.write("                <div class=\"col-sm-6 \" >\r\n");
      out.write("                    <center> <span class=\"lead\">Attendance Entries </span><span class=\"live-counter-numbers animated fadeIn\" style=\"color: green\">50</span></center>\r\n");
      out.write("                </div>\r\n");
      out.write("                <!--<div class=\"col-sm-1 live-counter-divider\">\r\n");
      out.write("                    \r\n");
      out.write("                </div>-->\r\n");
      out.write("                <div class=\"col-sm-6\">\r\n");
      out.write("                    <center>  <span class=\"lead\">Pending Requests </span><span class=\"live-counter-numbers animated fadeIn\" style=\"color: red\">62</span></center>\r\n");
      out.write("                </div>\r\n");
      out.write("\r\n");
      out.write("            </div>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("            <div class=\"row dashboard-card-row\">\r\n");
      out.write("                <div class=\"col-sm-6 \">\r\n");
      out.write("                    <div class=\"card shadow card-cursor\" id=\"EmployeeDetails\">\r\n");
      out.write("                        <div class=\"card-body\">\r\n");
      out.write("\r\n");
      out.write("                            <img src=\"Resources/employeeIcon.png\" style=\"height: 140px;width: auto\" class=\"rounded mx-auto d-block img-fluid\" alt=\"employeeIcon\">\r\n");
      out.write("\r\n");
      out.write("                            <h3 class=\"card-title \" align=\"center\">Employees</h3>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("                        </div>\r\n");
      out.write("                    </div>\r\n");
      out.write("                </div>\r\n");
      out.write("                <div class=\"col-sm-6 \">\r\n");
      out.write("                    <div class=\"card shadow  card-cursor\" id=\"Broadcast\">\r\n");
      out.write("                        <div class=\"card-body\">\r\n");
      out.write("\r\n");
      out.write("                            <img src=\"Resources/broadcastIcon.png\" style=\"height: 140px;width: auto\" class=\"rounded mx-auto d-block img-fluid\" alt=\"broadcastIcon\">\r\n");
      out.write("\r\n");
      out.write("                            <h3 class=\"card-title \" align=\"center\">Broadcast Message</h3>\r\n");
      out.write("                        </div>\r\n");
      out.write("                    </div>\r\n");
      out.write("                </div>\r\n");
      out.write("            </div> \r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("            <div class=\"row dashboard-card\">\r\n");
      out.write("                <div class=\"col-sm-6 \">\r\n");
      out.write("                    <div class=\"card shadow  card-cursor\" id=\"PendingRequest\">\r\n");
      out.write("                        <div class=\"card-body\">\r\n");
      out.write("\r\n");
      out.write("                            <img src=\"Resources/employeeRequestIcon.png\" style=\"height: 140px;width: auto\" class=\"rounded mx-auto d-block img-fluid\" alt=\"employeeRequestIcon\">\r\n");
      out.write("\r\n");
      out.write("                            <h3 class=\"card-title \" align=\"center\">Employee Requests</h3>\r\n");
      out.write("                        </div>\r\n");
      out.write("                    </div>\r\n");
      out.write("                </div>\r\n");
      out.write("                <div class=\"col-sm-6 \">\r\n");
      out.write("                    <div class=\"card shadow  card-cursor\" id=\"AttendanceControl\">\r\n");
      out.write("                        <div class=\"card-body\">\r\n");
      out.write("                            <img src=\"Resources/attendanceIcon.png\" style=\"height: 140px;width: auto\" class=\"rounded mx-auto d-block img-fluid\" alt=\"attendanceIcon\">\r\n");
      out.write("\r\n");
      out.write("                            <h3 class=\"card-title \" align=\"center\">Attendance Records</h3>\r\n");
      out.write("                        </div>\r\n");
      out.write("                    </div>\r\n");
      out.write("                </div>\r\n");
      out.write("            </div> \r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("        </div>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("        <script>\r\n");
      out.write("\r\n");
      out.write("            $(document).ready(function () {\r\n");
      out.write("\r\n");
      out.write("                $('.card-cursor').click(function (){\r\n");
      out.write("                    location.href = this.id+'.jsp';\r\n");
      out.write("                });\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("            });\r\n");
      out.write("        </script>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("        <script src=\"https://code.jquery.com/jquery-3.2.1.slim.min.js\"  ></script>\r\n");
      out.write("        <script src=\"https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js\" ></script>\r\n");
      out.write("        <script src=\"https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js\" ></script>\r\n");
      out.write("    </body>\r\n");
      out.write("</html>\r\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
