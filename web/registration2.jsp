<%-- 
    Document   : registration2.jsp
    Created on : Jul 7, 2023, 7:24:53 PM
    Author     : HP
--%>

<%@page import="com.net.helper.ConnectionProvider" %>
<%@page import="java.sql.*" %>
<%
    // Retrieve the values from the form
    String ubasicname = request.getParameter("ubasicname");
    String uNumber = request.getParameter("uNumber");
%>
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
            <div class="inner-header">
                <!--Just the logo.. Don't mind this-->
                <nav class="navbar navbar-expand-lg navbar-light pb-3" style="margin-left:6%">
                    <!-- <i class="material-icons navbar-brand">fitbit</i> -->
                    <div class="mt-2 flex">
                        <div style="width: 47px;"><img src="logo2.png" class="navbar-brand"></div>
                    <h3 class="ml-2 display-5" style="color: #01d5d9; font-size: 23px;">QuietNet</h3>
                    </div>
                </nav>

                <div class="container max-width">
                    <form class="needs-validation" action="registration3.jsp" method="POST">
                        <div class="container-fluid font-bold " style="max-width: 40%;">
                            <div style="margin-bottom: 2%;">
                                <!--taking input values from registration1.jsp-->
                                <input type="hidden" name="ubasicname" value="<%= ubasicname%>">
                                <input type="hidden" name="uNumber" value="<%= uNumber%>">
                                <label for="validationCustomUsername" style="float:left">
                                    <h3>Username</h3>
                                </label>
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text" id="inputGroupPrepend">@</span>
                                    </div>
                                    <input type="name" name="uName"  class="form-control" id="validationCustomUsername" placeholder=""aria-describedby="inputGroupPrepend" required>
                                    <div class="invalid-feedback">Please choose a username.</div>
                                </div>
                            </div>

                            <div>
                                <label for="email" style="float:left">Email</label>
                                <input type="email" name="uEmail" class="form-control" id="email" name="email" requiredpattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$">
                                <div class="invalid-feedback">Please enter a valid email address.</div>
                            </div>

                            <div style="margin-bottom: 2%;">
                                <div class="d-md-flex justify-content-start align-items-center mb-4 py-2">
                                    <h6 class="mb-0 me-4">Gender: </h6>
                                    <div class="form-check form-check-inline mb-0 me-4">
                                        <input class="form-check-input" type="radio" name="uGender" id="femaleGender" value="Female" />
                                        <label class="form-check-label" for="femaleGender">Female</label>
                                    </div>

                                    <div class="form-check form-check-inline mb-0 me-4">
                                        <input class="form-check-input" type="radio" name="uGender" id="maleGender" value="Male" />
                                        <label class="form-check-label" for="maleGender">Male</label>
                                    </div>

                                    <div class="form-check form-check-inline mb-0">
                                        <input class="form-check-input" type="radio" name="uGender" id="otherGender" value="Other" />
                                        <label class="form-check-label" for="otherGender">Other</label>
                                    </div>
                                </div>
                            </div>

                            <div style="margin-bottom: 2%;" class="row">
                                <div class="col-6">
                                    <label for="validationCustomPassword" style="float:left">
                                        <h3>Password</h3>
                                    </label>
                                    <div class="input-group">
                                        <input type="password" name="uPassword" class="form-control" id="validationCustomPassword"placeholder="" required>
                                    </div>
                                </div>
                                <div class="col-6">
                                    <label for="validationCustomConfirmPassword" style="float:left">
                                        <h3>Confirm Password</h3>
                                    </label>
                                    <div class="input-group">
                                        <input type="password" class="form-control" id="validationCustomConfirmPassword"placeholder="" required>
                                    </div>
                                    <div class="invalid-feedback mismatch" style="text-align: left;">Passwords do not match.</div>
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="form-check">
                                <input class="form-check-input" name="check" type="checkbox" value="" id="invalidCheck" required>
                                <label class="form-check-label" for="invalidCheck">Agree to terms and conditions</label>
                                <div class="invalid-feedback">You must agree before submitting.</div>
                            </div>
                        </div>
                        <button class="btn  bg-indigo-600" style="width:38%" type="submit">Next </button>
                    </form>
                </div>


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

    <script>
        var passwordInput = document.getElementById('validationCustomPassword');
        var confirmPasswordInput = document.getElementById('validationCustomConfirmPassword');
        var mismatchMessage = document.querySelector('.mismatch');

        confirmPasswordInput.addEventListener('focusout', function () {
            if (confirmPasswordInput.value !== passwordInput.value) {
                mismatchMessage.style.display = 'block';
            } else {
                mismatchMessage.style.display = 'none';
            }
        });
    </script>

</html>
