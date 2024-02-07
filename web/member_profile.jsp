<%-- 
    Document   : member_profile
    Created on : Jul 17, 2023, 4:42:38 PM
    Author     : HP
--%>

<%@page import="com.net.dao.LikeDao"%>
<%@page import="java.util.List"%>
<%@page import="com.net.entities.Post"%>
<%@page import="com.net.dao.PostDao"%>
<%@page import="com.net.helper.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.net.entities.User"%>
<%@page import="com.net.dao.UserDao"%>
<%@page errorPage="error_page.jsp"%>
<%
    User current_user = (User) session.getAttribute("currentuser");
    int user_id = Integer.parseInt(request.getParameter("profile_id"));
    
    
    UserDao user = new UserDao(ConnectionProvider.getConnection());
    User user_profile = user.getuserbyId(user_id);
    
    PostDao d = new PostDao(ConnectionProvider.getConnection());
    List<Post> posts = d.getPostsByUserId(user_id);
    int like_count = 0;
    for(Post p : posts){
        LikeDao likes = new LikeDao(ConnectionProvider.getConnection());
        like_count += likes.countLikeOnPost(p.getPid());
    }
   
%>


<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>QuietNet &#8226; <%= user_profile.getUsername() %></title>
        <link rel="icon" type="image/x-icon" href="logo2.png">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/flowbite/1.7.0/flowbite.min.css" rel="stylesheet" />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css">
        <link href="css/post_loading.css" rel="stylesheet" type="text/css"/>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/flowbite/1.7.0/flowbite.min.css" rel="stylesheet" />
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
    </head>
    <style>
        @import url(//fonts.googleapis.com/css?family=Lato:300:400);

        body {
            background-image: linear-gradient(rgba(84, 58, 183, 1), rgba(0, 172, 193, 1));
            background-size: cover;
            background-repeat: no-repeat;
            background-attachment: fixed;
        }

        .flex {
            display: flex;
            align-items: center;
        }

        .imgborder {
            border-radius: 75%;
            border: solid #000000;
        }

        .bordered-word {
            border: 1px solid black;
            padding: 2px;
            margin: 2px;
            display: inline-block;
            border-radius: 25px;
            margin-left: 1%;
            background-color: #373737d4;
            margin-right: 1%;
            padding: 0% 3%;
            color: bisque;
            padding-bottom: 3px;
        }

        .card{
            border: none;
        }

        .btn-outline-dark:hover{
            background-color: #513eb7;
        }

        .character-limit {
            display: inline-block;
            overflow: hidden;
            white-space: nowrap;
            text-overflow: ellipsis;
        }

        .profile-user-name{
            color: black;
            font-size: larger;
            font-family: inherit;
            font-weight: 600;
        }
    </style>

    <body>
        <nav class="navbar navbar-expand-lg navbar-light">
            <div class="container" style="margin-left: 2% !important;">
                <!-- Left side div box -->
                <div class="navbar-brand">
                    <div class="box-left flex">
                        <!-- Content for left div -->
                        <img src="logo2.png" style="height: 48px; margin: 5px;">
                        <span class="display-5" style="vertical-align: middle; color: #01d5d9; font-size: 22px; font-weight: 400;">QuietNet</span>
                    </div>
                </div>

                <div id="dropdownHoverButton" data-dropdown-toggle="dropdownHover" type="button"data-dropdown-trigger="hover" class="text-white focus:ring-4 focus:outline-none font-medium text-sm px-5 py-2.5 text-center inline-flex items-center" style="margin-right: 7%;">
                    <img src="profile_pic/<%= current_user.getProfile()%>" style="height: 40px;">
                </div>
                <!-- Dropdown menu -->
                <div id="dropdownHover"
                     class="z-10 hidden bg-white divide-y divide-gray-100 rounded-lg shadow w-44 dark:bg-gray-700">
                    <div class="container mt-3" style="text-align: -webkit-center;">
                        <img class="imgborder" src="profile_pic/<%= current_user.getProfile()%>" style="height: 40px;">
                        <p> <%= current_user.getUsername()%> </p>
                    </div>
                    <ul class="py-2 text-sm text-gray-700 dark:text-gray-200" aria-labelledby="dropdownHoverButton">
                        <li>
                            <a href="#" class="block px-4 py-2 hover:bg-gray-100 dark:hover:bg-gray-600 dark:hover:text-white">My Profile</a>
                        </li>
                        <li>
                            <a href="#" class="block px-4 py-2 hover:bg-gray-100 dark:hover:bg-gray-600 dark:hover:text-white">Settings</a>
                        </li>
                        <li>
                            <a href="#" class="block px-4 py-2 hover:bg-gray-100 dark:hover:bg-gray-600 dark:hover:text-white">Earnings</a>
                        </li>
                        <li>
                            <a href="#" class="block px-4 py-2 hover:bg-gray-100 dark:hover:bg-gray-600 dark:hover:text-white">Signout</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

        <section class="h-100 gradient-custom-2">
            <div class="container py-5 h-100">
                <div class="row d-flex justify-content-center align-items-center h-100">
                    <div class="col col-lg-9 col-xl-7">
                        <div class="card">
                            <div class="rounded-top text-white d-flex flex-row"
                                 style="background-color: #513eb7; height:200px;">
                                <div class="ms-4 mt-5 d-flex flex-column" style="width: 150px;">
                                    <img src="profile_pic/<%= user_profile.getProfile()%>" alt="Generic placeholder image" class="img-fluid img-thumbnail mt-4 mb-2" style="width: 150px; z-index: 1">

                                    <%
                                        if ((int) current_user.getId() == user_id) {
                                    %>
                                    <a href="edit_profile.jsp?profile_id=<%= current_user.getId() %>" type="button" class="btn btn-outline-dark" data-mdb-ripple-color="dark" style="z-index: 1;">
                                        Edit profile
                                    </a>
                                    <%
                                        }
                                    %>
                                </div>
                                <div class="ms-3" style="margin-top: 130px;">
                                    <h5 class="profile-user-name">Name: <%=user_profile.getUsername()%></h5>
                                    <p style="font-size: 14px; font-family: fangsong;" >Joining: <%= user_profile.getUdate().toLocaleString().substring(0, 13)%></p>
                                </div>
                            </div>
                            <div class="p-4 text-black" style="background-color: #f8f9fa;">
                                <div class="d-flex justify-content-end text-center py-1">
                                    <div>
                                        <p class="mb-1 h5"><%= posts.size() %></p>
                                        <p class="small text-muted mb-0">Posts</p>
                                    </div>
                                    <div class="px-3">
                                        <p class="mb-1 h5"><%= like_count %></p>
                                        <p class="small text-muted mb-0">Get Likes</p>
                                    </div>
                                    <div>
                                        <p class="mb-1 h5">478</p>
                                        <p class="small text-muted mb-0">Following</p>
                                    </div>
                                </div>
                            </div>
                            <div class="card-body p-4 text-black">
                                <div class="mb-5">
                                    <p class="lead fw-normal mb-1">About</p>
                                    <div class="p-4" style="background-color: #f8f9fa;">
                                        <p class="font-italic mb-1"><%= user_profile.getBio() %></p>
                                    </div>
                                </div>
                                <div class="d-flex justify-content-between align-items-center mb-4">
                                    <p class="lead fw-normal mb-0">Recent Posts</p>
                                    <p class="mb-0"><a href="#!" class="text-muted">Show all</a></p>
                                </div>

                                <div>

                                    <div id="post-container">

                                        <!--load post from post.jsp-->

                                    </div>


                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

    </body>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <<script src="https://cdnjs.cloudflare.com/ajax/libs/flowbite/1.7.0/flowbite.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/flowbite/1.7.0/flowbite.min.js"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
    <script src="https://code.iconify.design/1/1.0.7/iconify.min.js"></script>
    <script>


        $(document).ready(function (e) {
//            alert('iahfo');
            $.ajax({
                url: "index.jsp",
                data: {pUserid: <%= user_id %>},
                success: function (data, textStatus, jqXHR) {
                    console.log(data);
                    $("#post-container").html(data);
                }
            })
        })
    </script>

    <!--limit words for post box-->
    <!--    <script>
            $(document).ready(function () {
                var maxCharacters = 20;
                $('.character-limit').each(function () {
                    var text = $(this).text();
                    if (text.length > maxCharacters) {
                        $(this).text(text.substring(0, maxCharacters) + '...');
                    }
                });
            });
    
    
        </script>-->
</html>