/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpSession;
import model.Registration;
import model.User1;

@WebServlet(name = "register1", urlPatterns = {"/register1"})
public class register1 extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        Registration reg = new Registration(session);
        try { 
               if (request.getParameter("forgotpassword") != null) {
                String email = request.getParameter("email");
                int count = reg.ValidateEmail(email);
                if (count == 0) {
                    request.setAttribute("status", "Enter valid email address");
                    RequestDispatcher rd = request.getRequestDispatcher("Forget.jsp");
                    rd.forward(request, response);
                } else {
                    int randnumber = 0;
                    randnumber = (int) (Math.random() * 100000);
                    String code = "" + randnumber;
                    String idName = reg.FetchNameByEmail(email);
                    String id = idName.split("__")[0];
                    String uname = idName.split("__")[1];
                    reg.PasswordTrack(id, uname, email, randnumber + "");
                    final StringBuilder sb = new StringBuilder("<html> ");
                    sb.append("<body>");
                    sb.append("<div style='width: 100%;background: aliceblue;'>");
                    sb.append("<p class=notsobig-text >Hi<strong> " + uname + ",</strong></p>");
                    sb.append(" <p class=notsobig-text>You have requested to reset your password. Kindly click the below link to reset.</p> ");
                    sb.append("<div> <a target='_blank' style='text-decoration: none;padding: 2px 14px;background: #8bc34a;border-radius: 2px;overflow: hidden;margin: 10px;margin-left: 0;width: auto;display: inline-block;border: 1px solid #76b031;font-family: Helvetica,Arial,sans-serif;' href='http://localhost:8084/Addcart/register1?code1=" + code + "&&email=" + email + "'> <strong style='font-size: 13px;font-weight: bold;color: white;white-space: nowrap;'>Reset Password</strong> </a></div>");
                    sb.append("</div>");
                    sb.append("</body>");
                    sb.append("</html>");
                    reg.SendMail(sb.toString(), "Password Reset Link", email);
                    session.setAttribute("securitycode1", code);
                    request.setAttribute("status", "Verification code successfully sent on your email. ");
                    RequestDispatcher rd = request.getRequestDispatcher("forget.jsp");
                    rd.forward(request, response);
                }
            } else if (request.getParameter("code1") != null && request.getParameter("email") != null) {
                try {
                    String code1 = request.getParameter("code1").replace(" ", "+");
                    String email = request.getParameter("email");
                    User1 s = reg.GetPasswordTrackDetails(email, code1);
                    String name = "", uemail = "", scode = "";
                    if (s.getName().length() > 0) {
                        name = s.getName();
                        uemail = s.getEmail();
                        scode = s.getPassword();
                    }
                    if (code1.equals(scode)) {
                        session.setAttribute("scode", scode);
                        session.setAttribute("uname", name);
                        session.setAttribute("npuemail", uemail);
                        RequestDispatcher rd = request.getRequestDispatcher("newpassword.jsp");
                        rd.forward(request, response);
                    } else {
                        request.setAttribute("status", "Invalid or expired verification link.");
                        RequestDispatcher rd = request.getRequestDispatcher("Forget.jsp");
                        rd.forward(request, response);
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }
            } else if (session.getAttribute("scode") != null && request.getParameter("submit_NewPassword") != null) {
                try {
                    int status = 0, inPassTrack = 0;
                    String uemail = session.getAttribute("npuemail").toString();
                    String uname = session.getAttribute("uname").toString();
                    String scode = session.getAttribute("scode").toString();

                    String pass = request.getParameter("n_password");
                    String cpass = request.getParameter("c_password");
                    if (pass.equals(cpass)) {
                        status = reg.UpdatePassword(uemail, pass);
                        inPassTrack = reg.UpdatePasswordInPassTrack(uemail, scode, pass);
                        session.setAttribute("npuname", null);
                        session.setAttribute("uemail", null);
                        session.setAttribute("scode", null);
                        RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
                        rd.forward(request, response);
                    } else {
                        request.setAttribute("status", "Passwords do not match!");
                        RequestDispatcher rd = request.getRequestDispatcher("newpassword.jsp");
                        rd.forward(request, response);
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
