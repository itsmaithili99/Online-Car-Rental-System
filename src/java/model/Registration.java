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
/**
 *
 * @author Acer
 */
import java.sql.*;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class Registration {

    private Connection con;
    HttpSession se;

    public Registration(HttpSession session) {
        try {

            Class.forName("com.mysql.jdbc.Driver"); // load the drivers
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/carrental", "root", "ROOT");
            se = session;

            // connection with data base
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public String Registration(String name, String email, String address, String city, String phone, String pwd, String re_pass) {
        PreparedStatement ps;
        String status = "";
        try {
            Statement st = null;
            ResultSet rs = null;
            st = con.createStatement();
            rs = st.executeQuery("select * from user  where name='" + name + "' or email='" + email + "';");
            boolean b = rs.next();
            if (b) {
                status = "existed";
            } else {
                ps = (PreparedStatement) con.prepareStatement("insert into user(name,email,address,city,phone,pwd,re_pass) values( ?,?,?,?,?,?,?);");
                ps.setString(1, name);
                ps.setString(2, email);
                ps.setString(3, address);
                ps.setString(4, city);
                ps.setString(5, phone);
                ps.setString(6, pwd);
                ps.setString(7, re_pass);
//                ps.setString(8, active);
                int a = ps.executeUpdate();
                if (a > 0) {
                    status = "success";
                } else {
                    status = "failure";
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }
    

    public String login(String email, String pwd) {
        String status1 = "";
        String userId = "";
        String name = "", new_email = "";

        try {
            Statement st = null;
            ResultSet rs = null;
            st = con.createStatement();
            rs = st.executeQuery("select * from user where email='" + email + "' and pwd='" + pwd + "';");
            boolean b = rs.next();
            if (b == true) {
                userId = rs.getString("userId");
                name = rs.getString("name");
                new_email = rs.getString("email");
                se.setAttribute("uname", name);
                se.setAttribute("email", new_email);
                se.setAttribute("userId", userId);
                status1 = "success";
            } else {
                status1 = "failure";
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return status1;
    }

     public String contact(String name, String lname, String State, String message) {
        PreparedStatement ps;
        String status = "";
        try {
            Statement st = null;
            ResultSet rs = null;
            st = con.createStatement();
            rs = st.executeQuery("select * from contact  where name='" + name + "' or lname='" + lname + "';");
            boolean b = rs.next();
            if (b) {
                status = "existed";
            } else {
                ps = (PreparedStatement) con.prepareStatement("insert into contact(name,lname,State,message) values( ?,?,?,?);");
                ps.setString(1, name);
                ps.setString(2, lname);
                ps.setString(3, State);
                ps.setString(4, message);
               
//                ps.setString(8, active);
                int a = ps.executeUpdate();
                if (a > 0) {
                    status = "success";
                } else {
                    status = "failure";
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }
    public client getInfo() {
        Statement st = null;
        ResultSet rs = null;
        client c = null;
        try {
            st = con.createStatement();
            rs = st.executeQuery("select * from user where userId= '" + se.getAttribute("userId") + "'");
            boolean b = rs.next();
            if (b == true) {
                c = new client();
                c.setName(rs.getString("name"));
                c.setEmail(rs.getString("email"));
                c.setPhone(rs.getString("phone"));

            } else {
                c = null;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return c;
    }

    public String update(String name, String dlno, String phone,String exp) {
        String status = "";
        Statement st = null;
        ResultSet rs = null;
        try {
            st = con.createStatement();
            st.executeUpdate("update user set name='" + name + "',DrivingLicense='" + dlno + "',phone='" + phone + "',ExpirationYear='" + exp  + "' where userId= '" + se.getAttribute("userId") + "' ");
            se.setAttribute("uname", name);
            status = "success";
        } catch (Exception e) {
            status = "failure";
            e.printStackTrace();
        }

        return status;
    }

      public String updatedocs(int DrivingLicense, String Expirationyear, String DLProof) {
        String status = "";
        Statement st = null;
        ResultSet rs = null;
        try {
            st = con.createStatement();
            st.executeUpdate("update user set DrivingLicense='" + DrivingLicense + "',Expirationyear='" + Expirationyear + "',DLProof='" + DLProof + "' where userId= '" + se.getAttribute("userId") + "' ");
           
            status = "success";
        } catch (Exception e) {
            status = "failure";
            e.printStackTrace();
        }

        return status;
    }
    public String delete(String id) {
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

    public ArrayList<client> getUserInfo(String userId) {
        Statement st;
        ResultSet rs;
        ArrayList<client> a1 = new ArrayList<client>();
        try {
            st = con.createStatement();
            rs = st.executeQuery("select * from user where userId= '" + userId + "';");
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
                
                
//                p.setActive(rs.getString("active"));
                a1.add(p);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return a1;
    }

     public ArrayList<client> getList(String userId) {
        Statement st;
        ResultSet rs;
        ArrayList<client> a1 = new ArrayList<client>();
        try {
            st = con.createStatement();
            rs = st.executeQuery("select * from user where userId= '" + userId + "';");
            while (rs.next()) {
                client p = new client();
                p.setUserId(rs.getString("userId"));
                p.setName(rs.getString("name"));
                p.setEmail(rs.getString("email"));
                p.setAddress(rs.getString("address"));
                p.setCity(rs.getString("city"));
                p.setPhone(rs.getString("DLProof"));
                
                a1.add(p);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return a1;
    }
    public ArrayList<car> ViewCars(String Type) {
        Statement st;
        ResultSet rs;
        ArrayList<car> a1 = new ArrayList<car>();
        try {
            st = con.createStatement();
            rs = st.executeQuery("SELECT * FROM car WHERE carType LIKE '%' AND active LIKE 'active%' order by carType asc"); // get the result of the SQL query

            while (rs.next()) {
                car temp = new car();
                temp.setRegNo(rs.getString("regNo"));
                temp.setCarImage(rs.getString("carImage"));
                temp.setCarType(rs.getString("carType"));
                temp.setDescription(rs.getString("description"));
                temp.setRentalPrice(rs.getFloat("rentalPrice"));

                a1.add(temp);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return a1;
    }

    public ArrayList<RentalRequest> getRentalRequestList() {
        Statement st;
        ResultSet rs;
        ArrayList<RentalRequest> data = new ArrayList<RentalRequest>();
        try {
            st = con.createStatement();
            rs = st.executeQuery("select *,DLProof from rentalrequest ,user where rentalrequest.userId=user.userId order by dateRequested desc");
            while (rs.next()) {
                RentalRequest temp = new RentalRequest();
                temp.setRequestId(rs.getInt("requestId"));
                temp.setRegNo(rs.getString("regNo"));
                temp.setDateRequested(rs.getString("dateRequested"));
                temp.setDateFrom(rs.getString("dateFrom"));
                temp.setDateTo(rs.getString("dateTo"));
                temp.setUserId(rs.getInt("userId"));
//                temp.setDLProof(rs.getString("DLProof"));
                 temp.setDLProof(rs.getString("DLProof"));
                temp.setStatus(rs.getString("status"));
                data.add(temp);
            }
          } catch (Exception e) {
            e.printStackTrace();
        }
        return data;
    }


    public car bookcar(String regNo,String userId) {
        car temp = new car();

        try {
            PreparedStatement ps = con.prepareStatement("SELECT * FROM Car WHERE regNo=?");
            ps.setString(1, regNo);   
            ResultSet rs = ps.executeQuery(); 
            rs.first();
            temp.setRegNo(rs.getString("regNo"));
            temp.setCarImage(rs.getString("carImage"));
            temp.setCarType(rs.getString("carType"));
            temp.setDescription(rs.getString("description"));
            temp.setRentalPrice(rs.getFloat("rentalPrice"));

        } catch (Exception e) {
            e.printStackTrace();
        }
        return temp;
    }
   public ArrayList<RentalRequest> getRentalstatus() {
       
        ArrayList<RentalRequest> data = new ArrayList<RentalRequest>();
        try {
             PreparedStatement ps = con.prepareStatement("select * from rentalrequest where userId=" +se.getAttribute("userId") + ";");
            //ps.setString(1,"userId");
            ResultSet rs = ps.executeQuery();
            
            while (rs.next()) {
                RentalRequest temp = new RentalRequest();
                temp.setRequestId(rs.getInt("requestId"));
                temp.setRegNo(rs.getString("regNo"));
                temp.setDateRequested(rs.getString("dateRequested"));
                temp.setDateFrom(rs.getString("dateFrom"));
                temp.setDateTo(rs.getString("dateTo"));
//                temp.setUserId(rs.getInt("userId"));
                temp.setStatus(rs.getString("status"));
                data.add(temp);
            }
          } catch (Exception e) {
            e.printStackTrace();
        }
        return data;
    }
    public ArrayList<client> getDLdocs() {
       
        ArrayList<client> data = new ArrayList<client>();
        try {
             PreparedStatement ps = con.prepareStatement("select * from user where userId="+se.getAttribute("userId") );
            //ps.setString(1,"userId");
            ResultSet rs = ps.executeQuery();
            
            while (rs.next()) {
                client temp = new client();
                 temp.setName(rs.getString("name"));
                temp.setDrivingLicense(rs.getInt("DrivingLicense"));
                temp.setExpirationyear(rs.getString("Expirationyear"));
                //temp.setLink(rs.getString("link"));
               
                data.add(temp);
            }
          } catch (Exception e) {
            e.printStackTrace();
        }
        return data;
    }
   
public String FetchNameByEmail(String uemailMobile) {
        String name = "", update = "";
        ResultSet rs = null;
        try {
            update = "select userId,name from user where email=?";
            PreparedStatement preparedstatement1 = null;
            preparedstatement1 = (PreparedStatement) con.prepareStatement(update);
            preparedstatement1.setString(1, uemailMobile);
            rs = preparedstatement1.executeQuery();
            while (rs.next()) {
                name = rs.getString("userId") + "__" + rs.getString("name");
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return name;
    }

    //------------ Check validate email  --------------- 
    public int ValidateEmail(String uemail) {
        int count = 0;
        ResultSet rs;
        try {
            String update = "select email from user where email=?";
            PreparedStatement preparedstatement1 = null;
            preparedstatement1 = (PreparedStatement) con.prepareStatement(update);
            preparedstatement1.setString(1, uemail);
            rs = preparedstatement1.executeQuery();
            while (rs.next()) {
                count++;
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return count;
    }

    public int PasswordTrack(String userId, String name, String email, String password) {
        int status = 0;

        try {
            String qry = "insert into passwordtrack values(?,?,?,?,?,now());";
            PreparedStatement preparedstatement = null;
            preparedstatement = (PreparedStatement) con.prepareStatement(qry);
            preparedstatement.setInt(1, 0);
            preparedstatement.setString(2, userId);
            preparedstatement.setString(3, name);
            preparedstatement.setString(4, email);
            preparedstatement.setString(5, password);
            status = preparedstatement.executeUpdate();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return status;
    }
    //-----------------Insert Score Data in score_t1----------------

    public User1 GetPasswordTrackDetails(String email, String code) {
        User1 s = new User1();
        try {
            ResultSet rs = null;
            Statement statement = null;
            statement = (Statement) con.createStatement();
            rs = statement.executeQuery("select * from passwordtrack where email= '" + email + "'  and password='" + code + "'order by date desc limit 1;");
            while (rs.next()) {
                s.setName(rs.getString("name"));
                s.setEmail(rs.getString("email"));
                s.setPassword(rs.getString("password"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return s;
    }

    public int UpdatePasswordInPassTrack(String uemailMobile, String scode, String password) {
        int status = 0;
        String update = "";
        try {
            update = "UPDATE passwordtrack SET password =? WHERE email =? and password=?;";
            java.sql.PreparedStatement preparedstatement1 = null;
            preparedstatement1 = con.prepareStatement(update);
            preparedstatement1.setString(1, password);
            preparedstatement1.setString(2, uemailMobile);
            preparedstatement1.setString(3, scode);
            status = preparedstatement1.executeUpdate();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return status;
    }

    // ---------------Update user Password and password_date-----------------------
    public int UpdatePassword(String uemail, String password) {
        int status = 0;
        String update = "";
        try {
            update = "UPDATE user SET pwd =? WHERE email =?;";
            java.sql.PreparedStatement preparedstatement1 = null;
            preparedstatement1 = con.prepareStatement(update);
            preparedstatement1.setString(1, password);
            preparedstatement1.setString(2, uemail);
            status = preparedstatement1.executeUpdate();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return status;
    }

    public void SendMail(String msg, String subject,String email) {
        String from = "fastcarsrenatals1@gmail.com";
        String password = "Admin123#";
        String to = email;
        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
        props.put("mail.smtp.socketFactory.port", "465");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.port", "465");
        Session session = Session.getDefaultInstance(props,
                new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(from, password);
            }
        });

        try {
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(from));
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
            message.setSubject(subject);
            message.setContent(msg,"text/html");
            Transport.send(message);
        } catch (MessagingException e) {
            throw new RuntimeException(e);
        }

}
    
    public void SendMail1(String msg, String subject,String email) {
        String from = "fastcarsrenatals1@gmail.com";
        String password = "Admin123#";
        String to = email;
        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
        props.put("mail.smtp.socketFactory.port", "465");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.port", "465");
        Session session = Session.getDefaultInstance(props,
                new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(from, password);
            }
        });

        try {
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(from));
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
            message.setSubject(subject);
            message.setContent(msg,"text/html");
            Transport.send(message);
        } catch (MessagingException e) {
            throw new RuntimeException(e);
        }

}

    public String updatedocs(String DrivingLicense, String Expirationyear, String DLProof) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    

}
