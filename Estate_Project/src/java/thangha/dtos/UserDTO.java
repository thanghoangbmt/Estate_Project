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
public class UserDTO {
    private String userID;
    private String password;
    private String roleID;
    private String userName;
    private String gender;
    private boolean isActived;

    public UserDTO() {
    }

    public UserDTO(String userID, String password) {
        this.userID = userID;
        this.password = password;
    }

    public UserDTO(String userID, String roleID, String userName, String gender) {
        this.userID = userID;
        this.roleID = roleID;
        this.userName = userName;
        this.gender = gender;
    }

    public UserDTO(String userID, String password, String roleID, String userName, String gender) {
        this.userID = userID;
        this.password = password;
        this.roleID = roleID;
        this.userName = userName;
        this.gender = gender;
    }

    public UserDTO(String userID, String password, String roleID, String userName, String gender, boolean isActived) {
        this.userID = userID;
        this.password = password;
        this.roleID = roleID;
        this.userName = userName;
        this.gender = gender;
        this.isActived = isActived;
    }
    

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRoleID() {
        return roleID;
    }

    public void setRoleID(String roleID) {
        this.roleID = roleID;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public boolean isIsActived() {
        return isActived;
    }

    public void setIsActived(boolean isActived) {
        this.isActived = isActived;
    }
    
    
}