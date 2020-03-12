<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Register Page</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!--===============================================================================================-->	
        <link rel="icon" type="image/png" href="images/icons/favicon.ico"/>
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
        <!--===============================================================================================-->	
        <link rel="stylesheet" type="text/css" href="vendor/css-hamburgers/hamburgers.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="vendor/animsition/css/animsition.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
        <!--===============================================================================================-->	
        <link rel="stylesheet" type="text/css" href="vendor/daterangepicker/daterangepicker.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="css/util.css">
        <link rel="stylesheet" type="text/css" href="css/main.css">
        <!--===============================================================================================-->
    </head>
    <body style="background-color: #666666;">
        <%@include file="nav.jsp"%>
        <div class="limiter">
            <div class="container-login100">
                <div class="wrap-login100">
                    <form action="MainController" class="login100-form validate-form" method="POST">
                        <span class="login100-form-title p-b-43">
                            Register
                        </span>


                        <div class="wrap-input100 validate-input" data-validate="UserID is required">
                            <input class="input100" type="text" name="userID">
                            <span class="focus-input100"></span>
                            <span class="label-input100">User ID</span>

                        </div>
                        <font color="red">${sessionScope.REGISTERERROR.userIDError}</font>

                        <div class="wrap-input100 validate-input" data-validate="Password is required">
                            <input class="input100" type="password" name="password">
                            <span class="focus-input100"></span>
                            <span class="label-input100">Password</span>
                        </div>

                        <div class="wrap-input100 validate-input" data-validate="Confirm password is required">
                            <input class="input100" type="password" name="confirmPassword">
                            <span class="focus-input100"></span>
                            <span class="label-input100">Confirm Password</span>

                        </div>
                        <font color="red">${sessionScope.REGISTERERROR.confirmPasswordError}</font>
                        
                        <div class="wrap-input100 validate-input" data-validate="UserName is required">
                            <input class="input100" type="text" name="userName">
                            <span class="focus-input100"></span>
                            <span class="label-input100">User Name</span>
                        </div>

                        <div class="col-12 col-md-4 col-lg-5" style="margin-left: -1rem">
                            <div class="form-group">
                                <label for="gender">Gender</label>
                                <select class="form-control" name="gender" id="gender">
                                    <option name="male" value="Male">Male</option>
                                    <option name="feMale" value="FeMale">Female</option>
                                    <option name="other" value="Other">Other</option>
                                </select>
                            </div>
                        </div>

                        <div class="container-login100-form-btn">
                            <button class="login100-form-btn" name="action" value="Sign Up">
                                Sign Up
                            </button>
                        </div>

                    </form>

                    <div class="login100-more" style="background-image: url('images/bg-01.jpg');">
                    </div>
                </div>
            </div>
        </div>


        <!--===============================================================================================-->
        <script src="vendor/jquery/jquery-3.2.1.min.js"></script>
        <!--===============================================================================================-->
        <script src="vendor/animsition/js/animsition.min.js"></script>
        <!--===============================================================================================-->
        <script src="vendor/bootstrap/js/popper.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.min.js"></script>
        <!--===============================================================================================-->
        <script src="vendor/select2/select2.min.js"></script>
        <!--===============================================================================================-->
        <script src="vendor/daterangepicker/moment.min.js"></script>
        <script src="vendor/daterangepicker/daterangepicker.js"></script>
        <!--===============================================================================================-->
        <script src="vendor/countdowntime/countdowntime.js"></script>
        <!--===============================================================================================-->
        <script src="js/main.js"></script>


        <script src="js/jquery/jquery-2.2.4.min.js"></script>
        <!-- Popper js -->
        <script src="js/popper.min.js"></script>
        <!-- Bootstrap js -->
        <script src="js/bootstrap.min.js"></script>
        <!-- Plugins js -->
        <script src="js/plugins.js"></script>
        <script src="js/classy-nav.min.js"></script>
        <script src="js/jquery-ui.min.js"></script>
        <!-- Active js -->
        <script src="js/active.js"></script>

    </body>
</html>