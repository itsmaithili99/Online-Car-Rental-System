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
public class Cardetails {
    String CarID;
    String Model;
    String RegistrationNo;
    String SeatingCapacity ;
    String type;
    String Prizeperhr;

    public void  setCarID(String CarID) {
        this.CarID = CarID;
    }

    public void setModel(String Model) {
        this.Model = Model;
    }

    public void setRegistrationNo(String RegistrationNo) {
        this.RegistrationNo = RegistrationNo;
    }

    public void setSeatingCapacity(String SeatingCapacity) {
        this.SeatingCapacity = SeatingCapacity;
    }

    public void setType(String type) {
        this.type = type;
    }

    public void setPrizeperhr(String PrizeperKM) {
        this.Prizeperhr = Prizeperhr;
    }

    public String getCarID() {
        return CarID;
    }

    public String getModel() {
        return Model;
    }

    public String getRegistrationNo() {
        return RegistrationNo;
    }

    public String getSeatingCapacity() {
        return SeatingCapacity;
    }

    public String getType() {
        return type;
    }

    public String getPrizeperhr() {
        return Prizeperhr;
    }
    
}
