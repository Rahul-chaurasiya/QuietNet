<%-- 
    Document   : main_profile
    Created on : Jul 10, 2023, 3:45:41 PM
    Author     : HP
--%>

<%@page isErrorPage="true" %>
<%@page import="java.util.ArrayList"%>
<%@page import="com.net.dao.PostDao"%>
<%@page import="com.net.helper.ConnectionProvider"%>
<%@page import="com.net.entities.User"%>
<%@page import="com.net.entities.Post"%>
<%
    User user = (User) session.getAttribute("currentuser");
//    if (user == null) {
//        response.sendRedirect("login.jsp");
//    } else {
//
//    }
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>QuietNet &#8226; All Posts</title>
        <link rel="icon" type="image/x-icon" href="logo2.png">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/flowbite/1.7.0/flowbite.min.css" rel="stylesheet" />
        <!--<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css">-->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css">
        <link href="css/post_loading.css" rel="stylesheet" type="text/css"/>
        <style>
            @import url(//fonts.googleapis.com/css?family=Lato:300:400);

            body {
                display: flex;
                flex-direction: column;
                min-height: 100vh;
                margin: 0;
                padding: 0;
                background-image: linear-gradient(rgba(84, 58, 183, 1), rgba(0, 172, 193, 1));
                background-size: cover;
                background-repeat: no-repeat;
                background-attachment: fixed;
            }

            .flex {
                display: flex;
                align-items: center;
            }

            .imgborder{
                border-radius: 75%;
                border: solid #000000;
            }

            .bordered-word {
                border: 1px solid black;
                padding: 2px;
                margin: 5px;
                display: inline-block;
                border-radius: 25px;
                margin-left: 1%;
                background-color: #373737d4;
                margin-right: 1%;
                padding: 0% 3%;
                color: bisque;
                padding-bottom: 3px;
                font-size: 13px;
            }

            .active-c-link{
                background-color: #8400ff !important;
            }

            .content-wrapper {
                flex: 1;
                display: flex;
                flex-direction: column;
            }

            .content-footer {
                flex-shrink: 0;
                text-align: center;
                background-color: white;
                padding: 3.5rem;
                margin-top: auto;
            }

        </style>

    </head>

    <body class="content-wrapper">
        <div style="margin-bottom: 8%">
            <nav class="navbar navbar-expand-lg navbar-light">
                <div class="container" style="margin-left: 7% !important;">
                    <!-- Left side div box -->
                    <div class="navbar-brand">
                        <div class="box-left flex">
                            <!-- Content for left div -->
                            <img src="logo2.png" style="height: 48px; margin: 5px;">
                            <span class="display-5" style="vertical-align: middle; color: #01d5d9; font-size: 22px; font-weight: 400;">QuietNet</span>
                        </div>
                    </div>

                    <!--Dropdown-->
                    <div id="dropdownHoverButton" data-dropdown-toggle="dropdownHover" type="button" data-dropdown-trigger="hover"class="text-white focus:ring-4 focus:outline-none font-medium text-sm px-5 py-2.5 text-center inline-flex items-center" style="margin-right: 5%;">
                        <img  src="profile_pic/<%= user.getProfile()%> " style="height: 40px;">
                    </div>
                    <!-- Dropdown menu -->
                    <div id="dropdownHover"class="z-10 hidden bg-white divide-y divide-gray-100 rounded-lg shadow w-44 dark:bg-gray-700">
                        <div class="container mt-3" style="text-align: -webkit-center;" >
                            <img class="imgborder" src="profile_pic/<%= user.getProfile()%>" style="height: 40px;">
                            <p style="margin: 8px 0px;"><%= user.getUsername()%></p>
                        </div>
                        <ul class="py-2 text-sm text-gray-700 dark:text-gray-200" aria-labelledby="dropdownHoverButton">
                            <li>
                                <a href="member_profile.jsp?profile_id=<%= user.getId() %>"class="block px-4 py-2 hover:bg-gray-100 dark:hover:bg-gray-600 dark:hover:text-white">My Profile</a>
                            </li>
                            <li>
                                <a href="#"class="block px-4 py-2 hover:bg-gray-100 dark:hover:bg-gray-600 dark:hover:text-white">Settings</a>
                            </li>
                            <li>
                                <a href="#"class="block px-4 py-2 hover:bg-gray-100 dark:hover:bg-gray-600 dark:hover:text-white">Earnings</a>
                            </li>
                            <li>
                                <a href="logoutServlet"class="block px-4 py-2 hover:bg-gray-100 dark:hover:bg-gray-600 dark:hover:text-white">Signout</a>
                            </li>
                        </ul>
                    </div>   
                </div>
            </nav>




            <div class="flex container" style="margin-top: 1%; ">
                <div class="col-md-3 container-fluid" style="align-self: normal; border-right: 1px solid #6cb6b299;">
                    <div class="" style="font-weight: 500;font-size: 32px;color: honeydew; margin-bottom: 4%;">
                        Discussion Topic : </div>

                    <a href="#" onclick="getposts('x', this)" class="bordered-word c-link active-c-link" style="text-align: start;padding-left:6%;padding-right:6%;">All Posts</a>
                    <%
                        PostDao d = new PostDao(ConnectionProvider.getConnection());
                        ArrayList<String> list = d.getAllTitles();
                        for (String str : list) {
                    %>
                    <button href="#" onclick="getposts('<%= str%>', this)" class="c-link bordered-word active-c-link" style="text-align: start;padding-left:6%;padding-right:6%; "><%= str%></button>
                    <%
                        }
                    %>

                </div>


                <div class="col-md-8 container-fluid"  style="align-self: self-start;">

                    <div class="container text-center" id="loader">
                        <i class="fa fa-refresh fa-4x fa-spin"></i>
                        <h3 class="mt-2">Loading...</h3>
                    </div>

                    <div class=""id="post-container" style="background:none !important;">
                        
                        
                        
                        <!--//fetching posts by ajax from file name load_posts-->
                        
                        
                    </div>
                </div>
            </div>


            <!-- Modal toggle -->
            <div class="flex m-5 fixed bottom-6 right-6 group rounded-lg" style="background-color: #523db8;">
                <button id="updateProductButton" data-modal-toggle="updateProductModal"
                        class="rounded-lg block text-white bg-primary-700 hover:bg-primary-800 focus:ring-4 focus:outline-none focus:ring-primary-300 font-medium text-sm px-5 py-2.5 text-center dark:bg-primary-600 dark:hover:bg-primary-700 dark:focus:ring-primary-800"
                        type="button">
                    ADD POST
                </button>
            </div>

            <!-- Main modal -->
            <div id="updateProductModal" tabindex="-1" aria-hidden="true"
                 class="hidden overflow-y-auto overflow-x-hidden fixed top-0 right-0 left-0 z-50 justify-center items-center w-full md:inset-0 h-modal md:h-full">
                <div class="relative p-4 w-full h-full md:h-auto" style="width: auto;">
                    <!-- Modal content -->
                    <div class="relative p-4 bg-white rounded-lg shadow dark:bg-gray-800 sm:p-5">
                        <!-- Modal header -->
                        <div
                            class="flex justify-between items-center pb-4 mb-4 rounded-t border-b sm:mb-5 dark:border-gray-600">
                            <h3 class="text-lg font-semibold text-gray-900 dark:text-white">Post Details : </h3>
                            <button type="button"
                                    class="text-gray-400 bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded-lg text-sm p-1.5 ml-auto inline-flex items-center dark:hover:bg-gray-600 dark:hover:text-white"
                                    data-modal-toggle="updateProductModal">
                                <svg aria-hidden="true" class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20"
                                     xmlns="http://www.w3.org/2000/svg">
                                <path fill-rule="evenodd"
                                      d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z"
                                      clip-rule="evenodd"></path>
                                </svg>
                                <span class="sr-only">Close modal</span>
                            </button>
                        </div>
                        <!-- Modal body -->
                        <div class="flex container" style="margin-top: 5%; ">
                            <div class="col-md-4 container-fluid"
                                 style="align-self: normal; border-right: 1px solid #6cb6b299;">
                                <div class=""
                                     style="font-weight: 500;font-size: 25px;color: rgb(80 85 96); margin-bottom: 4%;">
                                    Choose Title : 
                                </div>
                                <div style="font-size: 14px;">
                                    <%
                                        for (String str : list) {
                                    %>
                                    <button type="button" class="bordered-word" onclick="copyText(this)" style="text-align: start;"><%= str%></button>
                                    <%
                                        }
                                    %>
                                </div>
                            </div>

                            <div class="col-md-7 container-fluid">
                                <form action="addpostServlet" id="reg-form" method="POST">
                                    <div class="grid gap-4 mb-4 ">
                                        <div>
                                            <label for="name"class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Title</label>
                                            <input required type="text" name="pTitle" id="myInput" value="" placeholder="Enter Post Title..." class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500"placeholder="Ex. Apple iMac 27&ldquo;">
                                        </div>

                                        <div class="">
                                            <label for="description"class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Description</label>
                                            <textarea required name="pDescription" id="description" rows="5" class="block p-2.5 w-full text-sm text-gray-900 bg-gray-50 rounded-lg border border-gray-300 focus:ring-primary-500 focus:border-primary-500 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500"
                                                      placeholder="Write a description..."></textarea>
                                        </div>
                                    </div>
                                    <div class="flex items-center" style="margin: 4%; margin-top: 22%;">
                                        <button type="button" class="text-red-600 inline-flex items-center border border-red-600 hover:bg-red-600 focus:ring-4 focus:outline-none focus:ring-red-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center dark:border-red-500 dark:text-red-500  dark:hover:bg-red-600 dark:focus:ring-red-900">
                                            <svg class="mr-1 -ml-1 w-5 h-5" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                                            <path fill-rule="evenodd"d="M9 2a1 1 0 00-.894.553L7.382 4H4a1 1 0 000 2v10a2 2 0 002 2h8a2 2 0 002-2V6a1 1 0 100-2h-3.382l-.724-1.447A1 1 0 0011 2H9zM7 8a1 1 0 012 0v6a1 1 0 11-2 0V8zm5-1a1 1 0 00-1 1v6a1 1 0 102 0V8a1 1 0 00-1-1z" clip-rule="evenodd"></path>
                                            </svg>
                                            Delete
                                        </button>
                                        <button type="submit" id="submit-btn" style="background-color: #523db8; margin-left: 35%;"class="text-white hover:bg-primary-800 focus:ring-4 focus:outline-none focus:ring-primary-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center dark:bg-primary-600 dark:hover:bg-primary-700 dark:focus:ring-primary-800">
                                            Post
                                        </button>
                                    </div>
                                </form>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>



        <div class="content-footer">
            <p>Connect Me:
                <a href="https://www.linkedin.com/" target="_blank" rel="noopener noreferrer">
                    <span class="iconify d-inline-block" data-icon="bi:linkedin"></span>
                </a>
                <a href="https://github.com/" target="_blank" rel="noopener noreferrer">
                    <span class="iconify d-inline-block" data-icon="bi:github"></span>
                </a>
                <a href="https://www.instagram.com/" target="_blank" rel="noopener noreferrer">
                    <span class="iconify d-inline-block" data-icon="bi:instagram"></span>
                </a>
            </p>
        </div>
    </body>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/flowbite/1.7.0/flowbite.min.js"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
    <script src="https://code.iconify.design/1/1.0.7/iconify.min.js"></script>
    <!--<script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>-->



    <script>
                                        $(document).ready(function () {
                                            console.log("loaded...");
                                            $('#reg-form').on('submit', function (event) {
                                                event.preventDefault();
                                                let form = new FormData(this);

                                                $.ajax({
                                                    url: "addpostServlet",
                                                    type: 'POST',
                                                    data: form,
                                                    success: function (data, textStatus, jqXHR) {
                                                        console.log(data);

                                                        if (data.trim() === 'done') {
                                                            swal("Posted ...!", "", "success").then((value) => {
                                                                window.location = "main_profile.jsp";
                                                            });
                                                        } else {
                                                            swal("Nothing");
                                                            console.log(data);
                                                        }

                                                    },
                                                    error: function (jqXHR, textStatus, errorThrown) {
                                                        console.log(jqXHR);
                                                        swal("Something went wrong ! try again .. ");
                                                    },
                                                    processData: false,
                                                    contentType: false
                                                });
                                            });
                                        });
    </script>

    <script>
        function copyText(button) {
            var buttonValue = button.innerHTML; // Get the text of the clicked button
            document.getElementById("myInput").value = buttonValue; // Set the button text to the input box
        }
    </script>

    <!--loading  postusing ajex-->
    <script>
        function getposts(str, temp) {
            $("#loader").show();
            $("#post-container").hide()
            $(".c-link").removeClass('active-c-link');

            $.ajax({
                url: "load_posts.jsp",
                data: {str: str},
                success: function (data, textStatus, jqXHR) {
                    console.log(data);
                    $(temp).addClass('active-c-link');
                    $("#loader").hide();
                    $("#post-container").show();
                    $("#post-container").html(data);
                }
            })
        }

        $(document).ready(function (e) {
            let allpostref = $('.c-link')[0];
            getposts("x", allpostref)
        })
    </script>
</html>