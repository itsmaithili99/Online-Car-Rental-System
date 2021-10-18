package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.sql.ResultSet;
import java.sql.PreparedStatement;
import java.sql.DriverManager;
import java.sql.Connection;

public final class viewdetails_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>JSP Page</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("          <section id=\"blog\" class=\"container\">\n");
      out.write("            <div class=\"center\">\n");
      out.write("                <h2>Document details </h2>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"blog\">\n");
      out.write("                <div class=\"row\">\n");
      out.write("                    <div class=\"col-md-12\">\n");
      out.write("                        ");

                            String error;
                            if ( session.getAttribute("userId")!=null) { 
      out.write("\n");
      out.write("                        <table class=\"table table-condensed table-bordered\">\n");
      out.write("                            <thead> <tr>\n");
      out.write("                                \n");
      out.write("                                    <th>Name</th>\n");
      out.write("                                    <th>DLProof</th>\n");
      out.write("<!--                                    <th>active</th>-->\n");
      out.write("                                </tr> </thead>\n");
      out.write("                                ");

                                    try {
                                      
                                          Class.forName("com.mysql.jdbc.Driver");
                                        // Get connection object from ConnectionProvider.java
                                        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/carrental", "root", "root");
                                        // Prepare SQL query
                                        PreparedStatement ps = conn.prepareStatement("SELECT * FROM image  WHERE userId=" + "userId");
                                       
                                        ResultSet rs = ps.executeQuery();
                                        int count = 1;
                                        while (rs.next()) {
                                            String statusClass = "";
                                            if (rs.getString("userId")!=null) {
                                                statusClass = "";
                                            } else {
                                                statusClass = "danger";
                                            }
                                
      out.write("\n");
      out.write("\n");
      out.write("                            <tr class=\"");
      out.print(statusClass);
      out.write("\">\n");
      out.write("                                \n");
      out.write("                              \n");
      out.write("                                <td>");
      out.print( rs.getString("uname"));
      out.write("</td>\n");
      out.write("                                <td><img src=\"");
      out.print( rs.getString("link"));
      out.write("\" class='img-responsive'></td>\n");
      out.write("                            </tr>\n");
      out.write("                            ");

                                    }
                                } catch (Exception ex) {
                                    StringWriter errors = new StringWriter();
                                    ex.printStackTrace(new PrintWriter(errors));
                                    error = "exception" + errors.toString();
                                    out.println(error);
                                }
                            
      out.write("\n");
      out.write("                        </table>\n");
      out.write("                        ");
 } else { 
      out.write("\n");
      out.write("                        <div class=\"alert alert-danger\" role=\"alert\">\n");
      out.write("                            <span class=\"glyphicon glyphicon-ok\" aria-hidden=\"true\"></span>\n");
      out.write("                            <strong> Please login: </strong> You must be logged-in to view this page\n");
      out.write("                        </div>                           \n");
      out.write("                        ");
 }
      out.write("\n");
      out.write("                    </div>\n");
      out.write("                </div><!--/.row-->\n");
      out.write("            </div>\n");
      out.write("        </section>\n");
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
