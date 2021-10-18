package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class uploaddocs_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList<String>(2);
    _jspx_dependants.add("/header.jsp");
    _jspx_dependants.add("/footer.jsp");
  }

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
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("           <link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css\" >\n");
      out.write("        <link ref=\"stylesheet\" href=\"https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css\">\n");
      out.write("       \n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        ");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>JSP Page</title>\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css\">\n");
      out.write("        <script src=\"https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js\"></script>\n");
      out.write("        \n");
      out.write("        <style>\n");
      out.write("            ul {\n");
      out.write("                list-style-type: none;\n");
      out.write("                /*width:100%;*/\n");
      out.write("                margin: 0;\n");
      out.write("                padding: 10px;\n");
      out.write("                overflow: hidden;\n");
      out.write("                background-color:#c52d2f;\n");
      out.write("            }\n");
      out.write("            li img{\n");
      out.write("\n");
      out.write("                height: 80px;\n");
      out.write("                padding-left: 30px;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            li {\n");
      out.write("                float: right;\n");
      out.write("                position: sticky;\n");
      out.write("                top:0;\n");
      out.write("                z-index: 10;\n");
      out.write("            }\n");
      out.write("            li a {\n");
      out.write("                display: block;\n");
      out.write("                color: #00303F;\n");
      out.write("                font-weight: bolder;\n");
      out.write("                text-align: center;\n");
      out.write("                padding: 14px 16px;\n");
      out.write("                text-decoration: none;\n");
      out.write("                margin-top: 13px;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            li a:hover {\n");
      out.write("                background: D8C3A5;\n");
      out.write("            }\n");
      out.write("            li .uname i{\n");
      out.write("                margin-right: 10px; \n");
      out.write("            }\n");
      out.write("            .uname{\n");
      out.write("                margin-top: 13px;\n");
      out.write("                color: #00303F;\n");
      out.write("                padding: 14px 16px;\n");
      out.write("                margin-right: 13px;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .dropdown{\n");
      out.write("                float: right;\n");
      out.write("                position: sticky;\n");
      out.write("                top:0;\n");
      out.write("                z-index: 5;\n");
      out.write("                background-color: #c52d2f;\n");
      out.write("                margin-top: 13px;\n");
      out.write("                border-radius: 5px;\n");
      out.write("                border-color: #c52d2f;\n");
      out.write("                color: #00303F;\n");
      out.write("                font-weight: bold;\n");
      out.write("                text-decoration: none;\n");
      out.write("                margin-right: 5px;\n");
      out.write("                padding: 14px 10px;\n");
      out.write("                display: block;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .dropdown option{\n");
      out.write("                display: block;\n");
      out.write("                background-color: #FDF5F8;\n");
      out.write("                color: #4F4846;\n");
      out.write("                font-weight: bold;\n");
      out.write("                text-align: center;\n");
      out.write("                padding: 14px 16px;\n");
      out.write("                text-decoration: none;\n");
      out.write("                margin-top: 13px;\n");
      out.write("\n");
      out.write("            }        \n");
      out.write("        </style>\n");
      out.write("    </head>\n");
      out.write("    <body  style=\"margin:0;\">\n");
      out.write("        <ul>\n");
      out.write("            ");
 if (session.getAttribute("userId") != null) {
      out.write("\n");
      out.write("            <li class=\"uname\"><i class=\"fa fa-user-circle\" aria-hidden=\"true\" style=\"margin-right: 5px;\"></i>");
      out.print(session.getAttribute("uname"));
      out.write("</li>\n");
      out.write("            <li><a href=\"register?logout=yes\">Logout</a></li>\n");
      out.write("            ");
 if(!session.getAttribute("userId").equals("1")) {
      out.write("\n");
      out.write("            \n");
      out.write("            <li><a href=\"EditForm.jsp\">Edit Profile</a></li>\n");
      out.write("            <li><a href=\"booked-car.jsp\">View Booking</a></li>\n");
      out.write("            <li><a href=\"uploaddocs.jsp\">Upload document</a></li>\n");
      out.write("            ");
}
      out.write("\n");
      out.write("          \n");
      out.write("            ");
 if (session.getAttribute("userId").equals("1")) {
      out.write("\n");
      out.write("           \n");
      out.write("            <li>\n");
      out.write("                <select class=\"dropdown\" onchange=\"location = this.value;\">\n");
      out.write("                    <option disabled [value]=\"\" selected>Admin panel</option>\n");
      out.write("<!--                    <option value=\"#view-user-accounts.jsp\">View user accounts</option>-->\n");
      out.write("<!--                    <option value=\"new mail.jsp\">New mail</option>-->\n");
      out.write("                    <option value=\"add-car.jsp\">Add car info</option>\n");
      out.write("                    <option value=\"rental-requests.jsp\">Rental request</option>\n");
      out.write("                     <option value=\"approvedlist.jsp\">Approved List</option>\n");
      out.write("                    <option value=\"available-cars.jsp\">Available cars</option>\n");
      out.write("                    <option value=\"rented-cars.jsp\">Rented cars</option>\n");
      out.write("                    <option value=\"registered-users.jsp\">Registered users </option>\n");
      out.write("                    <option value=\"remove-car.jsp\">Remove Car</option>\n");
      out.write("                </select>\n");
      out.write("           </li>\n");
      out.write("            ");
}
      out.write("\n");
      out.write("            ");
} else {
      out.write("\n");
      out.write("            <li><a href=\"Registration.jsp\">Register</a></li>\n");
      out.write("\n");
      out.write("            <li><a href=\"login.jsp\">Login</a></li>\n");
      out.write("                ");
}
      out.write("\n");
      out.write("            <li><a class=\"active\" href=\"home.jsp\">Home</a></li>\n");
      out.write("            <li style=\"float: left;\"><img src=\"image/logo.png\"></li>\n");
      out.write("        </ul>\n");
      out.write("        <script>\n");
      out.write("            $('#dropdown').change(function () {\n");
      out.write("                window.location = $(this).val();\n");
      out.write("            });\n");
      out.write("        </script>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
      out.write("\n");
      out.write("        <br>\n");
      out.write("    <center>\n");
      out.write("      <div class=\"upload\">\n");
      out.write("        <form method=\"post\" action=\"upload\" enctype=\"multipart/form-data\"> \n");
      out.write("   \n");
      out.write("            <div><label>Driving license Number:</label></div> \n");
      out.write("      <input type=\"number\" name=\"dlno\" size=\"50\"> \n");
      out.write("   <br>\n");
      out.write("      \n");
      out.write("   <div><label>Expiration year :</label></div> \n");
      out.write("      <input type=\"date\"  id=\"date\" name=\"exp\" size=\"50\"> \n");
      out.write("    <br>\n");
      out.write("     \n");
      out.write("    <div><label>Driving License ID: </label></div> \n");
      out.write("    <input type=\"file\" name=\"photo\" size=\"50\" > \n");
      out.write("     <input type='hidden' name=\"userId\" value=\"");
      out.print( request.getParameter("userId"));
      out.write("\" /> \n");
      out.write("    <input type=\"submit\" value=\"Save\"> \n");
      out.write("    \n");
      out.write("   \n");
      out.write("   \n");
      out.write("    </form>\n");
      out.write("      </div>\n");
      out.write("    </center>\n");
      out.write("      <script src=\"https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.2.1.min.js\">\n");
      out.write("      </script>\n");
      out.write("      <script type=\"text/javascript\">\n");
      out.write("         $(function() {\n");
      out.write("            $( \"#date\" ).datepicker({dateFormat: 'yy'});\n");
      out.write("         });\n");
      out.write("      </script>\n");
      out.write("   \n");
      out.write("        ");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>JSP Page</title>\n");
      out.write("        <style>\n");
      out.write("              i {\n");
      out.write("  margin-right: 10px;\n");
      out.write("}\n");
      out.write("               .footer {\n");
      out.write("position: fixed;\n");
      out.write("left: 0;\n");
      out.write("bottom: 0;\n");
      out.write("width: 100%;\n");
      out.write("  color: black;\n");
      out.write("                background:#c52d2f;\n");
      out.write("                padding-top: 10px;\n");
      out.write("text-align: center;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("h5{\n");
      out.write("\n");
      out.write("padding-top: 20px;\n");
      out.write("font-size: medium;\n");
      out.write("font-weight: bold;\n");
      out.write("        }\n");
      out.write("        </style>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <center class=\"foot\">\n");
      out.write("<div class=\"footer\">\n");
      out.write(" <h5>Copyright &copy; 2020. All rights reserved</h5><br>\n");
      out.write("             \n");
      out.write("</div>\n");
      out.write("    </center>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
      out.write("\n");
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
