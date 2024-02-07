package com.net.servlets;

import com.net.dao.CommentDao;
import com.net.entities.Comment;
import com.net.entities.User;
import com.net.helper.ConnectionProvider;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/CommentServlet")
public class CommentServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int postId = Integer.parseInt(request.getParameter("post_id"));
        String commentContent = request.getParameter("comment_content");

        // Perform validation on the comment content here (e.g., length check, HTML sanitization, etc.)
        // Store the comment in the database
        CommentDao commentDao = new CommentDao(ConnectionProvider.getConnection());
        int userId = ((User) request.getSession().getAttribute("currentuser")).getId();
        Comment comment = new Comment(commentContent, postId, userId);
        boolean commentAdded = commentDao.addComment(comment);

        if (commentAdded) {
            System.out.println("added");
            response.sendRedirect("post.jsp?post_id=" + postId);
        } else {
            System.out.println("error coour");
            response.sendRedirect("error_page.jsp");
        }
    }


}
