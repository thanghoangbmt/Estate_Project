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
import thangha.dtos.UserDTO;
import thangha.utils.MyConnection;

/**
 *
 * @author Admin
 */
public class UserDAO {

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

    public UserDTO checkLogin(String userID, String password) throws SQLException, ClassNotFoundException {
        UserDTO dto = null;
        try {
            conn = MyConnection.getConnection();
            if (conn != null) {
                String sql = "SELECT a.UserName, r.Description FROM Account a, Role r "
                        + "WHERE a.IsActived = ? AND a.UserID = ? AND a.Password = ? AND a.RoleID = r.ID";
                ps = conn.prepareStatement(sql);
                ps.setBoolean(1, true);
                ps.setString(2, userID);
                ps.setString(3, password);
                rs = ps.executeQuery();
                if (rs.next()) {
                    String userName = rs.getString("UserName");
                    String roleID = rs.getString("Description");
                    dto = new UserDTO();
                    dto.setUserName(userName);
                    dto.setRoleID(roleID);
                    dto.setUserID(userID);
                }
            }
        } finally {
            closeConnection();
        }
        return dto;
    }

    public boolean checkExistID(String userID) throws SQLException, ClassNotFoundException {
        boolean result = false;
        try {
            conn = MyConnection.getConnection();
            if (conn != null) {
                String sql = "SELECT UserName FROM Account "
                        + "WHERE UserID = ?";
                ps = conn.prepareStatement(sql);
                ps.setString(1, userID);
                rs = ps.executeQuery();
                if (rs.next()) {
                    result = true;
                }
            }
        } finally {
            closeConnection();
        }
        return result;
    }

    public boolean registerUser(UserDTO dto) throws SQLException, ClassNotFoundException {
        boolean result = false;
        try {
            conn = MyConnection.getConnection();
            if (conn != null) {
                String sql = "INSERT INTO Account(UserID, Password, UserName, RoleID, Gender, IsActived) "
                        + "VALUES(?,?,?,?,?, ?)";
                ps = conn.prepareStatement(sql);
                ps.setString(1, dto.getUserID());
                ps.setString(2, dto.getPassword());
                ps.setString(3, dto.getUserName());
                RoleDAO roleDAO = new RoleDAO();
                int roleID = roleDAO.getRoleIDByDescription(dto.getRoleID());
                ps.setInt(4, roleID);
                ps.setString(5, dto.getGender());
                ps.setBoolean(6, dto.isIsActived());
                result = (ps.executeUpdate() > 0);
            }
        } finally {
            closeConnection();
        }
        return result;
    }

    public boolean updateUser(UserDTO dto) throws SQLException {
        boolean result = false;
        try {
            conn = MyConnection.getConnection();
            if (conn != null) {
                String sql = "UPDATE Account SET Password = ?, RoleID = ?, "
                        + "UserName = ?, Gender = ? "
                        + "WHERE UserID = ?";
                ps = conn.prepareStatement(sql);
                ps.setString(1, dto.getPassword());
                RoleDAO roleDAO = new RoleDAO();
                int roleID = roleDAO.getRoleIDByDescription(dto.getRoleID());
                ps.setInt(2, roleID);
                ps.setString(3, dto.getUserName());
                ps.setString(4, dto.getGender());
                ps.setString(5, dto.getUserID());
                result = (ps.executeUpdate() > 0);
            }
        } catch (Exception e) {
        } finally {
            closeConnection();
        }
        return result;
    }

    public boolean deleteUser(String userID) throws SQLException {
        boolean result = false;
        try {
            conn = MyConnection.getConnection();
            if (conn != null) {
                String sql = "UPDATE Account SET IsActived = ? "
                        + "WHERE UserID = ?";
                ps = conn.prepareStatement(sql);
                ps.setBoolean(1, false);
                ps.setString(2, userID);
                result = (ps.executeUpdate() > 0);
            }
        } catch (Exception e) {
        } finally {
            closeConnection();
        }
        return result;
    }

    public List<UserDTO> getListAccount() throws SQLException {
        List<UserDTO> list = null;
        try {
            conn = MyConnection.getConnection();
            if (conn != null) {
                String sql = "SELECT UserID, Password, RoleID, UserName, "
                        + "Gender, IsActived FROM Account";
                ps = conn.prepareStatement(sql);
                rs = ps.executeQuery();
                while (rs.next()) {
                    if (list == null) {
                        list = new ArrayList<>();
                    }
                    String userID = rs.getString("UserID");
                    String Password = rs.getString("Password");
                    int roleID = rs.getInt("RoleID");
                    String userName = rs.getString("UserName");
                    String gender = rs.getString("Gender");
                    boolean isActived = rs.getBoolean("IsActived");

                    RoleDAO roleDAO = new RoleDAO();
                    String roleDescription = roleDAO.getRoleDescriptionByID(roleID);
                    UserDTO userDTO = new UserDTO(userID, Password, roleDescription, userName, gender, isActived);
                    list.add(userDTO);
                }
            }
        } catch (Exception e) {
        } finally {
            closeConnection();
        }
        return list;
    }

    public boolean checkCorrectPassword(String userID, String currentPassword) throws SQLException {
        boolean result = false;
        try {
            conn = MyConnection.getConnection();
            if (conn != null) {
                String sql = "SELECT Password FROM Account WHERE UserID = ?";
                ps = conn.prepareStatement(sql);
                ps.setString(1, userID);
                rs = ps.executeQuery();
                if (rs.next()) {
                    if (rs.getString("Password").equals(currentPassword)) {
                        result = true;
                    }
                }
            }
        } catch (Exception e) {
        } finally {
            closeConnection();
        }
        return result;
    }

    public boolean checkUserIDExist(String userID) throws SQLException {
        boolean result = false;
        try {
            conn = MyConnection.getConnection();
            if (conn != null) {
                String sql = "SELECT UserName FROM Account WHERE UserID = ?";
                ps = conn.prepareStatement(sql);
                ps.setString(1, userID);
                rs = ps.executeQuery();
                if (rs.next()) {
                    result = true;
                }
            }
        } catch (Exception e) {
        } finally {
            closeConnection();
        }
        return result;
    }
}
