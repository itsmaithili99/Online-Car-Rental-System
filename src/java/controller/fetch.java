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
import javax.servlet.http.HttpSession;
import model.user;
import model.client;
import java.util.ArrayList;
import java.util.Iterator;
import org.json.JSONArray;
import org.json.JSONObject;


/**
 *
 * @author Acer
 */
@WebServlet(name = "fetch", urlPatterns = {"/fetch"})
public class fetch extends HttpServlet {

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
        user u = new user(session);
JSONObject json1 = new JSONObject();
JSONArray array = new JSONArray();

        try  {
            
            if (session.getAttribute("id") != null &&session.getAttribute("id").equals("1") &&request.getParameter("FetchUser") != null) {
ArrayList<client> al = u.getuserdata();
if (al.size() > 0) {
                    Iterator<client>itr = al.iterator();
while (itr.hasNext()) {
client d = itr.next();
JSONObject json = new JSONObject();
json.put("userId", d.getUserId());
json.put("name", d.getName());
json.put("email", d.getEmail());
json.put("phone", d.getPhone());

array.put(json);
                    }
json1.put("jsonarray", array);
out.print(json1);
                } else {
json1.put("status", "No data");
out.print(json1);
                }
            } else if (session.getAttribute("id") != null &&session.getAttribute("id").equals("1") &&request.getParameter("DeleteUser") != null) {
String  id = request.getParameter("id");
String status = u.Delete("id");
int count = 0;
if (count > 0) {
json1.put("status", "Deleted");
out.print(json1);
                } else {
json1.put("status", "Not Deleted");
out.print(json1);
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
