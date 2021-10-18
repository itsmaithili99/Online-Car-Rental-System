package controller;

import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.Collection;
import javax.imageio.ImageIO;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import model.uploadimage;

@WebServlet(name = "upload", urlPatterns = {"/upload"})
@MultipartConfig
public class upload extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        PrintWriter out = response.getWriter();
        uploadimage i = new uploadimage(session);
        try {
            if (session.getAttribute("userId")!=null && request.getParameter("Upload") != null) {
                String imagedetails = "";
                String filename = "";
                Part filePart = (Part) request.getPart("image");
                String headers = filePart.getHeader("content-disposition");
                imagedetails = headers.split(";")[2].replace("filename=", "");
                filename = imagedetails.replace("\"", "");
                InputStream inputStream1 = null;
                inputStream1 = filePart.getInputStream();
                //String rid = session.getAttribute("userId").toString();
                
                File outputfile = new File("C:/Users/User/Documents/NetBeansProjects/carentals/web/image/"  + filename);
                OutputStream outt = new FileOutputStream(outputfile);
                byte[] buffer = new byte[1024];
                int length = -1;
                while ((length = inputStream1.read(buffer)) != -1) {
                    outt.write(buffer, 0, length);
                }
                String link = "" + filename;
                int count = i.InsertImage(link);
                if (count > 0) {
                    RequestDispatcher rd2 = request.getRequestDispatcher("viewdetails.jsp");
                    rd2.forward(request, response);
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
