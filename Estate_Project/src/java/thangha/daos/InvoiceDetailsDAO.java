/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package thangha.daos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import thangha.dtos.InvoiceDetailsDTO;
import thangha.utils.MyConnection;

/**
 *
 * @author Admin
 */
public class InvoiceDetailsDAO {

    private Connection conn = null;
    private PreparedStatement ps = null;
    private ResultSet rs = null;

    private void closeConnection() throws SQLException {
        if (rs != null) {
            rs.close();
        }
        if (ps != null) {
            ps.close();
        }
        if (conn != null) {
            conn.close();
        }
    }

    public boolean addNewInvoiceDetails(InvoiceDetailsDTO detailsDTO) throws SQLException {
        boolean result = false;
        try {
            conn = MyConnection.getConnection();
            if (conn != null) {
                String sql = "INSERT INTO InvoiceDetails(PropertyID, Price, InvoiceID, InvoiceDate) VALUES(?,?,?,?)";
                ps = conn.prepareStatement(sql);
                ps.setInt(1, detailsDTO.getPropertyID());
                ps.setDouble(2, detailsDTO.getPrice());
                ps.setInt(3, detailsDTO.getInvoiceID());
                SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
                java.util.Date dateJava = sdf1.parse(detailsDTO.getInvoiceDate());
                java.sql.Date sqlStartDate = new java.sql.Date(dateJava.getTime());
                ps.setDate(4, sqlStartDate);
                result = (ps.executeUpdate() > 0);
            }
        } catch (Exception e) {
        } finally {
            closeConnection();
        }
        return result;
    }
    
    public int getHighestID () throws SQLException {
        int result = 0;
        try {
            conn = MyConnection.getConnection();
            if (conn != null) {
                String sql = "SELECT ID FROM InvoiceDetails "
                        + "WHERE ID >= ALL (SELECT ID FROM InvoiceDetails)";
                ps = conn.prepareStatement(sql);
                rs = ps.executeQuery();
                if (rs.next()) {
                    result = rs.getInt("ID");
                }
            }
        } catch (Exception e) {
        } finally {
            closeConnection();
        }
        return result;
    }
    
    public ArrayList<InvoiceDetailsDTO> getListDetailsByInvoiceID (int invoiceID) throws SQLException {
        ArrayList<InvoiceDetailsDTO> result = null;
        try {
            conn = MyConnection.getConnection();
            if (conn != null) {
                String sql = "SELECT ID, PropertyID, Price, InvoiceDate "
                        + "FROM InvoiceDetails "
                        + "WHERE InvoiceID = ?";
                ps = conn.prepareStatement(sql);
                ps.setInt(1, invoiceID);
                rs = ps.executeQuery();
                while (rs.next()) {
                    int ID = rs.getInt("ID");
                    int propertyID = rs.getInt("PropertyID");
                    double price = rs.getDouble("Price");
                    String date = rs.getString("InvoiceDate");
                    InvoiceDetailsDTO invoiceDetailsDTO = new InvoiceDetailsDTO(ID, propertyID, price, invoiceID, date);
                    if (result == null)
                        result = new ArrayList<>();
                    result.add(invoiceDetailsDTO);
                }
            }
        } catch (Exception e) {
        } finally {
            closeConnection();
        }
        return result;
    }
}
