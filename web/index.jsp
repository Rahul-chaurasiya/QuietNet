<%-- 
    Document   : index
    Created on : Jul 18, 2023, 10:16:41 AM
    Author     : HP
--%>

<%@page import="com.net.dao.LikeDao"%>
<%@page import="com.net.entities.User"%>
<%@page import="com.net.dao.UserDao"%>
<%@page import="java.util.List"%>
<%@page import="com.net.entities.Post"%>
<%@page import="com.net.helper.ConnectionProvider"%>
<%@page import="com.net.helper.ConnectionProvider"%>
<%@page import="com.net.dao.PostDao"%>
<%@page errorPage="error_page.jsp" %>
<script src="myjs/index.js" type="text/javascript"></script>
<%
    User user = (User) session.getAttribute("currentuser");
    if (user == null) {
        response.sendRedirect("login.jsp");
    } else {

    }
%>

<%
    PostDao d = new PostDao(ConnectionProvider.getConnection());
    PostDao u = new PostDao(ConnectionProvider.getConnection());

//    String title = request.getParameter("str");
    int post_user_id = Integer.parseInt(request.getParameter("pUserid"));
    
    List<Post> posts = null;
    
    posts = d.getPostsByUserId(post_user_id);
    
    for (Post p : posts) {
        User u1 = u.getUserIdbyPId(p.getPid());
        LikeDao l = new LikeDao(ConnectionProvider.getConnection());
        int countlike = l.countLikeOnPost(p.getPid());
        String str = p.getpDescription();

        String[] words = str.split("\\s+");
        String firstEightWords = "";

        if (words.length > 8) {
            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < 8; i++) {
                sb.append(words[i]).append(" ");
            }
            firstEightWords = sb.toString().trim();
        } else {
            firstEightWords = str;
        }

        System.out.println(firstEightWords);

%>

<div class="timeline-header" style="margin-bottom: 1%">
    <li>
        <span style="padding: 1% 2%;border: 0px solid black;background: #363f4d;border-radius: 27px;padding-bottom: 5px; padding-top:3px;margin-left: 1%;color: white;font-size: smaller;font-weight: 500;" ><%= p.getpTitle()%></span>
            <span style="margin-left: 2%;font-size: 16px;font-family: cursive">
                <%= firstEightWords%>
            </span>
        <span class="pull-right text-muted" ><%= countlike%></span>
        <a href="post.jsp?profile_id=<%= p.getPid()%>" class="fa-stack fa-fw stats-icon pull-right text-muted">
            <i class="fa fa-circle fa-stack-2x text-primary"></i>
            <i class="fa fa-thumbs-up fa-stack-1x fa-inverse"></i>
        </a>
        <a href="post.jsp?post_id=<%= p.getPid() %>" style="margin-right: 2%;font-size: 13px;color: blue;font-style: italic;font-family: ui-sans-serif;" class="pull-right">See Full Post...</a>
    </li>
</div>

<%
    }
%>