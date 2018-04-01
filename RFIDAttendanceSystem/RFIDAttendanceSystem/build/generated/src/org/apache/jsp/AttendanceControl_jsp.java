package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class AttendanceControl_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("        <script src=\"https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js\"></script>\r\n");
      out.write("        <title>JSP Page</title>\r\n");
      out.write("    </head>\r\n");
      out.write("    <body>\r\n");
      out.write("        ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "header.jsp", out, false);
      out.write("\r\n");
      out.write("        <br/>\r\n");
      out.write("\r\n");
      out.write("        <div class=\"container-fluid\">\r\n");
      out.write("\r\n");
      out.write("            <div class=\"col-sm-3  float-left bg-light shadow-nohover\">\r\n");
      out.write("                <center><p class=\"lead\">Find Attendance</p></center>\r\n");
      out.write("                <div class=\"dropdown-divider\"></div>\r\n");
      out.write("                <form>\r\n");
      out.write("                    <div class=\"form-group\">\r\n");
      out.write("                        <label for=\"date1\">From Date</label>\r\n");
      out.write("                        <input type=\"date\" class=\"form-control\" id=\"date1\" >\r\n");
      out.write("                    </div>\r\n");
      out.write("                    <div class=\"form-group\">\r\n");
      out.write("                        <label for=\"date2\">To Date</label>\r\n");
      out.write("                        <input type=\"date\" class=\"form-control\" id=\"date2\" >\r\n");
      out.write("                    </div>\r\n");
      out.write("                    <center><button type=\"submit\" class=\"btn btn-primary\">Submit</button></center><br/><br/>\r\n");
      out.write("                </form>\r\n");
      out.write("            </div>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("            <div class=\"col-sm-9 \" style=\"max-width: 100%;min-height: 100px;\">\r\n");
      out.write("                \r\n");
      out.write("            </div>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("        </div>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("        <script>\r\n");
      out.write("            $(document).ready(function () {\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("            });\r\n");
      out.write("\r\n");
      out.write("            document.getElementById('date1').max = GetOneDayPrior();\r\n");
      out.write("            document.getElementById('date2').max = GetOneDayPrior();\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("            function GetOneDayPrior() {\r\n");
      out.write("                var d = new Date();\r\n");
      out.write("                d.setDate(d.getDate() - 1);\r\n");
      out.write("                var day, month, year;\r\n");
      out.write("\r\n");
      out.write("                year = d.getFullYear();\r\n");
      out.write("                if (d.getDate() < 10) {\r\n");
      out.write("                    day = '0' + String(d.getDate());\r\n");
      out.write("                } else {\r\n");
      out.write("                    day = String(d.getDate());\r\n");
      out.write("                }\r\n");
      out.write("                if (d.getMonth() + 1 < 10) {\r\n");
      out.write("                    month = '0' + String(d.getMonth() + 1);\r\n");
      out.write("                } else {\r\n");
      out.write("                    month = String(d.getMonth() + 1);  //+1; //January is 0!\r\n");
      out.write("                }\r\n");
      out.write("\r\n");
      out.write("                return year + '-' + month + '-' + day;\r\n");
      out.write("            }\r\n");
      out.write("\r\n");
      out.write("        </script>\r\n");
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
