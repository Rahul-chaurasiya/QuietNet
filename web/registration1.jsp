<%-- 
    Document   : index.jsp
    Created on : Jul 7, 2023, 4:31:29 PM
    Author     : HP
--%>

<%@page import="com.net.helper.ConnectionProvider" %>
<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>QuietNet &#8226; Signup</title>
        <link rel="icon" type="image/x-icon" href="logo2.png">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css"integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>
    <style>
        @import url(//fonts.googleapis.com/css?family=Lato:300:400);

        body {
            margin: 0;
        }

        .material-icons {
            font-size: 44px;
            color: #ffffff;
        }

        h1 {
            font-family: "Lato", sans-serif;
            font-weight: 300;
            letter-spacing: 2px;
            font-size: 48px;
        }

        p {
            font-family: "Lato", sans-serif;
            letter-spacing: 1px;
            font-size: 14px;
            color: #333333;
        }

        .header {
            position: relative;
            text-align: center;
            background: linear-gradient(60deg,
                rgba(84, 58, 183, 1) 0%,
                rgba(0, 172, 193, 1) 100%);
            color: white;
        }

        .logo {
            width: 50px;
            fill: white;
            padding-right: 15px;
            display: inline-block;
            vertical-align: middle;
        }

        .inner-header {
            height: 65vh;
            width: 100%;
            margin: 0;
            padding: 0;
        }

        .flex {
            /*Flexbox for containers*/
            display: flex;
            justify-content: center;
            align-items: center;
            text-align: center;
        }

        .waves {
            position: relative;
            width: 100%;
            height: 15vh;
            margin-bottom: -7px;
            /*Fix for safari gap*/
            min-height: 100px;
            max-height: 150px;
        }

        .content {
            position: relative;
            height: 20vh;
            text-align: center;
            background-color: white;
        }

        /* Animation */

        .parallax>use {
            animation: move-forever 25s cubic-bezier(0.55, 0.5, 0.45, 0.5) infinite;
        }

        .parallax>use:nth-child(1) {
            animation-delay: -2s;
            animation-duration: 7s;
        }

        .parallax>use:nth-child(2) {
            animation-delay: -3s;
            animation-duration: 10s;
        }

        .parallax>use:nth-child(3) {
            animation-delay: -4s;
            animation-duration: 13s;
        }

        .parallax>use:nth-child(4) {
            animation-delay: -5s;
            animation-duration: 20s;
        }

        @keyframes move-forever {
            0% {
                transform: translate3d(-90px, 0, 0);
            }

            100% {
                transform: translate3d(85px, 0, 0);
            }
        }

        /*Shrinking for mobile*/
        @media (max-width: 768px) {
            .waves {
                height: 40px;
                min-height: 40px;
            }

            .content {
                height: 30vh;
            }

            h1 {
                font-size: 24px;
            }
        }
    </style>

    <body>
        <div class="header">
            <!--Content before waves-->
            <div class="inner-header" style="margin-bottom:5%">
                <!--Just the logo.. Don't mind this-->
                <nav class="navbar navbar-expand-lg navbar-dark" style="margin-left:6%">
                    <!-- <i class="material-icons navbar-brand">fitbit</i> -->
                    <div class="mt-2 flex">
                        <div style="width: 47px;"><img src="logo2.png" class="navbar-brand"></div>
                    <h3 class="ml-2 display-5" style="color: #01d5d9; font-size: 23px;">QuietNet</h3>
                    </div>
                </nav>

                <form action="registration2.jsp" method="POST" class="mx-auto max-w-xl" style="margin-top:2rem;">
                    <span class="fa fa-3x fa-user-circle"></span>
                    <h1 class="text-xl font-bold leading-tight tracking-tight text-gray-900 md:text-2xl dark:text-white"style="margin-top:auto; margin-bottom: 3%;">
                        Sign in to your account
                    </h1>
                    <div class="grid grid-cols-1 gap-x-8 gap-y-6 sm:grid-cols-2">
                        <div class="sm:col-span-2">
                            <h6 class=" tracking-tight text-gray-900 sm:text-xl text-left text-white">Enter Name</h6>
                            <div class="relative mt-2.5">
                                <div>
                                    <input name="ubasicname" type="text" autocomplete="name" class="block w-full rounded-md border-0 px-3.5 py-2 pl-20 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6 ">
                                </div>
                            </div>
                        </div>

                        <div class="sm:col-span-2">
                            <h6 class="tracking-tight text-gray-900 sm:text-xl text-left text-white">Enter Number</h6>
                            <div class="relative mt-2.5">
                                <div class="absolute inset-y-0 left-0 flex items-center">
                                    <label for="country" class="sr-only">Country</label>
                                    <select id="country" name="country"class="h-full rounded-md border-0 bg-transparent bg-none py-0 pl-4 pr-9 text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm">
                                        <option>US</option>
                                        <option>CA</option>
                                        <option>IND</option>
                                        <option>EU</option>
                                    </select>
                                </div>
                                <div>
                                    <input name="uNumber" type="text" autocomplete="tel" class="block w-full rounded-md border-0 px-3.5 py-2 pl-20 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6 ">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="mt-10">
                        <button type="submit" onclick="redirect()" id="submit" class="block w-full rounded-md bg-indigo-600 px-3.5 py-2.5 text-center text-sm font-semibold text-white shadow-sm hover:bg-indigo-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600">Let's Start</button>
                        <%--<%= //  %>--%>
                    </div>
                </form>
            </div>

            <!--Waves Container-->
            <div>
                <svg class="waves" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"viewBox="0 24 150 28" preserveAspectRatio="none" shape-rendering="auto">
                <defs>
                <path id="gentle-wave"d="M-160 44c30 0 58-18 88-18s 58 18 88 18 58-18 88-18 58 18 88 18 v44h-352z" />
                </defs>
                <g class="parallax">
                <use xlink:href="#gentle-wave" x="48" y="0" fill="rgba(255,255,255,0.7" />
                <use xlink:href="#gentle-wave" x="48" y="3" fill="rgba(255,255,255,0.5)" />
                <use xlink:href="#gentle-wave" x="48" y="5" fill="rgba(255,255,255,0.3)" />
                <use xlink:href="#gentle-wave" x="48" y="7" fill="#fff" />
                </g>
                </svg>
            </div>
            <!--Waves end-->


        </div>
        <!--Header ends-->



        <!--Content starts-->
        <div class="content flex">
            <p>Connect Me:
                <a href="https://www.linkedin.com/" target="_blank" rel="noopener noreferrer"><span class="iconify d-inline-block" data-icon="bi:linkedin"></span></a>
                <a href="https://github.com/" target="_blank" rel="noopener noreferrer"><span class="iconify d-inline-block" data-icon="bi:github"></span></a>
                <a href="https://www.instagram.com/" target="_blank" rel="noopener noreferrer"><span class="iconify d-inline-block" data-icon="bi:instagram"></span></a>
            </p>
        </div>


    </body>

    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.3/dist/umd/popper.min.js"integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js"integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"crossorigin="anonymous"></script>
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://code.iconify.design/1/1.0.7/iconify.min.js"></script>

    <!--    <script>
            function redirect(){
                window.location = "registration3.jsp";
            }
        </script>-->

</html>





<!--<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
<% Connection con = ConnectionProvider.getConnection();%>
<%= con%>
</body>
</html>-->
