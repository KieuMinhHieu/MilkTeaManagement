/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.user;

/**
 *
 * @author DELL
 */
public class UserError {

    private String userID;
    private String userName;
    private String gender;
    private String email;
    private String address;
    private String password;
    private String roleID;
    private String birthdate;

    public UserError() {
        this.userID = "";
        this.userName = "";
        this.gender = "";
        this.email = "";
        this.address = "";
        this.password = "";
        this.roleID = "";
        this.birthdate = "";
    }

    public UserError(String userID, String userName, String gender, String email, String address, String password, String roleID, String birthdate) {
        this.userID = userID;
        this.userName = userName;
        this.gender = gender;
        this.email = email;
        this.address = address;
        this.password = password;
        this.roleID = roleID;
        this.birthdate = birthdate;
    }

    public String getUserID() {
        return userID;
    }

    public String getUserName() {
        return userName;
    }

    public String getGender() {
        return gender;
    }

    public String getEmail() {
        return email;
    }

    public String getAddress() {
        return address;
    }

    public String getPassword() {
        return password;
    }

    public String getRoleID() {
        return roleID;
    }

    public String getBirthdate() {
        return birthdate;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setRoleID(String roleID) {
        this.roleID = roleID;
    }

    public void setBirthdate(String birthdate) {
        this.birthdate = birthdate;
    }

    @Override
    public String toString() {
        return "UserError{" + "userID=" + userID + ", fullName=" + userName + ", gender=" + gender + ", email=" + email + ", address=" + address + ", password=" + password + ", roleID=" + roleID + ", birthdate=" + birthdate + '}';
    }
}
