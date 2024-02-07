package com.net.dao;

import java.sql.*;
import com.net.entities.User;
import com.net.helper.ConnectionProvider;

public class UserDao {

    private final Connection conn;

    public UserDao(Connection conn) {
        this.conn = conn;
    }

    // mehtod to insert user in database
    public boolean savedata(User user) {
        boolean flag = false;
        try {
            String query = "INSERT INTO user (uNumber, ubasicname, uName, uEmail, uGender, uPassword, uPic) VALUES (?,?,?,?,?,?,?)";
            PreparedStatement pstmt = this.conn.prepareStatement(query);
            pstmt.setString(1, user.getNumber());
            pstmt.setString(2, user.getBasicname());
            pstmt.setString(3, user.getUsername());
            pstmt.setString(4, user.getEmail());
            pstmt.setString(5, user.getGender());
            pstmt.setString(6, user.getPassword());
            pstmt.setString(7, user.getProfile());

            pstmt.executeUpdate();
            flag = true;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return flag;
    }

    // getting email and password
    public User getuserbyemailandpassword(String email, String password) {
        User user = null;
        try {
            String query = "select * from user where uEmail=? and uPassword=?";
            PreparedStatement pstmt = conn.prepareStatement(query);
            pstmt.setString(1, email);
            pstmt.setString(2, password);

            ResultSet set = pstmt.executeQuery();
            if (set.next()) {
                user = new User();
                String uname = set.getString("uName");
                user.setUsername(uname);

                user.setId(set.getInt("uId"));
                user.setBasicname(set.getString("ubasicname"));
                user.setNumber(set.getString("uNumber"));
                user.setEmail(set.getString("uEmail"));
                user.setGender(set.getString("uGender"));
                user.setPassword(set.getString("uPassword"));
                user.setUdate(set.getTimestamp("uDate"));
                user.setProfile(set.getString("uPic"));
                user.setBio(set.getString("uBio"));
                user.setProfession(set.getString("uOccupation"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }

    // get user by Id
    public User getuserbyId(int uId) {
        User user = null;
        try {
            String query = "select * from user where uId = ?";
            PreparedStatement pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, uId);

            ResultSet set = pstmt.executeQuery();
            if (set.next()) {
                user = new User();
                String uname = set.getString("uName");
                user.setUsername(uname);
                user.setBasicname(set.getString("ubasicname"));
                user.setNumber(set.getString("uNumber"));
                user.setEmail(set.getString("uEmail"));
                user.setGender(set.getString("uGender"));
                user.setPassword(set.getString("uPassword"));
                user.setUdate(set.getTimestamp("uDate"));
                user.setProfile(set.getString("uPic"));
                user.setBio(set.getString("uBio"));
                user.setProfession(set.getString("uOccupation"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }

    public boolean updatedata(User user) {
        boolean flag = false;
        try {
            String query = "UPDATE user SET uNumber = ?, uGender = ?, uPassword = ?, uPic = ?, uBio = ?, uOccupation = ? WHERE (uName = ?)";
            PreparedStatement pstmt = this.conn.prepareStatement(query);
            pstmt.setString(1, user.getNumber());
            pstmt.setString(2, user.getGender());
            pstmt.setString(3, user.getPassword());
            pstmt.setString(4, user.getProfile());
            pstmt.setString(5, user.getBio());
            pstmt.setString(6, user.getProfession());
            pstmt.setString(7, user.getUsername());

            pstmt.executeUpdate();
            flag = true;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return flag;
    }

    public User getUserByCommentId(int commentId) {
        User user = null;
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            conn = ConnectionProvider.getConnection();
            String query = "SELECT u.* FROM user u INNER JOIN comment c ON u.uId = c.cUserId WHERE c.cId = ?";
            stmt = conn.prepareStatement(query);
            stmt.setInt(1, commentId);
            rs = stmt.executeQuery();

            if (rs.next()) {
                // Create a User object with the retrieved details
                user = new User();
                user.setId(rs.getInt("uId"));
                user.setUsername(rs.getString("username"));
                // Set other user details as needed
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // Close connections and resources (rs, stmt, conn) here in a try-catch-finally block
        }

        return user;
    }
}
