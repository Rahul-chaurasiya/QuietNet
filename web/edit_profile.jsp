<%-- 
    Document   : edit_profile
    Created on : Jul 21, 2023, 3:40:30 PM
    Author     : HP
--%>


<%@page import="com.net.entities.User"%>
<%@page import="com.net.dao.UserDao"%>
<%@page import="com.net.helper.ConnectionProvider"%>
<%

    int user_id = Integer.parseInt(request.getParameter("profile_id"));
    UserDao user = new UserDao(ConnectionProvider.getConnection());
    User user_profile = user.getuserbyId(user_id);
%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">/
        <link rel="icon" type="image/x-icon" href="logo2.png">
        <title>QuietNet &#8226; Update Profile</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    </head>
    <style type="text/css">

        @import url(//fonts.googleapis.com/css?family=Lato:300:400);

        body {
            height: 100%;
            margin: 0;
            padding-top: 40px;
            color: #2e323c;
            background-image: linear-gradient(rgba(84, 58, 183, 1), rgba(0, 172, 193, 1));
            background-size: cover;
            background-repeat: no-repeat;
            background-attachment: fixed;
        }

        .account-settings .user-profile {
            margin: 0 0 1rem 0;
            padding-bottom: 1rem;
            text-align: center;
        }

        .account-settings .user-profile .user-avatar {
            margin: 0 0 1rem 0;
        }

        .account-settings .user-profile .user-avatar img {
            width: 90px;
            height: 90px;
            -webkit-border-radius: 100px;
            -moz-border-radius: 100px;
            border-radius: 100px;
        }

        .account-settings .user-profile h5.user-name {
            margin: 0 0 0.5rem 0;
        }

        .account-settings .user-profile h6.user-email {
            margin: 0;
            font-size: 0.8rem;
            font-weight: 400;
            color: #9fa8b9;
        }

        .account-settings .about {
            margin: 2rem 0 0 0;
            text-align: center;
        }

        .account-settings .about h5 {
            margin: 0 0 15px 0;
            color: #007ae1;
        }

        .account-settings .about p {
            font-size: 0.825rem;
        }

        .form-control {
            border: 1px solid #cfd1d8;
            -webkit-border-radius: 2px;
            -moz-border-radius: 2px;
            border-radius: 2px;
            font-size: .825rem;
            background: #ffffff;
            color: #2e323c;
        }

        .card {
            background: #ffffff;
            -webkit-border-radius: 5px;
            -moz-border-radius: 5px;
            border-radius: 5px;
            border: 0;
            margin-bottom: 1rem;
        }

        .imageclick {
            position: absolute;
            top: 2px;
            left: 0;
            background-color: rgba(0, 0, 0, 0.7);
            padding: 10px;
            opacity: 0;
            transition: opacity 0.3s ease;
        }

        .user-avatar:hover .imageclick {
            opacity: 85%;
        }

        .img-fluid {
            width: 65px !important;
            height: auto !important;
        }

        .col-md-2 img {
            cursor: pointer;
        }
    </style>

    <body>

        <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog"
             aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLongTitle">Select Profile</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="text-center">
                            <div class="picture-container row" style="cursor: pointer;">
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
                            <button style="width: 100%;" type="submit" class="btn btn-primary mt-3 " class="close"data-dismiss="modal">Done</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>




        <div id="snippetContent">
            <div class="container">
                <div class="row gutters">
                    <div class="col-xl-3 col-lg-3 col-md-12 col-sm-12 col-12">
                        <div class="card h-100">
                            <div class="card-body">
                                <div class="account-settings">
                                    <div class="user-profile">
                                        <div style="position: relative; display: inline-block;"
                                             class="user-avatar selected-image">
                                            <img class="ppic" src="profile_pic/<%= user_profile.getProfile()%>" alt="Maxwell Admin">
                                            <div class="">
                                                <button class="imageclick btn btn-primary" data-toggle="modal"data-target="#exampleModalCenter" style="width:90px; height: 90px; background-color: #c2c7c9; border-radius: 51px; border:none; font-size: 12px; font-weight: 700; color: #2e323c;">Edit</button>
                                            </div>
                                        </div>
                                        <h5 class="user-name"><%= user_profile.getBasicname()%></h5>
                                    </div>
                                    <div class="about">
                                        <h5 style="color: #513eb7">About</h5>
                                        <p> <%= user_profile.getBio()%>  </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-9 col-lg-9 col-md-12 col-sm-12 col-12" id="cvb">
                        <div class="card h-100">
                            <div class="card-body">
                                <form action="updateProfileServlet" method="POST" id="reg-form">
                                    <div class="row gutters">
                                        <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                            <h6 class="mb-2" style="color: #513eb7">Personal Details</h6>
                                        </div>

                                        <input type="text" name="uPic" value="<%= user_profile.getProfile()%>" id="pic_name" hidden>

                                        <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                            <div class="form-group"> 
                                                <label for="fullName">Name</label> 
                                                <input type="text" name="ubasicname" readonly class="form-control" id="fullName" value="<%= user_profile.getBasicname()%>">
                                            </div>
                                        </div>   
                                        <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                            <div class="form-group"> 
                                                <label for="eMail">Email</label> 
                                                <input type="email"readonly name="uEmail" class="form-control" id="eMail" value="<%= user_profile.getEmail()%>">
                                            </div>
                                        </div>
                                        <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                            <div class="form-group"> 
                                                <label for="phone">Phone No.</label> 
                                                <input type="text" name="uNumber" class="form-control" id="phone" value="<%= user_profile.getNumber()%>">
                                            </div>
                                        </div>
                                        <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                            <div class="form-group"> 
                                                <label for="user-name">QuietNet Name</label> 
                                                <input type="text" readonly class="form-control" name="uName" id="website" value="<%= user_profile.getUsername()%>"></div>
                                        </div>
                                    </div>

                                    <div class="row gutters">
                                        <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                            <h6 class="mt-3 mb-2" style="color: #513eb7">Public Details</h6>
                                        </div>
                                        <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                            <div class="form-group">
                                                <label for="Street">Select Gender</label>
                                                <select class="form-control" name="uGender">
                                                    <option value="<%= user_profile.getGender()%>"><%= user_profile.getGender()%></option>
                                                    <option value="Male">Male</option>
                                                    <option value="Female">Female</option>
                                                    <option value="Other">Other</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                            <div class="form-group"> 
                                                <label for="Profession">Profession</label> 
                                                <input type="name" name="uProfession" class="form-control" value="<%= user_profile.getProfession()%>">
                                            </div>
                                        </div>


                                        <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                            <div class="form-group"> 
                                                <label for="password">Password</label> 
                                                <input type="password" name="uPassword" class="form-control" id="validationCustomPassword" value="<%= user_profile.getPassword()%>">
                                            </div>
                                            <div class="form-group"> 
                                                <label for="password">Conform Password</label> 
                                                <input type="password" class="form-control" id="validationCustomConfirmPassword" value="<%= user_profile.getPassword()%>">
                                            </div>
                                            <div class="invalid-feedback mismatch" style="text-align: left; font-weight: 650; font-size: x-small; color: #ff0000;">Passwords do not match</div>
                                        </div>

                                        <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                            <div class="form-group"> 
                                                <label for="sTate">Bio</label>
                                                <textarea name="uBio" type="text" class="form-control" rows="5" ><%= user_profile.getBio()%></textarea>
                                            </div>
                                        </div>

                                    </div>

                                    <div class="row gutters">
                                        <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                            <div class="text-right">
                                                <button type="button" name="submit" class="btn btn-secondary">Cancel</button>
                                                <button style="background-color: #513eb7" type="submit" id="submit" name="submit" class="btn btn-primary">Update</button>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>

    </body>

    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"crossorigin="anonymous"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>



    <script>
        // Update the selected image when clicked
        $('input[name="profilePic"]').click(function () {
            var selectedImageSrc = $(this).siblings('img').attr('src');
            $('.selected-image img').attr('src', selectedImageSrc);
            var picName = selectedImageSrc.replace(/^.*[\\\/]/, '');
            $('#pic_name').val(picName);
        });

    </script>

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


    <script>
        $(document).ready(function () {
            console.log("loaded...");
            $('#reg-form').on('submit', function (event) {
                event.preventDefault();
                let form = new FormData(this);
                console.log(form.get("uPassword"));
                // send to register servlet
                $.ajax({
                    url: "updateProfileServlet",
                    type: 'POST',
                    data: form,
                    success: function (data, textStatus, jqXHR) {
                        console.log(data);

                        if (data.trim() === 'done') {
                            swal("Updated Successfully!", "You clicked the button!", "success").then((value) => {
                                setTimeout(function () {
                                    window.location = "login.jsp";
                                }, 1000); // 2000 milliseconds (2 seconds) delay
                            });

                        } else {
                            swal(data);
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

</html>