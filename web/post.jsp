<%-- 
    Document   : post.jsp
    Created on : Jul 15, 2023, 2:39:06 PM
    Author     : HP
--%>
<%@page import="com.net.dao.UserDao"%>
<%@page import="java.util.List"%>
<%@page import="com.net.dao.CommentDao"%>
<%@page import="com.net.entities.Comment"%>
<%@page errorPage="error_page.jsp" %>
<%@page import="com.net.dao.LikeDao"%>
<%@page import="com.net.entities.User"%>
<%@page import="com.net.helper.ConnectionProvider"%>
<%@page import="com.net.dao.PostDao"%>
<%
    int Postid = Integer.parseInt(request.getParameter("post_id"));

    PostDao post = new PostDao(ConnectionProvider.getConnection());
    LikeDao like = new LikeDao(ConnectionProvider.getConnection());
    User login_user = (User) session.getAttribute("currentuser");

    Post p = (Post) post.getPostByPId(Postid);
    User post_user = post.getUserIdbyPId(p.getPid());
    int likecount = like.countLikeOnPost(Postid);
%>

<%@page import="com.net.entities.Post"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="icon" type="image/x-icon" href="logo2.png">
        <title>QuietNet &#8226; <%= p.getpTitle()%> </title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/flowbite/1.7.0/flowbite.min.css" rel="stylesheet" />
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="css/post.css" rel="stylesheet" type="text/css"/>
    </head>

    <body>
        <nav class="navbar navbar-expand-lg navbar-light">
            <div class="container" style="margin-left: 7% !important;">
                <!-- Left side div box -->
                <div class="navbar-brand">
                    <div class="box-left flex">
                        <!-- Content for left div -->
                        <img src="logo2.png" style="height: 48px; margin: 5px;">
                        <span class="display-5"
                              style="vertical-align: middle; color: #01d5d9; font-size: 22px; font-weight: 400;">QuietNet</span>
                    </div>
                </div>

                <div id="dropdownHoverButton" data-dropdown-toggle="dropdownHover" type="button"
                     data-dropdown-trigger="hover"
                     class="text-white focus:ring-4 focus:outline-none font-medium text-sm px-5 py-2.5 text-center inline-flex items-center"
                     style="margin-right: 7%;">
                    <img src="profile_pic/<%= login_user.getProfile()%>" style="height: 40px;">
                </div>
                <!-- Dropdown menu -->
                <div id="dropdownHover"
                     class="z-10 hidden bg-white divide-y divide-gray-100 rounded-lg shadow w-44 dark:bg-gray-700">
                    <div class="container mt-3" style="text-align: -webkit-center;">
                        <img class="imgborder" src="profile_pic/<%= post_user.getProfile()%>" style="height: 40px;">
                        <p style="margin: 8px 0px;"><%= login_user.getUsername()%></p>
                    </div>
                    <ul class="py-2 text-sm text-gray-700 dark:text-gray-200" aria-labelledby="dropdownHoverButton">
                        <li>
                            <a href="member_profile.jsp?profile_id=<%= login_user.getId()%>"class="block px-4 py-2 hover:bg-gray-100 dark:hover:bg-gray-600 dark:hover:text-white">My Profile</a>
                        </li>
                        <li>
                            <a href="#"
                               class="block px-4 py-2 hover:bg-gray-100 dark:hover:bg-gray-600 dark:hover:text-white">Settings</a>
                        </li>
                        <li>
                            <a href="#"
                               class="block px-4 py-2 hover:bg-gray-100 dark:hover:bg-gray-600 dark:hover:text-white">Earnings</a>
                        </li>
                        <li>
                            <a href="logoutServlet"
                               class="block px-4 py-2 hover:bg-gray-100 dark:hover:bg-gray-600 dark:hover:text-white">Signout</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>



        <div class="container" style="margin-top: 3%;">
            <div class="row">
                <div class="col-md-12">
                    <div id="content" class="content content-full-width">
                        <div class="profile-content">
                            <!-- begin tab-content -->
                            <div class="tab-content p-0">
                                <!-- begin #profile-post tab -->
                                <div class="tab-pane fade active show" id="profile-post">
                                    <!-- begin timeline -->
                                    <ul class="timeline">
                                        <li>
                                            <!-- begin timeline-time -->
                                            <div class="timeline-time">
                                                <span class="date"></span>
                                                <span class="time"><%= p.getpDate().toLocaleString()%></span>
                                            </div>
                                            <div class="timeline-icon">
                                                <a href="javascript:;">&nbsp;</a>
                                            </div>
                                            <div class="timeline-body">
                                                <div class="timeline-header">
                                                    <span class="userimage" style="border: 2px solid #2d353c;"><img
                                                            src="profile_pic/<%= post_user.getProfile()%>"
                                                            alt=""></span>
                                                    <span class="username"><a href="javascript:;"><%= post_user.getUsername()%></a>
                                                        <small></small></span>
                                                    <span class="pull-right text-muted">18 Views</span>
                                                </div>
                                                <div class="timeline-content"style="font-family: cursive">
                                                    <p>
                                                        <%= p.getpDescription()%>
                                                    </p>
                                                </div>
                                                <div class="timeline-likes">
                                                    <div class="stats-right">
                                                        <span class="stats-text">259 Shares</span>
                                                        <span class="stats-text">21 Comments</span>
                                                    </div>
                                                    <div class="stats">
                                                        <span class="fa-stack fa-fw stats-icon">
                                                            <i class="fa fa-circle fa-stack-2x text-danger"></i>
                                                            <i class="fa fa-heart fa-stack-1x fa-inverse t-plus-1"></i>
                                                        </span>
                                                        <span class="fa-stack fa-fw stats-icon">
                                                            <i class="fa fa-circle fa-stack-2x text-primary"></i>
                                                            <i class="fa fa-thumbs-up fa-stack-1x fa-inverse"></i>
                                                        </span>
                                                        <span class="stats-total like-counter"><%= likecount%></span>
                                                    </div>
                                                </div>
                                                <div class="timeline-footer">
                                                    <button onclick="doLike(<%= p.getPid()%>,<%= login_user.getId()%>)" href="javascript:;" class="m-r-15 text-inverse-lighter"><i
                                                            class="fa fa-thumbs-up fa-fw fa-lg m-r-3"></i> Like</button>
                                                    <a onclick="" href="javascript:;" class="m-r-15 text-inverse-lighter"><i
                                                            class="fa fa-comments fa-fw fa-lg m-r-3"></i> Comment</a>
                                                    <a href="javascript:;" class="m-r-15 text-inverse-lighter"><i
                                                            class="fa fa-share fa-fw fa-lg m-r-3"></i> Share</a>
                                                </div>
                                                <div class="timeline-comment-box">
                                                    <div class="user"><img
                                                            src="profile_pic/<%= login_user.getProfile()%>"></div>
                                                    <div class="input">
                                                        <form action="CommentServlet" method="post">
                                                            <div class="input-group">
                                                                <input style="border-radius: 6px; margin-left:3%" type="text" class="form-control rounded-corner"
                                                                       placeholder="Write a comment..." name="comment_content">
                                                                <input type="hidden" name="post_id" value="<%= p.getPid()%>">
                                                                <span style="border-radius: 6px" class="input-group-btn p-l-10">
                                                                    <button class="btn btn-primary f-s-12 rounded-corner" type="submit">Comment</button>
                                                                </span>
                                                            </div>
                                                        </form>

                                                    </div>
                                                </div>
                                            </div>

                                            <%
                                                // Fetch comments for the post using the postId
                                                CommentDao cmt = new CommentDao(ConnectionProvider.getConnection());
                                                UserDao userDao = new UserDao(ConnectionProvider.getConnection());
                                                List<Comment> comments = new CommentDao(ConnectionProvider.getConnection()).getCommentsByPostId(p.getPid());
                                                // Iterate through comments and display them
                                                for (Comment comment : comments) {
                                                    User commentUser = userDao.getuserbyId(comment.getcUserId());
                                            %>
                                            <!-- next page -->
                                        <li style="padding: 20px 6%;">
                                            <div class="timeline-time">
                                                <span class="date"><%= comment.getcDate().toLocaleString()%></span>
                                                <!--<span class="time">08:17</span>-->
                                            </div>
                                            <div class="timeline-icon">
                                                <a href="javascript:;">&nbsp;</a>
                                            </div>
                                            <div class="timeline-body">
                                                <div class="timeline-header">
                                                    <span class="userimage"><img src="profile_pic/<%= commentUser.getProfile()%>" alt=""></span>
                                                    <span class="username"><%= commentUser.getUsername()%></span>
                                                    <!--<span class="pull-right text-muted">1,282 Views</span>-->
                                                </div>
                                                <div class="timeline-content">
                                                    <p class="lead">
                                                        <i class="fa fa-quote-left fa-fw pull-left"></i>
                                                        <%= comment.getcContent()%>
                                                        <i class="fa fa-quote-right fa-fw pull-right"></i>
                                                    </p>
                                                </div>
                                                <div class="timeline-footer">
                                                    <a href="CommentServlet?action=delete&commentId=<%= comment.getcId()%>" onclick="confirmDelete(<%= comment.getcId()%>)" class="btn btn-danger btn-sm">
                                                        <i class="fa fa-trash"></i> <span>Delete</span>
                                                    </a>

                                                </div>
                                            </div>
                                        </li>

                                        <% }%>

                                </div>

                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>













</body>
<script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
<script src="myjs/index.js" type="text/javascript"></script>
<!--<script src="https://code.jquery.com/jquery-3.6.0.min.js"integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="crossorigin="anonymous"></script>-->
<!--<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>-->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/flowbite/1.7.0/flowbite.min.js"></script>
<script>
                                                        function confirmDelete(commentId) {
                                                            if (confirm('Are you sure you want to delete this comment?')) {
                                                            }
                                                        }


</script>
</html>