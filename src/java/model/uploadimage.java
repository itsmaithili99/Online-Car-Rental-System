/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author User
 */
import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.Properties;
import javax.servlet.http.HttpSession;


public class uploadimage {
        private Connection con;
    private HttpSession se;

    public uploadimage(HttpSession session) {
        try {
            Class.forName("com.mysql.jdbc.Driver"); 
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/carrental", "root", "ROOT");
            se = session;

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public int InsertImage(String link) {
        int a = 0;
        try {
            String query = "insert into image(userId,name,link) values (?,?,?);";
            PreparedStatement preparedstatement = null;
            preparedstatement = (PreparedStatement) con.prepareStatement(query);
            preparedstatement.setString(1, se.getAttribute("userId").toString());
            preparedstatement.setString(2, se.getAttribute("uname").toString());
            preparedstatement.setString(3, link);
             a = preparedstatement.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return a;
    }

}
