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
import java.util.ArrayList;
import java.util.List;
import thangha.dtos.OwnerDTO;
import thangha.utils.MyConnection;

/**
 *
 * @author Admin
 */
public class OwnerDAO {
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
    
    public List<OwnerDTO> getListOwner() throws SQLException {
        List<OwnerDTO> owners = null;
        try {
            conn = MyConnection.getConnection();
            String sql = "SELECT ID, Name, Phone, Email FROM Owner";
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next()) {
                if (owners == null)
                    owners = new ArrayList<>();
                int id = rs.getInt("ID");
                String name = rs.getString("Name");
                String phone = rs.getString("Phone");
                String email = rs.getString("Email");
                owners.add(new OwnerDTO(id, name, phone, email));
            }
        } catch (Exception e) {
        } finally {
            closeConnection();
        }
        return owners;
    }
    
    public String getOwnerNameByID(int id) throws SQLException {
        String result = "";
        try {
            conn = MyConnection.getConnection();
            String sql = "SELECT Name FROM Owner WHERE ID = ?";
            ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
                result = rs.getString("Name");
            }
        } catch (Exception e) {
        } finally {
            closeConnection();
        }
        return result;
    }
    
    public int getOwnerIDByName(String name) throws SQLException {
        int result = -1;
        try {
            conn = MyConnection.getConnection();
            String sql = "SELECT ID FROM Owner WHERE Name = ?";
            ps = conn.prepareStatement(sql);
            ps.setString(1, name);
            rs = ps.executeQuery();
            if (rs.next()) {
                result = rs.getInt("ID");
            }
        } catch (Exception e) {
        } finally {
            closeConnection();
        }
        return result;
    }
    
    public boolean addNewOwner(String name) throws SQLException {
        boolean result = false;
        try {
            conn = MyConnection.getConnection();
            String sql = "INSERT INTO Owner(Name) VALUES(?)";
            ps = conn.prepareStatement(sql);
            ps.setString(1, name);
            result = (ps.executeUpdate() > 0);
        } catch (Exception e) {
        } finally {
            closeConnection();
        }
        return result;
    }
}
