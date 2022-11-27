/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import sample.utils.DBUtils;
import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.StringReader;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;
import javax.json.Json;
import javax.json.JsonObject;
import javax.json.JsonReader;
import javax.net.ssl.HttpsURLConnection;

/**
 *
 * @author DELL
 */
public class UserDAO {

    private static final String LOGIN = "SELECT userID,gender,email,birthday,address,roleID FROM tblUsers WHERE userName=? AND password=?";
    private static final String CREATE = "INSERT INTO tblUsers(userName,gender,email,password,roleID) VALUES (?,?,?,?,?)";
    private static final String DUPLICATE = "SELECT userID FROM tblUsers WHERE userName=? AND email=?";
    private static final String SEARCH = "SELECT userID,userName,gender,email,birthday,address,roleID FROM tblUsers WHERE userName like ?";
    private static final String UPDATE = "UPDATE tblUsers SET userName=?, gender=?, email=? ,birthday=? ,address=?, roleID=?  WHERE userID=?";
    private static final String DELETE = "DELETE tblUsers WHERE userID=?";
    private static final String GET_USER = "  SELECT userID,gender,password,birthday,address,roleID FROM tblUsers WHERE userName=? AND email=?";
    //Captcha
    public static final String url = "https://www.google.com/recaptcha/api/siteverify";
    public static final String secret = "6LeCbmMgAAAAABVl_aZXNG1_sTSZcKZ5GDIQIRj7";
    private final static String USER_AGENT = "Mozilla/5.0";

    public UserDTO checkLogin(String userName, String password) throws SQLException {
        UserDTO user = null;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;

        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(LOGIN);
                ptm.setString(1, userName);
                ptm.setString(2, password);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    String userID = rs.getString("userID");
                    String gender = rs.getString("gender");
                    String email = rs.getString("email");
                    String address = rs.getString("address");
                    String birthdate = rs.getString("birthday");
                    String roleID = rs.getString("roleID");
                    user = new UserDTO(userID, userName, gender, email, address, "", roleID, birthdate);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return user;
    }

    public boolean verifyCaptcha(String gRecaptchaResponse) throws IOException {
        if (gRecaptchaResponse == null || "".equals(gRecaptchaResponse)) {
            return false;
        }
        try {
            URL obj = new URL(url);
            HttpsURLConnection con = (HttpsURLConnection) obj.openConnection();
            // add reuqest header
            con.setRequestMethod("POST");
            con.setRequestProperty("User-Agent", USER_AGENT);
            con.setRequestProperty("Accept-Language", "en-US,en;q=0.5");
            String postParams = "secret=" + secret + "&response="
                    + gRecaptchaResponse;
            // Send post request
            con.setDoOutput(true);
            DataOutputStream wr = new DataOutputStream(con.getOutputStream());
            wr.writeBytes(postParams);
            wr.flush();
            wr.close();
            int responseCode = con.getResponseCode();
            System.out.println("\nSending 'POST' request to URL : " + url);
            System.out.println("Post parameters : " + postParams);
            System.out.println("Response Code : " + responseCode);
            BufferedReader in = new BufferedReader(new InputStreamReader(
                    con.getInputStream()));
            String inputLine;
            StringBuffer response = new StringBuffer();
            while ((inputLine = in.readLine()) != null) {
                response.append(inputLine);
            }
            in.close();
            // print result
            System.out.println(response.toString());
            //parse JSON response and return 'success' value
            JsonReader jsonReader = Json.createReader(new StringReader(response.toString()));
            JsonObject jsonObject = jsonReader.readObject();
            jsonReader.close();
            return jsonObject.getBoolean("success");
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean createUser(UserDTO user) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(CREATE);
                ptm.setString(1, user.getUserName());
                ptm.setString(2, user.getGender());
                ptm.setString(3, user.getEmail());
                ptm.setString(4, user.getPassword());
                ptm.setString(5, user.getRoleID());
                check = ptm.executeUpdate() > 0 ? true : false;
            }

        } catch (Exception e) {
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }

    public boolean checkDuplicate(String userName, String email) throws SQLException {
        boolean check = true;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(DUPLICATE);
                ptm.setString(1, userName);
                ptm.setString(2, email);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    check = false;
                }
            }

        } catch (Exception e) {
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }

    public List<UserDTO> getListUser(String search) throws SQLException {
        List<UserDTO> listUser = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(SEARCH);
                ptm.setString(1, "%" + search + "%");
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String userID = rs.getString("userID");
                    String userName = rs.getString("userName");
                    String gender = rs.getString("gender");
                    String birthdate = rs.getString("birthday");
                    String email = rs.getString("email");
                    String address = rs.getString("address");
                    String roleID = rs.getString("roleID");
                    String password = "***";
                    listUser.add(new UserDTO(userID, userName, gender, email, address, password, roleID, birthdate));
                }
            }

        } catch (Exception e) {

        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return listUser;
    }

    public boolean update(UserDTO user) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(UPDATE);
                ptm.setString(1, user.getUserName());
                ptm.setString(2, user.getGender());
                ptm.setString(3, user.getEmail());
                ptm.setString(4, user.getBirthdate());
                ptm.setString(5, user.getAddress());
                ptm.setString(6, user.getRoleID());
                ptm.setInt(7, Integer.parseInt(user.getUserID()));
                check = ptm.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception e) {

        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }

    public boolean delete(String userID) throws SQLException {
        boolean result = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(DELETE);
                ptm.setInt(1, Integer.parseInt(userID));
                result = ptm.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception e) {
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return result;
    }

    public UserDTO getUser(String userName, String email) throws SQLException {
        UserDTO user = null;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_USER);
                ptm.setString(1, userName);
                ptm.setString(2, email);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    String userID = rs.getString("userID");
                    String gender = rs.getString("gender");
                    String password=rs.getString("password");
                    String address = rs.getString("address");
                    String birthdate = rs.getString("birthday");
                    String roleID = rs.getString("roleID");
                    user=new UserDTO(userID, userName, gender, email, address, password, roleID, birthdate);
                }
            }
        } catch (Exception e) {
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return user;
    }

}
