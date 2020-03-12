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
import java.util.List;
import thangha.dtos.InvoiceDTO;
import thangha.dtos.InvoiceDetailsDTO;
import thangha.utils.MyConnection;

/**
 *
 * @author Admin
 */
public class InvoiceDAO {

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

    public boolean addNewInvoice(String date, String userID, double total) throws SQLException {
        boolean result = false;
        try {
            conn = MyConnection.getConnection();
            if (conn != null) {
                String sql = "INSERT INTO Invoice(Date, UserID, Total) VALUES(?,?,?)";
                ps = conn.prepareStatement(sql);
                SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
                java.util.Date dateJava = sdf1.parse(date);
                java.sql.Date sqlStartDate = new java.sql.Date(dateJava.getTime());
                ps.setDate(1, sqlStartDate);
                ps.setString(2, userID);
                ps.setDouble(3, total);
                result = (ps.executeUpdate() > 0);
            }
        } catch (Exception e) {
        } finally {
            closeConnection();
        }
        return result;
    }

    public boolean updateTotalPrice(int invoiceID, double price) throws SQLException {
        boolean result = false;
        try {
            conn = MyConnection.getConnection();
            if (conn != null) {
                String sql = "UPDATE Invoice SET Total = Total + ? WHERE ID = ?";
                ps = conn.prepareStatement(sql);
                ps.setDouble(1, price);
                ps.setInt(2, invoiceID);
                result = (ps.executeUpdate() > 0);
            }
        } catch (Exception e) {
        } finally {
            closeConnection();
        }
        return result;
    }

    public int getInvoiceID(String date, String userID, double total) throws SQLException {
        int result = -1;
        try {
            conn = MyConnection.getConnection();
            if (conn != null) {
                String sql = "SELECT ID FROM Invoice WHERE Date = ? AND UserID = ? AND total = ?";
                ps = conn.prepareStatement(sql);
                SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
                java.util.Date dateJava = sdf1.parse(date);
                java.sql.Date sqlStartDate = new java.sql.Date(dateJava.getTime());
                ps.setDate(1, sqlStartDate);
                ps.setString(2, userID);
                ps.setDouble(3, total);
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
    
    public InvoiceDTO getInvoiceInfo(int invoiceID) throws SQLException {
        InvoiceDTO result = null;
        try {
            conn = MyConnection.getConnection();
            String sql = "SELECT Date, UserID, Total FROM Invoice "
                    + "WHERE ID = ?";
            ps = conn.prepareStatement(sql);
            ps.setInt(1, invoiceID);
            rs = ps.executeQuery();
            if (rs.next()) {
                String date = rs.getString("Date");
                String userID = rs.getString("UserID");
                double total = rs.getDouble("Total");
//                result = new InvoiceDTO(invoiceID, date, userID, 0);
            }
        } catch (Exception e) {
        } finally {
            closeConnection();
        }
        return result;
    }
    
    public List<InvoiceDTO> getListInvoice() throws SQLException {
        List<InvoiceDTO> list = null;
        try {
            conn = MyConnection.getConnection();
            String sql = "SELECT ID, Date, UserID FROM Invoice";
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                int ID = rs.getInt("ID");
                String date = rs.getString("Date");
                String userID = rs.getString("UserID");
                InvoiceDetailsDAO invoiceDetailsDAO = new InvoiceDetailsDAO();
                ArrayList<InvoiceDetailsDTO> listDetailsDTO = invoiceDetailsDAO.getListDetailsByInvoiceID(ID);
                if (list == null)
                    list = new ArrayList<>();
                list.add(new InvoiceDTO(ID, date, userID, listDetailsDTO));
            }
        } catch (Exception e) {
        } finally {
            closeConnection();
        }
        return list;
    }
    
    public List<InvoiceDTO> getListInvoiceByUserID(String userID) throws SQLException {
        List<InvoiceDTO> list = null;
        try {
            conn = MyConnection.getConnection();
            String sql = "SELECT ID, Date FROM Invoice WHERE UserID = ?";
            ps = conn.prepareStatement(sql);
            ps.setString(1, userID);
            rs = ps.executeQuery();
            while (rs.next()) {
                int ID = rs.getInt("ID");
                String date = rs.getString("Date");
                InvoiceDetailsDAO invoiceDetailsDAO = new InvoiceDetailsDAO();
                ArrayList<InvoiceDetailsDTO> listDetailsDTO = invoiceDetailsDAO.getListDetailsByInvoiceID(ID);
                if (list == null)
                    list = new ArrayList<>();
                list.add(new InvoiceDTO(ID, date, userID, listDetailsDTO));
            }
        } catch (Exception e) {
        } finally {
            closeConnection();
        }
        return list;
    }
    
    public String getUserIDByInvoiceID(int invoiceID) throws SQLException {
        String result = "";
        try {
            conn = MyConnection.getConnection();
            String sql = "SELECT UserID FROM Invoice WHERE ID = ?";
            ps = conn.prepareStatement(sql);
            ps.setInt(1, invoiceID);
            rs = ps.executeQuery();
            if (rs.next()) {
                result = rs.getString("UserID");
            }
        } catch (Exception e) {
        } finally {
            closeConnection();
        }
        return result;
    }
    
    public String getDateByInvoiceID(int invoiceID) throws SQLException {
        String result = "";
        try {
            conn = MyConnection.getConnection();
            String sql = "SELECT Date FROM Invoice WHERE ID = ?";
            ps = conn.prepareStatement(sql);
            ps.setInt(1, invoiceID);
            rs = ps.executeQuery();
            if (rs.next()) {
                result = rs.getString("Date");
            }
        } catch (Exception e) {
        } finally {
            closeConnection();
        }
        return result;
    }
    
    public double getTotalByInvoiceID(int invoiceID) throws SQLException {
        double result = 0;
        try {
            conn = MyConnection.getConnection();
            String sql = "SELECT Total FROM Invoice WHERE ID = ?";
            ps = conn.prepareStatement(sql);
            ps.setInt(1, invoiceID);
            rs = ps.executeQuery();
            if (rs.next()) {
                result = rs.getDouble("Total");
            }
        } catch (Exception e) {
        } finally {
            closeConnection();
        }
        return result;
    }
}
