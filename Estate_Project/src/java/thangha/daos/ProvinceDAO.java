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
import thangha.dtos.ProvinceDTO;
import thangha.utils.MyConnection;

/**
 *
 * @author Admin
 */
public class ProvinceDAO {
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
    
    public List<ProvinceDTO> getListProvince() throws SQLException {
        List<ProvinceDTO> provinces = null;
        try {
            conn = MyConnection.getConnection();
            String sql = "SELECT ID, Name FROM Province";
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next()) {
                if (provinces == null)
                    provinces = new ArrayList<>();
                int id = rs.getInt("ID");
                String name = rs.getString("Name");
                provinces.add(new ProvinceDTO(id, name));
            }
        } catch (Exception e) {
        } finally {
            closeConnection();
        }
        return provinces;
    }
    
    public String getProvinceNameByID(int provinceID) {
        String province = null;
        try {
            conn = MyConnection.getConnection();
            if (conn != null) {
                String sql = "SELECT Name FROM Province WHERE ID = ?";
                ps = conn.prepareStatement(sql);
                ps.setInt(1, provinceID);
                rs = ps.executeQuery();
                if (rs.next()) {
                    province = rs.getString("Name");
                }
            }
        } catch (Exception e) {

        }
        return province;
    }
    
    public int getIDByName(String name) throws SQLException {
        int result = -1;
        try {
            conn = MyConnection.getConnection();
            String sql = "SELECT ID FROM Province WHERE Name = ?";
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
}
