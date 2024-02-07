<%-- 
    Document   : registration3
    Created on : Jul 8, 2023, 5:31:16 PM
    Author     : HP
--%>

<%@page import="com.net.helper.ConnectionProvider" %>
<%@page import="java.sql.*" %>
<%
    // Retrieve the values from the form
    String ubasicname = request.getParameter("ubasicname");
    String uNumber = request.getParameter("uNumber");
    String uName = request.getParameter("uName");
    String uEmail = request.getParameter("uEmail");
    String uPassword = request.getParameter("uPassword");
    String uGender = request.getParameter("uGender");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>QuietNet &#8226; Profile Picture Selection</title>
        <link rel="icon" type="image/x-icon" href="logo2.png">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css"integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            @import url(//fonts.googleapis.com/css?family=Lato:300:400);
            body {
                background-image: linear-gradient(rgba(84, 58, 183, 1), rgba(0, 172, 193, 1));
                background-size: cover;
                background-repeat: no-repeat;
                background-attachment: fixed;
            }

            .flex {
                /*Flexbox for containers*/
                display: flex;
                justify-content: center;
                align-items: center;
                text-align: center;
            }


            .picture-container {
                display: flex;
                flex-wrap: wrap;
            }

            .picture-container img {
                width: 150px;
                height: 150px;
                object-fit: cover;
                margin: 10px;
                cursor: pointer;
            }

            .selected-image img {
                width: 300px;
                height: 300px;
                object-fit: cover;
            }

            .logo{
                width: 55px;
            }


            .picture-container label {
                margin-bottom: 50px; /* Adjust the margin-bottom value as needed */
            }
            .picture-container img {
                width: 100%;
                height: auto;/* Adjust the margin-bottom value as needed */
            }

            .content {
                position: relative;
                height: 20vh;
                text-align: center;
                background-color: white;
            }
        </style>

    </style>
</head>

