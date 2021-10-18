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
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import javax.servlet.http.HttpSession;
import model.client;


/**
 *
 * @author Acer
 */
public class user {
    
    Connection con;
    Statement st;
ResultSet rs;
ResultSet rs1;
HttpSession se;

public user(HttpSession session) {
try {

Class.forName("com.mysql.jdbc.Driver"); // load the drivers
con = DriverManager.getConnection("jdbc:mysql://localhost:3306/carrental", "root", "ROOT");
            // connection with data base
se = session;
        } catch (Exception e) {
e.printStackTrace();
        }
    }

public ArrayList<client> getuserdata() {
ArrayList<client> al = new ArrayList<client>();
try {
st = con.createStatement();
          
rs = st.executeQuery("select * from user where id not in(1);");
while (rs.next()) {
client p = new client();
p.setUserId(rs.getString("userId"));
p.setName(rs.getString("name"));
p.setEmail(rs.getString("email"));
p.setAddress(rs.getString("address"));
p.setCity(rs.getString("city"));
p.setPhone(rs.getString("phone"));
p.setPwd(rs.getString("pwd"));
p.setRe_pass(rs.getString("re_pass"));



al.add(p);
            }

        } catch (Exception e) {
e.printStackTrace();
        }
return al;
    }
/*  Statement st;
        ResultSet rs;
        ArrayList<client> a1 = new ArrayList<client>();
        try {
            st = con.createStatement();
            rs = st.executeQuery("select * from log1 where id not in(1);");
            while (rs.next()) {
                client p = new client();
                p.setId(rs.getString("id"));
                p.setName(rs.getString("name"));
                p.setEmail(rs.getString("email"));
                p.setNumber(rs.getString("number"));
                a1.add(p);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return a1;*/

public String Delete(String id) {
 int count = 0;
        Statement st = null;
        String status = "";
        try {
            st = con.createStatement();
            count = st.executeUpdate("delete   from log1 where id='" + id + "'");
            if (count > 0) {
                status = "success";
            } else {
                status = "failure";
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }

}
