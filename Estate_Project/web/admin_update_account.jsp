<%-- 
    Document   : admin_update_account
    Created on : Dec 14, 2019, 3:58:04 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
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

        <title>Admin Update Account Page</title>
    </head>
    <body>
        <c:if test="${sessionScope.USER.roleID ne 'AD'}">
            <c:redirect url="login.jsp"></c:redirect>
        </c:if>
        <%@include file="admin_nav.jsp"%>
        <div class="limiter">
            <div class="container-login100">
                <div class="wrap-login100">
                    <form action="MainController" class="login100-form validate-form" method="POST">
                        <span class="login100-form-title p-b-43">
                            Admin Update Account
                        </span>


                        <div class="wrap-input100 validate-input" data-validate="UserID is required">
                            <input class="input100" type="text" name="userID" readonly="true" value="${requestScope.userID}">
                            <span class="focus-input100"></span>
                            <span class="label-input100">User ID</span>
                        </div>

                        <div class="wrap-input100 validate-input" data-validate="Current Password is required">
                            <input class="input100" type="password" name="currentPassword">
                            <span class="focus-input100"></span>
                            <span class="label-input100">Current Password</span>
                        </div>
                        <font color="red">${sessionScope.REGISTERERROR.passwordError}</font>

                        <div class="wrap-input100 validate-input" data-validate="New Password is required">
                            <input class="input100" type="password" name="newPassword">
                            <span class="focus-input100"></span>
                            <span class="label-input100">New Password</span>
                        </div>

                        <div class="wrap-input100 validate-input" data-validate="Confirm password is required">
                            <input class="input100" type="password" name="confirmPassword">
                            <span class="focus-input100"></span>
                            <span class="label-input100">Confirm Password</span>
                        </div>
                        <font color="red">${sessionScope.REGISTERERROR.confirmPasswordError}</font>

                        <div class="wrap-input100 validate-input" data-validate="UserName is required">
                            <input class="input100" type="text" name="userName" value="${requestScope.userName}">
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

                        <div class="col-12 col-md-4 col-lg-5" style="margin-left: -1rem">
                            <div class="form-group">
                                <label for="roleID">Role</label>
                                <select class="form-control" name="roleID">
                                    <option name="AD" value="AD">Admin</option>
                                    <option name="Customer" value="Customer">Customer</option>
                                </select>
                            </div>
                        </div>

                        <div class="container-login100-form-btn">
                            <button class="login100-form-btn" name="action" value="Admin_Update_Account">
                                Update Account
                            </button>
                        </div>

                    </form>

                    <div class="login100-more" style="background-image: url('images/bg-01.jpg');">
                    </div>
                </div>
            </div>
        </div>

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
