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
<%--<%@page import="myjs/index.js" %>--%>
<%
    User user = (User) session.getAttribute("currentuser");
//    if (user == null) {
//        response.sendRedirect("login.jsp");
//    } else {
//
//    }
%>

<%
    Thread.sleep(500);
    PostDao d = new PostDao(ConnectionProvider.getConnection());
    PostDao u = new PostDao(ConnectionProvider.getConnection());

    String title = request.getParameter("str");
    List<Post> posts = null;

    if (title.equals("x")) {
        posts = d.getAllPosts();
    } else {
        posts = d.getPostsBycId(title);
    }

%>

<div class="" style="font-weight: 500;font-size: 25px;color: honeydew; margin-bottom: 2%;">All Posts : (<%= posts.size()%>)</div>

<%
    for (Post p : posts) {
        User u1 = u.getUserIdbyPId(p.getPid());
%>


<div class="container card" style="background-color: transparent">
    <div class="row card-image">
        <div class="col-md-12">
            <div id="content" class="content content-full-width">
                <div class="profile-content" style="margin: 0px 5%">
                    <div class="tab-content p-0">
                        <div class="tab-pane fade active show" id="profile-post">
                            <ul class="timeline">
                                <li>
                                    <div class="timeline-body">
                                        <div class="timeline-header">
                                            <span style="border: 2px solid black; radius: 27px;" class="userimage"><img src="profile_pic/<%= u1.getProfile()%>" alt=""></span>
                                            <span class="username"><a href="member_profile.jsp?profile_id=<%= p.getpUserid() %>"><%= u1.getUsername()%></a>
                                                <!--<span class="pull-right text-muted">18 Views</span>-->
                                                <span style="padding: 1% 2%;border: 0px solid black;background: #363f4d;border-radius: 27px;padding-bottom: 5px; padding-top:3px;margin-left: 3%;color: white;font-size: smaller;font-weight: 500;" ><%= p.getpTitle()%></span>
                                        </div>
                                        <div class="timeline-content" style="font-family: cursive; font-stretch:extra-expanded; font-size: 15px ">
                                            <p>
                                                <%= p.getpDescription()%>
                                            </p>
                                        </div>
                                        <div style="cursor: pointer" class="timeline-likes">
                                            <a href="post.jsp?post_id=<%= p.getPid()%>" class="stats-right">
                                                <span class="stats-text">259 Shares</span>
                                                <span class="stats-text">21 Comments</span>
                                            </a>
                                            <div style="cursor: pointer" class="stats">
                                                <a href="post.jsp?post_id=<%= p.getPid()%>" class="fa-stack fa-fw stats-icon">
                                                    <i class="fa fa-circle fa-stack-2x text-danger"></i>
                                                    <i class="fa fa-heart fa-stack-1x fa-inverse t-plus-1"></i>
                                                </a>
                                                <a href="post.jsp?post_id=<%= p.getPid()%>" class="fa-stack fa-fw stats-icon">
                                                    <i class="fa fa-circle fa-stack-2x text-primary"></i>
                                                    <i class="fa fa-thumbs-up fa-stack-1x fa-inverse"></i>
                                                </a>
                                                <%
                                                    LikeDao l = new LikeDao(ConnectionProvider.getConnection());
                                                    int countlike = l.countLikeOnPost(p.getPid());
                                                %>
                                                <a href="post.jsp?post_id=<%= p.getPid()%>" style="cursor: pointer" onclick="doLike(<%= p.getPid()%>,<%= user.getId()%>)" class="stats-total like-counter"><%= countlike%></a>
                                            </div>
                                        </div>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="card-content d-flex flex-column align-items-center">
        <a href="post.jsp?post_id=<%= p.getPid()%>" >
            <h4 class="pt-2">See Full Post</h4>
            <h5>Load Post</h5>
        </a>

        <ul class="social-icons d-flex justify-content-center" style="visibility: hidden;">
            <li style="--i:1">
                <a href="post.jsp?post_id=<%= p.getPid()%>">
                    <i class='far fa-thumbs-up'></i>
                </a>
            </li>
            <li style="--i:2">
                <a href="post.jsp?post_id=<%= p.getPid()%>">
                    <i class='fas fa-comments'></i>
                </a>
            </li>
            <li style="--i:3">
                <a href="post.jsp?post_id=<%= p.getPid()%>">
                    <i class='fas fa-share-alt'></i>
                </a>
            </li>
        </ul>
    </div>
    <hr style="width: 102%;color: white;border-bottom: 1px solid #fff;margin-bottom: 2%;">
</div>

<%
    }
%>



 <!--style="backdrop-filter: none; height: 100% !important; margin-top: 5%!important; top: 3px !important;"-->