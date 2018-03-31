package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class EmployeeDetails_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("\r\n");
      out.write("            <div class=\"col-sm-2 offset-sm-10\">\r\n");
      out.write("                <input class=\"form-control form-control-sm\" type=\"text\" placeholder=\"Search Employee\" id=\"searchBar\">\r\n");
      out.write("            </div>\r\n");
      out.write("            <br/>\r\n");
      out.write("            <div class=\"col-sm-3 statistics float-left bg-light shadow-nohover\">\r\n");
      out.write("                <center><p class=\"lead\">Statistics</p></center>\r\n");
      out.write("                <div class=\"dropdown-divider\"></div>\r\n");
      out.write("                <table class=\"table  table-responsive\">\r\n");
      out.write("                    <tbody>\r\n");
      out.write("                        <tr>\r\n");
      out.write("\r\n");
      out.write("                            <td>Employees </td>\r\n");
      out.write("                            <td>:</td>\r\n");
      out.write("                            <td>5000</td>\r\n");
      out.write("\r\n");
      out.write("                        </tr>\r\n");
      out.write("                        <tr>\r\n");
      out.write("\r\n");
      out.write("                            <td>Disabled Employees</td>\r\n");
      out.write("                            <td>:</td>\r\n");
      out.write("                            <td>50</td>\r\n");
      out.write("\r\n");
      out.write("                        </tr>\r\n");
      out.write("                        <tr>\r\n");
      out.write("\r\n");
      out.write("                            <td>Larry</td>\r\n");
      out.write("                            <td>:</td>\r\n");
      out.write("                            <td>the Bird</td>\r\n");
      out.write("\r\n");
      out.write("                        </tr>\r\n");
      out.write("                    </tbody>\r\n");
      out.write("                </table>\r\n");
      out.write("            </div>\r\n");
      out.write("\r\n");
      out.write("            <div class=\"col-sm-9 float-right\">\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("                <div class=\"employeeCard\">\r\n");
      out.write("\r\n");
      out.write("                    <div class=\"card\" id=\"id-empName\">\r\n");
      out.write("                        <div class=\"card-header \"  id=\"headingOne\">\r\n");
      out.write("                            <h5 class=\"mb-0\">\r\n");
      out.write("                                <button class=\"btn btn-light collapsed\" data-toggle=\"collapse\" data-target=\"#empName\" aria-expanded=\"true\" aria-controls=\"empName\">\r\n");
      out.write("                                    Employee 1\r\n");
      out.write("                                </button>\r\n");
      out.write("                                <div class=\"float-right\">\r\n");
      out.write("                                    <button  class=\"btn collapsed\" >\r\n");
      out.write("                                        <img src=\"Resources/edit.png\" alt=\"editButton\"/>\r\n");
      out.write("                                    </button>\r\n");
      out.write("\r\n");
      out.write("                                    <button  class=\"btn collapsed\" >\r\n");
      out.write("                                        <img src=\"Resources/rubbish-bin.png\" alt=\"deletebutton\"/>\r\n");
      out.write("                                    </button>\r\n");
      out.write("\r\n");
      out.write("                                    <button  class=\"btn collapsed\"  data-toggle=\"collapse\" data-target=\"#empName\" aria-expanded=\"true\" aria-controls=\"empName\" >\r\n");
      out.write("                                        <img src=\"Resources/expand-button.png\" onclick=\"\" alt=\"expandButton\"/>\r\n");
      out.write("                                    </button>\r\n");
      out.write("                                </div> \r\n");
      out.write("                            </h5>\r\n");
      out.write("                        </div>\r\n");
      out.write("\r\n");
      out.write("                        <div id=\"empName\" class=\"collapse\" aria-labelledby=\"headingOne\" data-parent=\"#accordion\">\r\n");
      out.write("                            <div class=\"card-body\">\r\n");
      out.write("                                Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.\r\n");
      out.write("                            </div>\r\n");
      out.write("                        </div>\r\n");
      out.write("                    </div>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("                    <div class=\"card\">\r\n");
      out.write("                        <div class=\"card-header\" id=\"headingTwo\">\r\n");
      out.write("                            <h5 class=\"mb-0\">\r\n");
      out.write("                                <button class=\"btn collapsed\" data-toggle=\"collapse\" data-target=\"#collapseTwo\" aria-expanded=\"false\" aria-controls=\"collapseTwo\">\r\n");
      out.write("                                    Employee 2\r\n");
      out.write("                                </button>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("                            </h5>\r\n");
      out.write("                        </div>\r\n");
      out.write("                        <div id=\"collapseTwo\" class=\"collapse\" aria-labelledby=\"headingTwo\" data-parent=\"#accordion\">\r\n");
      out.write("                            <div class=\"card-body\">\r\n");
      out.write("                                Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.\r\n");
      out.write("                            </div>\r\n");
      out.write("                        </div>\r\n");
      out.write("                    </div>\r\n");
      out.write("                    <div class=\"card\">\r\n");
      out.write("                        <div class=\"card-header\" id=\"headingThree\">\r\n");
      out.write("                            <h5 class=\"mb-0\">\r\n");
      out.write("                                <button class=\"btn btn-light collapsed\" data-toggle=\"collapse\" data-target=\"#collapseThree\" aria-expanded=\"false\" aria-controls=\"collapseThree\">\r\n");
      out.write("                                    Employee 3\r\n");
      out.write("                                </button>\r\n");
      out.write("                            </h5>\r\n");
      out.write("                        </div>\r\n");
      out.write("                        <div id=\"collapseThree\" class=\"collapse\" aria-labelledby=\"headingThree\" data-parent=\"#accordion\">\r\n");
      out.write("                            <div class=\"card-body\">\r\n");
      out.write("                                Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.\r\n");
      out.write("                            </div>\r\n");
      out.write("                        </div>\r\n");
      out.write("                    </div>\r\n");
      out.write("\r\n");
      out.write("                </div>\r\n");
      out.write("            </div>\r\n");
      out.write("\r\n");
      out.write("        </div>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("        <script>\r\n");
      out.write("            $(document).ready(function () {\r\n");
      out.write("\r\n");
      out.write("             \r\n");
      out.write("            });\r\n");
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
