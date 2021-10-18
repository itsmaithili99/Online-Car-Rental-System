/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;
import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Iterator;
import java.util.List;

import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.sql.DriverManager;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;


/**
 *
 * @author User
 */
@WebServlet(name = "AddCarProcess", urlPatterns = {"/AddCarProcess"})
public class AddCarProcess extends HttpServlet {
  private static final long serialVersionUID = 1L;

    private static final String DATA_DIRECTORY = "image/";
    private static final int MAX_MEMORY_SIZE = 1024 * 1024 * 2;
    private static final int MAX_REQUEST_SIZE = 1024 * 1024;
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
         String regNo = "", carType = "", carImage = "", description = "", rentalPrice = "", active = "";
        // Check that we have a file upload request
        boolean isMultipart = ServletFileUpload.isMultipartContent(request);
         if (!isMultipart) {
            return;
        }
           // Creating a factory for disk-based file items
        DiskFileItemFactory factory = new DiskFileItemFactory();
         // Sets the size threshold beyond which files are written directly to
        // disk.
        factory.setSizeThreshold(MAX_MEMORY_SIZE);

        // Sets the directory used to temporarily store files that are larger
        // than the configured size threshold. We use temporary directory for
        // java
        factory.setRepository(new File(System.getProperty("java.io.tmpdir")));

        // constructs the folder where uploaded file will be stored
        String uploadFolder = getServletContext().getRealPath("")
                + File.separator + DATA_DIRECTORY;

        // Create a new file upload handler
        ServletFileUpload upload = new ServletFileUpload(factory);

        // Set overall request size constraint
        upload.setSizeMax(MAX_REQUEST_SIZE);
        
        try {
            // Parse the request
            List items = upload.parseRequest(request);
            Iterator iter = items.iterator();
            while (iter.hasNext()) {
                FileItem item = (FileItem) iter.next();

                if (!item.isFormField()) {
                    String fileName = new File(item.getName()).getName();
                    String filePath = uploadFolder + File.separator + fileName;
                    File uploadedFile = new File(filePath);
                     //out.println("C:/Users/User/Documents/NetBeansProjects/Addcart/Upload/");
                    // out.println("FILE" + fileName );
                    carImage = "/" + fileName;
                    // saves the file to upload directory
                    item.write(uploadedFile);
                } else {
                    // out.println("<br>Got a form field: " + item.getFieldName() + " " + item.getString());
                    switch (item.getFieldName()) {
                        case "regNo":
                            regNo = item.getString();
                            break;
                        case "carType":
                            carType = item.getString();
                            break;
                        case "description":
                            description = item.getString();
                            break;
                        case "rentalPrice":
                            rentalPrice = item.getString();
                            break;
                        case "active":
                            active = item.getString();
                            break;
                    }
                }
            }
            try {
                // Get connection object from ConnectionProvider.java
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/carrental", "root", "root");
                // Prepare SQL query
                PreparedStatement ps = conn.prepareStatement("INSERT INTO car(regNo, carType, carImage, description, rentalPrice, active) "
                        + "VALUES (?, ?, ?, ?, ?, ?) ;");

                ps.setString(1, regNo);
                ps.setString(2, carType);
                ps.setString(3, carImage);
                ps.setString(4, description);
                ps.setFloat(5, Float.parseFloat(rentalPrice));
                ps.setString(6, active);

                ps.executeUpdate(); // get the result of the SQL query
            } catch (SQLException ex) {
                System.out.println(ex);
            }
        } catch (FileUploadException ex) {
            throw new ServletException(ex);
        } catch (Exception ex) {
            throw new ServletException(ex);
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
         response.sendRedirect("view-cars.jsp");
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
