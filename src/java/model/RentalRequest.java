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
public class RentalRequest {

    int requestId;
    String dateRequested;
    String dateFrom;
    String dateTo;
    String status;
    int userId;
    String regNo;
    String DLProof;

    public String getDLProof() {
        return DLProof;
    }

    public void setDLProof(String DLProof) {
        this.DLProof = DLProof;
    }

    public RentalRequest() {
    }

    public int getRequestId() {
        return requestId;
    }

    public void setRequestId(int requestId) {
        this.requestId = requestId;
    }

    public String getDateRequested() {
        return dateRequested;
    }

    public void setDateRequested(String dateRequested) {
        this.dateRequested = dateRequested;
    }

    public String getDateFrom() {
        return dateFrom;
    }

    public void setDateFrom(String dateFrom) {
        this.dateFrom = dateFrom;
    }

    public String getDateTo() {
        return dateTo;
    }

    public void setDateTo(String dateTo) {
        this.dateTo = dateTo;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
    
    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

//    public void setDLProof(String DLProof) {
//        this.DLProof = DLProof;
//    }

    public String getRegNo() {
        return regNo;
    }
//     public String getDLProof() {
//        return DLProof;
//    }

    public void setRegNo(String regNo) {
        this.regNo = regNo;
    }

}