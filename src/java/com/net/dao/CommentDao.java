package com.net.dao;

import com.net.entities.Comment;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CommentDao {

    private final Connection connection;

    public CommentDao(Connection connection) {
        this.connection = connection;
    }

    public boolean addComment(Comment comment) {
        try {
            String query = "INSERT INTO comment (cContent, cPostId, cUserId) VALUES (?, ?, ?)";
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, comment.getcContent());
            ps.setInt(2, comment.getcPostId());
            ps.setInt(3, comment.getcUserId());

            int i = ps.executeUpdate();
            return i == 1;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return false;
    }

    public List<Comment> getCommentsByPostId(int postId) {
        List<Comment> comments = new ArrayList<>();
        try {
            String query = "SELECT * FROM comment WHERE cPostId = ?";
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, postId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                int commentId = rs.getInt("cId");
                String content = rs.getString("cContent");
                int userId = rs.getInt("cUserId");
                Timestamp commentDate = rs.getTimestamp("cDate");

                Comment comment = new Comment();
                comment.setcId(commentId);
                comment.setcContent(content);
                comment.setcPostId(postId);
                comment.setcUserId(userId);
                comment.setcDate(commentDate);

                comments.add(comment);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return comments;
    }

    public boolean deleteComment(int commentId) {
        try {
            String query = "DELETE FROM comment WHERE cId = ?";
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, commentId);

            int i = ps.executeUpdate();
            return i == 1;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return false;
    }

    public void closeConnection() {
        try {
            if (connection != null && !connection.isClosed()) {
                connection.close();
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
}
