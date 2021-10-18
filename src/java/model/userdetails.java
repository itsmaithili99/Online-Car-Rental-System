/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.logging.Logger;

/**
 *
 * @author User
 */
public class userdetails {
     String userId;
    String name;
    String email;
    String address;
    String city;
    String phone;
    int DrivingLicense;
    String Expirationyear;
    String DLPhoto;

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public int getDrivingLicense() {
        return DrivingLicense;
    }

    public void setDrivingLicense(int DrivingLicense) {
        this.DrivingLicense = DrivingLicense;
    }

    public String getExpirationyear() {
        return Expirationyear;
    }

    public void setExpirationyear(String Expirationyear) {
        this.Expirationyear = Expirationyear;
    }

    public String getDLPhoto() {
        return DLPhoto;
    }

    public void setDLPhoto(String DLPhoto) {
        this.DLPhoto = DLPhoto;
    }
   
}
