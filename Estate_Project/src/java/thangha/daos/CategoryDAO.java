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
import thangha.dtos.CategoryDTO;
import thangha.utils.MyConnection;

/**
 *
 * @author Admin
 */
public class CategoryDAO {

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

    public List<CategoryDTO> getListCategory() throws SQLException {
        List<CategoryDTO> categories = null;
        try {
            conn = MyConnection.getConnection();
            String sql = "SELECT ID, Type FROM Category";
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                if (categories == null) {
                    categories = new ArrayList<>();
                }
                int id = rs.getInt("ID");
                String type = rs.getString("Type");
                categories.add(new CategoryDTO(id, type));
            }
        } catch (Exception e) {
        } finally {
            closeConnection();
        }
        return categories;
    }

    public String getTypeCategoryByID(int categoryID) {
        String category = null;
        try {
            conn = MyConnection.getConnection();
            if (conn != null) {
                String sql = "SELECT Type FROM Category WHERE ID = ?";
                ps = conn.prepareStatement(sql);
                ps.setInt(1, categoryID);
                rs = ps.executeQuery();
                if (rs.next()) {
                    category = rs.getString("Type");
                }
            }
        } catch (Exception e) {
        }

        return category;
    }
    
    public int getIDByType(String type) throws SQLException {
        int result = -1;
        try {
            conn = MyConnection.getConnection();
            String sql = "SELECT ID FROM Category WHERE Type = ?";
            ps = conn.prepareStatement(sql);
            ps.setString(1, type);
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
}
