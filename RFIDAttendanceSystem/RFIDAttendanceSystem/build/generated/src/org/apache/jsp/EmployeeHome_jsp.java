package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class EmployeeHome_jsp extends org.apache.jasper.runtime.HttpJspBase
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

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <link rel=\"shortcut icon\" type=\"image/png\" href=\"Resources/favicon.png\"/> \n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css\" />\n");
      out.write("        <link rel=\"stylesheet\" href=\"CSS/mystyle.css\"/>\n");
      out.write("        <link rel=\"stylesheet\" href=\"CSS/animate.css\"/>\n");
      out.write("        <script src=\"https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js\"></script>\n");
      out.write("        <title>Employee</title>\n");
      out.write("    </head>\n");
      out.write("    <body> \n");
      out.write("        ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "header.jsp", out, false);
      out.write("\n");
      out.write("        <br/><br/>\n");
      out.write("\n");
      out.write("\n");
      out.write("        <div class=\"container\">\n");
      out.write("\n");
      out.write("            <div class=\"jumbotron jumbotron-fluid\" style=\"background-color: transparent;padding: 0\">\n");
      out.write("                <div class=\"container\">\n");
      out.write("                    <h1 class=\"display-4\">Welcome {user}</h1>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("            <div class=\"row dashboard-card-row \" style=\"margin-top: 8%\" >\n");
      out.write("                <div class=\"col-sm-6 \">\n");
      out.write("                    <div class=\"card shadow card-cursor\" id=\"ViewAttendance\">\n");
      out.write("                        <div class=\"card-body\">\n");
      out.write("\n");
      out.write("                            <img src=\"Resources/attendanceIcon.png\" style=\"height: 140px;width: auto\" class=\"rounded mx-auto d-block img-fluid\" alt=\"attendanceIcon\">\n");
      out.write("\n");
      out.write("                            <h3 class=\"card-title \" align=\"center\">Attendance Records</h3>\n");
      out.write("\n");
      out.write("\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("                <div class=\"col-sm-6 \">\n");
      out.write("                    <div class=\"card shadow card-cursor\" id=\"MakeaRequest\">\n");
      out.write("                        <div class=\"card-body\">\n");
      out.write("\n");
      out.write("                            <img src=\"Resources/employeeRequestIcon.png\" style=\"height: 140px;width: auto\" class=\"rounded mx-auto d-block img-fluid\" alt=\"employeeRequestIcon\">\n");
      out.write("\n");
      out.write("                            <h3 class=\"card-title \" align=\"center\">Requests</h3>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </div> \n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("        </div>\n");
      out.write("\n");
      out.write("  <script>\n");
      out.write("\n");
      out.write("            $(document).ready(function () {\n");
      out.write("\n");
      out.write("                $('.card-cursor').click(function (){\n");
      out.write("                    location.href = this.id+'.jsp';\n");
      out.write("                });\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("            });\n");
      out.write("        </script>\n");
      out.write("\n");
      out.write("\n");
      out.write("        <script src=\"https://code.jquery.com/jquery-3.2.1.slim.min.js\"  ></script>\n");
      out.write("        <script src=\"https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js\" ></script>\n");
      out.write("        <script src=\"https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js\" ></script>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
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
