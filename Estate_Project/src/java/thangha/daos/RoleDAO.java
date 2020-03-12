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
import thangha.utils.MyConnection;

/**
 *
 * @author Admin
 */
public class RoleDAO {
    private Connection conn = null;
    private PreparedStatement ps = null;
    private ResultSet rs = null;
    
    private void closeConnection() throws SQLException {
        if (rs != null)
            rs.close();
        if (ps != null)
            ps.close();
        if (conn != null)
            conn.close();
    }
    
    public String getRoleDescriptionByID(int ID) throws SQLException {
        String result = "";
        try {
            conn = MyConnection.getConnection();
            if (conn != null) {
                String sql = "SELECT Description FROM Role WHERE ID = ?";
                ps = conn.prepareStatement(sql);
                ps.setInt(1, ID);
                rs = ps.executeQuery();
                if (rs.next()) {
                    result = rs.getString("Description");
                }
            }
        } catch (Exception e) {
        } finally {
            closeConnection();
        }
        return result;
    } 
    
    public int getRoleIDByDescription(String Description) throws SQLException {
        int result = -1;
        try {
            conn = MyConnection.getConnection();
            if (conn != null) {
                String sql = "SELECT ID FROM Role WHERE Description = ?";
                ps = conn.prepareStatement(sql);
                ps.setString(1, Description);
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
}
