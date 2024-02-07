package com.net.dao;

import com.net.entities.Post;
import com.net.entities.User;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PostDao {

    Connection con;

    public PostDao(Connection con) {
        this.con = con;
    }

    public ArrayList<String> getAllTitles() {
        ArrayList<String> list = new ArrayList<>();
        try {
            String q = "SELECT pTitle FROM post GROUP BY pTitle;";
            Statement st = this.con.createStatement();
            ResultSet set = st.executeQuery(q);
            while (set.next()) {
                String title = set.getString("pTitle");
                list.add(title);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public boolean savePost(Post p) {
        boolean f = false;
        try {
            String q = "INSERT INTO post (pTitle, pDescription, pUserid) VALUES (?,?,?)";
            PreparedStatement pstmt = this.con.prepareStatement(q);
            pstmt.setString(1, p.getpTitle());
            pstmt.setString(2, p.getpDescription());
            pstmt.setInt(3, p.getpUserid());
            pstmt.executeUpdate();
            f = true;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    public List<Post> getAllPosts() {
        List<Post> list = new ArrayList<>();
        //fetch all the post
        try {
            PreparedStatement p = con.prepareStatement("select * from post order by pId desc");
            ResultSet set = p.executeQuery();

            while (set.next()) {
                int pid = set.getInt("pId");
                String pTitle = set.getString("pTitle");
                String pDescription = set.getString("pDescription");
                String pPic = set.getString("pPic");
                Timestamp date = set.getTimestamp("pDate");
                int userId = set.getInt("pUserId");
                Post post = new Post(pid, pTitle, pDescription, pPic, date, userId);
                list.add(post);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Post> getPostsBycId(String pTitle) {
        List<Post> list = new ArrayList<>();
        //fetch all the post by pTitle
        try {
            PreparedStatement p = con.prepareStatement("select * from post where pTitle=?");
            p.setString(1, pTitle);
            ResultSet set = p.executeQuery();

            while (set.next()) {
                int pid = set.getInt("pId");
                String pDescription = set.getString("pDescription");
                String pPic = set.getString("pPic");
                Timestamp date = set.getTimestamp("pDate");
                int userId = set.getInt("pUserId");
                Post post = new Post(pid, pTitle, pDescription, pPic, date, userId);
                list.add(post);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public User getUserIdbyPId(int pUserid) {
        User user = null;
        //fetch all details of user by postuserid
        try {
            PreparedStatement p = con.prepareStatement("select * from user where uid=(select pUserid from post where pId=?)");
            p.setInt(1, pUserid);
            ResultSet set = p.executeQuery();

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
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }

    public Post getPostByPId(int pId) {
        Post post = null;
        try {
            PreparedStatement p = con.prepareStatement("select * from post where pId=?");
            p.setInt(1, pId);
            ResultSet set = p.executeQuery();
            
            if(set.next()){
                int pid = set.getInt("pId");
                String pTitle = set.getString("pTitle");
                String pDescription = set.getString("pDescription");
                String pPic = set.getString("pPic");
                Timestamp date = set.getTimestamp("pDate");
                int userId = set.getInt("pUserId");
                
                post = new Post(pid, pTitle, pDescription, pPic, date, userId);
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }

        return post;
    }
    
    
    
    public List<Post> getPostsByUserId(int pUserid) {
        List<Post> list = new ArrayList<>();
        //fetch all the post by Userid
        try {
            PreparedStatement p = con.prepareStatement("select * from post where pUserid = ?");
            p.setInt(1, pUserid);
            ResultSet set = p.executeQuery();

            while (set.next()) {
                int pid = set.getInt("pId");
                String pDescription = set.getString("pDescription");
                String pPic = set.getString("pPic");
                Timestamp date = set.getTimestamp("pDate");
                String pTitle = set.getString("pTitle");
                Post post = new Post(pid, pTitle, pDescription, pPic, date, pUserid);
                list.add(post);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    
    
}
