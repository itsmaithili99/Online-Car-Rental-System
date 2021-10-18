/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Registration;
import model.User1;

/**
 *
 * @author User
 */
@WebServlet(name = "mail", urlPatterns = {"/mail"})
public class mail extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
          HttpSession session = request.getSession();
        Registration reg = new Registration(session);
        try  {
           
             if (request.getParameter("sendmail") != null) {
                String email = request.getParameter("email");
                int count = reg.ValidateEmail(email);
                if (count == 0) {
                    request.setAttribute("status", "Enter valid email address");
                    RequestDispatcher rd = request.getRequestDispatcher("approved.jsp");
                    rd.forward(request, response);
                } else {
                   
                   String idName = reg.FetchNameByEmail(email);
                    final StringBuilder sb = new StringBuilder("<html> ");
                    sb.append("<body>");
                    sb.append("<div style='width: 100%;background: aliceblue;'>");
                    sb.append("<p class=notsobig-text >Hi<strong> " + idName + ",</strong></p>");
                    sb.append(" <p class=notsobig-text>Your Request has been approved ,You can go for offline payment</p> ");
                    sb.append(" <p class=notsobig-text>Kindly visit our Office to collect the car Address:<strong>123/4 ,Above Cafe Coffee day,Davangere-577004.<strong></p> ");
                    sb.append("</div>");
                    sb.append("</body>");
                    sb.append("</html>");
                    reg.SendMail1(sb.toString(), "Booking confirmation", email);
                 
                    request.setAttribute("status", "Message  successfully sent on the given  email id . ");
                    RequestDispatcher rd = request.getRequestDispatcher("home.jsp");
                    rd.forward(request, response);
                }
         
        }
        }catch(Exception e){
            
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
