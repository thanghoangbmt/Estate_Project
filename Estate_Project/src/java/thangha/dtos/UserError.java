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
public class UserError {
    private String userIDError;
    private String passwordError;
    private String confirmPasswordError;
    private String roleIDError;
    private String userNameError;
    private String genderError;

    public UserError() {
    }

    public UserError(String userIDError, String passwordError, String confirmPasswordError, String roleIDError, String userNameError, String genderError) {
        this.userIDError = userIDError;
        this.passwordError = passwordError;
        this.confirmPasswordError = confirmPasswordError;
        this.roleIDError = roleIDError;
        this.userNameError = userNameError;
        this.genderError = genderError;
    }

    public String getUserIDError() {
        return userIDError;
    }

    public void setUserIDError(String userIDError) {
        this.userIDError = userIDError;
    }

    public String getPasswordError() {
        return passwordError;
    }

    public void setPasswordError(String passwordError) {
        this.passwordError = passwordError;
    }

    public String getConfirmPasswordError() {
        return confirmPasswordError;
    }

    public void setConfirmPasswordError(String confirmPasswordError) {
        this.confirmPasswordError = confirmPasswordError;
    }

    public String getRoleIDError() {
        return roleIDError;
    }

    public void setRoleIDError(String roleIDError) {
        this.roleIDError = roleIDError;
    }

    public String getUserNameError() {
        return userNameError;
    }

    public void setUserNameError(String userNameError) {
        this.userNameError = userNameError;
    }

    public String getGenderError() {
        return genderError;
    }

    public void setGenderError(String genderError) {
        this.genderError = genderError;
    }
}