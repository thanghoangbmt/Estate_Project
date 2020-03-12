/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package thangha.dtos;

/**
 *
 * @author Admin
 */
public class InvoiceDetailsDTO {
    private int invoiceDetailsID;
    private int propertyID;
    private double price;
    private int invoiceID;
    private String invoiceDate;

    public InvoiceDetailsDTO() {
    }

    public InvoiceDetailsDTO(int invoiceDetailsID, int propertyID) {
        this.invoiceDetailsID = invoiceDetailsID;
        this.propertyID = propertyID;
    }

    public InvoiceDetailsDTO(int propertyID, double price, String invoiceDate) {
        this.propertyID = propertyID;
        this.price = price;
        this.invoiceDate = invoiceDate;
    }

    public InvoiceDetailsDTO(int invoiceDetailsID, int propertyID, double price, String invoiceDate) {
        this.invoiceDetailsID = invoiceDetailsID;
        this.propertyID = propertyID;
        this.price = price;
        this.invoiceDate = invoiceDate;
    }
    
    public InvoiceDetailsDTO(int invoiceDetailsID, int propertyID, double price, int invoiceID, String invoiceDate) {
        this.invoiceDetailsID = invoiceDetailsID;
        this.propertyID = propertyID;
        this.price = price;
        this.invoiceID = invoiceID;
        this.invoiceDate = invoiceDate;
    }

    public int getInvoiceDetailsID() {
        return invoiceDetailsID;
    }

    public void setInvoiceDetailsID(int invoiceDetailsID) {
        this.invoiceDetailsID = invoiceDetailsID;
    }

    public int getPropertyID() {
        return propertyID;
    }

    public void setPropertyID(int propertyID) {
        this.propertyID = propertyID;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getInvoiceID() {
        return invoiceID;
    }

    public void setInvoiceID(int invoiceID) {
        this.invoiceID = invoiceID;
    }

    public String getInvoiceDate() {
        return invoiceDate;
    }

    public void setInvoiceDate(String invoiceDate) {
        this.invoiceDate = invoiceDate;
    }
}
