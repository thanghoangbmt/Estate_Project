/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package thangha.dtos;

import java.util.ArrayList;

/**
 *
 * @author Admin
 */
public class InvoiceDTO {
    private int invoiceID;
    private String date;
    private String userID;
    private ArrayList<InvoiceDetailsDTO> listDetailsDTO;
    
    public InvoiceDTO() {
    }

    public InvoiceDTO(int invoiceID, String date) {
        this.invoiceID = invoiceID;
        this.date = date;
    }

    public InvoiceDTO(String date, String userID) {
        this.date = date;
        this.userID = userID;
    }

    public InvoiceDTO(int invoiceID, String date, String userID, ArrayList<InvoiceDetailsDTO> listDetailsDTO) {
        this.invoiceID = invoiceID;
        this.date = date;
        this.userID = userID;
        this.listDetailsDTO = listDetailsDTO;
    }

    public int getInvoiceID() {
        return invoiceID;
    }

    public void setInvoiceID(int invoiceID) {
        this.invoiceID = invoiceID;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public ArrayList<InvoiceDetailsDTO> getListDetailsDTO() {
        return listDetailsDTO;
    }

    public void setListDetailsDTO(ArrayList<InvoiceDetailsDTO> listDetailsDTO) {
        this.listDetailsDTO = listDetailsDTO;
    }
    
    public double getTotalPrice() {
        double total = 0;
        for (int i = 0; i < listDetailsDTO.size(); i++) {
            total = total + listDetailsDTO.get(i).getPrice();
        }
        return total;
    }
}