<body>
    <nav class="navbar navbar-expand-lg navbar-dark" style="margin-left:6%">
        <!-- <i class="material-icons navbar-brand">fitbit</i> -->
        <div class="mt-2 flex">
            <div style="width: 55px;"><img src="logo2.png" class="navbar-brand logo"></div>
            <h3 class="ml-2 display-5" style="color: #01d5d9; font-size: 23px;">QuietNet</h3>
        </div>
    </nav>

    <div class="container" style="margin-top: 5%; margin-bottom: 10%;">
        <div class="row justify-content-center">
            <div class="col-md-6 text-center">
                <div >
                    <h2 class="text-white" style="margin-bottom: 5.5rem;"> Profile Picture Selection</h2>
                </div>
                <form id="reg-form" action="registerServlet" method="POST">

                    <!--fetching all values from registration3.jsp-->
                    <input type="hidden" name="ubasicname" value="<%= ubasicname%>">
                    <input type="hidden" name="uNumber" value="<%= uNumber%>">
                    <input type="hidden" name="uName" value="<%= uName%>">
                    <input type="hidden" name="uEmail" value="<%= uEmail%>">
                    <input type="hidden" name="uGender" value="<%= uGender%>">
                    <input type="hidden" name="uPassword" value="<%= uPassword%>">                  


                    <div class="picture-container row">

                        <label class="col-md-2">
                            <input type="radio" name="profilePic" value="bear.png" hidden>
                            <img src="profile_pic/bear.png" alt="Picture 2" class="img-fluid">
                        </label>
                        <label class="col-md-2">
                            <input type="radio" name="profilePic" value="beard.png" hidden>
                            <img src="profile_pic/beard.png" alt="Picture 3" class="img-fluid">
                        </label>
                        <label class="col-md-2">
                            <input type="radio" name="profilePic" value="boy (1).png" hidden>
                            <img src="profile_pic/boy (1).png" alt="Picture 3" class="img-fluid">
                        </label>
                        <label class="col-md-2">
                            <input type="radio" name="profilePic" value="profilePic" hidden>
                            <img src="profile_pic/boy.png" alt="Picture 3" class="img-fluid">
                        </label>
                        <label class="col-md-2">
                            <input type="radio" name="profilePic" value="empathy.png" hidden>
                            <img src="profile_pic/empathy.png" alt="Picture 1" class="img-fluid">
                        </label>
                        <label class="col-md-2">
                            <input type="radio" name="profilePic" value="gamer.png" hidden>
                            <img src="profile_pic/gamer.png" alt="Picture 2" class="img-fluid">
                        </label>
                        <label class="col-md-2">
                            <input type="radio" name="profilePic" value="girl.png" hidden>
                            <img src="profile_pic/girl.png" alt="Picture 3" class="img-fluid">
                        </label>
                        <label class="col-md-2">
                            <input type="radio" name="profilePic" value="hacker (1).png" hidden>
                            <img src="profile_pic/hacker (1).png" alt="hacker (1).png" class="img-fluid">
                        </label>
                        <label class="col-md-2">
                            <input type="radio" name="profilePic" value="hacker.png" hidden>
                            <img src="profile_pic/hacker.png" alt="Picture 3" class="img-fluid">
                        </label>
                        <label class="col-md-2">
                            <input type="radio" name="profilePic" value="man (1).png" hidden>
                            <img src="profile_pic/man (1).png" alt="Picture 3" class="img-fluid">
                        </label>
                        <label class="col-md-2">
                            <input type="radio" name="profilePic" value="man (2).png" hidden>
                            <img src="profile_pic/man (2).png" alt="Picture 3" class="img-fluid">
                        </label>
                        <label class="col-md-2">
                            <input type="radio" name="profilePic" value="man (3).png" hidden>
                            <img src="profile_pic/man (3).png" alt="Picture 3" class="img-fluid">
                        </label>
                        <label class="col-md-2">
                            <input type="radio" name="profilePic" value="man (4).png" hidden>
                            <img src="profile_pic/man (4).png" alt="Picture 3" class="img-fluid">
                        </label>
                        <label class="col-md-2">
                            <input type="radio" name="profilePic" value="man (5).png" hidden>
                            <img src="profile_pic/man (5).png" alt="Picture 3" class="img-fluid">
                        </label>
                        <label class="col-md-2">
                            <input type="radio" name="profilePic" value="man (6).png" hidden>
                            <img src="profile_pic/man (6).png" alt="Picture 3" class="img-fluid">
                        </label>
                        <label class="col-md-2">
                            <input type="radio" name="profilePic" value="man (7).png" hidden>
                            <img src="profile_pic/man (7).png" alt="Picture 3" class="img-fluid">
                        </label>
                        <label class="col-md-2">
                            <input type="radio" name="profilePic" value="man (8).png" hidden>
                            <img src="profile_pic/man (8).png" alt="Picture 3" class="img-fluid">
                        </label>
                        <label class="col-md-2">
                            <input type="radio" name="profilePic" value="man (9).png" hidden>
                            <img src="profile_pic/man (9).png" alt="Picture 3" class="img-fluid">
                        </label>
                        <label class="col-md-2">
                            <input type="radio" name="profilePic" value="man (10).png" hidden>
                            <img src="profile_pic/man (10).png" alt="Picture 3" class="img-fluid">
                        </label>
                        <label class="col-md-2">
                            <input type="radio" name="profilePic" value="man (11).png" hidden>
                            <img src="profile_pic/man (11).png" alt="Picture 3" class="img-fluid">
                        </label>
                        <label class="col-md-2">
                            <input type="radio" name="profilePic" value="man (12).png" hidden>
                            <img src="profile_pic/man (12).png" alt="Picture 3" class="img-fluid">
                        </label>
                        <label class="col-md-2">
                            <input type="radio" name="profilePic" value="man.png" hidden>
                            <img src="profile_pic/man.png" alt="Picture 3" class="img-fluid">
                        </label>
                        <label class="col-md-2">
                            <input type="radio" name="profilePic" value="panda.png" hidden>
                            <img src="profile_pic/panda.png" alt="Picture 3" class="img-fluid">
                        </label>
                        <label class="col-md-2">
                            <input type="radio" name="profilePic" value="rabbit.png" hidden>
                            <img src="profile_pic/rabbit.png" alt="Picture 3" class="img-fluid">
                        </label>
                        <label class="col-md-2">
                            <input type="radio" name="profilePic" value="user (1).png" hidden>
                            <img src="profile_pic/user (1).png" alt="Picture 3" class="img-fluid">
                        </label>
                        <label class="col-md-2">
                            <input type="radio" name="profilePic" value="user.png" hidden>
                            <img src="profile_pic/user.png" alt="Picture 3" class="img-fluid">
                        </label>
                        <label class="col-md-2">
                            <input type="radio" name="profilePic" value="woman (1).png" hidden>
                            <img src="profile_pic/woman (1).png" alt="Picture 3" class="img-fluid">
                        </label>
                        <label class="col-md-2">
                            <input type="radio" name="profilePic" value="woman (2).png" hidden>
                            <img src="profile_pic/woman (2).png" alt="Picture 3" class="img-fluid">
                        </label>
                        <label class="col-md-2">
                            <input type="radio" name="profilePic" value="woman.png" hidden>
                            <img src="profile_pic/woman.png" alt="Picture 3" class="img-fluid">
                        </label>
                        <label class="col-md-2">
                            <input type="radio" name="profilePic" value="woman (3).png" hidden>
                            <img src="profile_pic/woman (3).png" alt="Picture 3" class="img-fluid">
                        </label>
                        <!-- Add more image labels with col-md-2 class as needed -->
                    </div>

                    <div class="container text-center" id="loader" style="display:none;">
                        <span class="fa fa-refresh fa-spin fa-4x"></span>
                        <h4>Please wait..</h4>
                    </div>

                    <button style="width: 100%;" type="submit" id="submit-btn" class="btn btn-primary mt-3 ">Submit</button>
                    <!-- <div class="row">
                        <div class="col-md-6">
                            <button type="submit"style="width: 100%;" class="btn btn-primary mt-3">Skip</button>
                        </div>
                        <div class="col-md-6">
                            <button style="width: 100%;" type="submit" class="btn btn-primary mt-3 ">Submit</button>
                        </div>
                    </div> -->
                </form>

            </div>

            <div class="col-md-6">
                <div >
                    <h2 class="text-white text-center" style="margin-bottom: 5.5rem; margin-left: 43%;"> Preview </h2>
                </div>
                <div class="selected-image text-right">
                    <img src="profile_pic/default.png" id="selected-img" alt="png">
                </div>
            </div>
        </div>
    </div>



    <div class="content flex">
        <p>Connect Me:
            <a href="https://www.linkedin.com/" target="_blank" rel="noopener noreferrer"><span class="iconify d-inline-block" data-icon="bi:linkedin"></span></a>
            <a href="https://github.com/" target="_blank" rel="noopener noreferrer"><span class="iconify d-inline-block" data-icon="bi:github"></span></a>
            <a href="https://www.instagram.com/" target="_blank" rel="noopener noreferrer"><span class="iconify d-inline-block" data-icon="bi:instagram"></span></a>
        </p>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.3/dist/umd/popper.min.js"integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js"integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"crossorigin="anonymous"></script>
    <script src="https://code.iconify.design/1/1.0.7/iconify.min.js"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>

    <script>
        // Update the selected image when clicked
        $('input[name="profilePic"]').click(function () {
            var selectedImageSrc = $(this).siblings('img').attr('src');
            $('.selected-image img').attr('src', selectedImageSrc);
        });
    </script>


    <script>
        $(document).ready(function () {
            console.log("loaded...");
            $('#reg-form').on('submit', function (event) {
                event.preventDefault();
                let form = new FormData(this);

                // send to register servlet
                $("#submit-btn").hide();
                $("#loader").show();
                $.ajax({
                    url: "registerServlet",
                    type: 'POST',
                    data: form,
                    success: function (data, textStatus, jqXHR) {
                        console.log(data);
                        $("#submit-btn").show();
                        $("#loader").hide();

                        if (data.trim() === 'done') {
                            swal("Registered Successfully!", "You clicked the button!", "success").then((value) => {
                                window.location = "login.jsp";
                            });
                        } else {
                            swal(data);
                        }

                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        console.log(jqXHR);
                        $("#submit-btn").show();
                        $("#loader").hide();
                        swal("Something went wrong ! try again .. ");

                    },
                    processData: false,
                    contentType: false
                });
            });
        });
    </script>
</body>

</html>