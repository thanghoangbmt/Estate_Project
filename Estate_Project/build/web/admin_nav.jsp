<%-- 
    Document   : nav
    Created on : Dec 8, 2019, 7:26:04 PM
    Author     : Admin
--%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="description" content="">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <link rel="icon" href="img/core-img/favicon.ico">

        <link rel="stylesheet" href="style.css">
    </head>
    <body>
        <!-- Preloader -->
        <div id="preloader">
            <div class="south-load"></div>
        </div>

        <!-- ##### Header Area Start ##### -->
        <header class="header-area">

            <!-- Top Header Area -->
            <div class="top-header-area">
                <div class="h-100 d-md-flex justify-content-between align-items-center">
                    <div class="email-address">
                        <a href="mailto:thanghoang1011@gmail.com">thanghoang1011@gmail.com</a>
                    </div>

                    <c:if test="${sessionScope.USER != null}">
                        <c:if test="${not empty sessionScope.USER.userName}">
                            <div class="justify-content-between align-items-center d-md-flex" style="margin-top: 1rem">
                                <p>Welcome ${sessionScope.USER.userName}!</p>
                            </div>
                        </c:if>
                    </c:if>

                    <div class="phone-number d-flex">
                        <div class="icon">
                            <img src="img/icons/phone-call.png" alt="">
                        </div>
                        <div class="number">
                            <a href="tel:0963492364">0963492364</a>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Main Header Area -->
            <div class="main-header-area" id="stickyHeader">
                <div class="classy-nav-container breakpoint-off">
                    <!-- Classy Menu -->
                    <nav class="classy-navbar justify-content-between" id="southNav">

                        <!-- Logo -->
                        <a class="nav-brand" href="AdminIndexController"><img src="img/core-img/logo.png" alt=""></a>

                        <!-- Navbar Toggler -->
                        <div class="classy-navbar-toggler">
                            <span class="navbarToggler"><span></span><span></span><span></span></span>
                        </div>

                        <!-- Menu -->
                        <div class="classy-menu">

                            <!-- close btn -->
                            <div class="classycloseIcon">
                                <div class="cross-wrap"><span class="top"></span><span class="bottom"></span></div>
                            </div>

                            <!-- Nav Start -->
                            <div class="classynav">
                                <ul>
                                    <li>
                                        <c:url var="adminIndex" value="MainController">
                                            <c:param name="action" value="AdminIndex"></c:param>
                                        </c:url>
                                        <a href="${adminIndex}">Estate Management</a>
                                    </li>
                                    
                                    <li>
                                        <c:url var="adminIndexAccount" value="MainController">
                                            <c:param name="action" value="AdminIndexAccount"></c:param>
                                        </c:url>
                                        <a href="${adminIndexAccount}">Account Management</a>
                                    </li>
                                    
                                    <li>
                                        <c:url var="adminIndexInvoice" value="MainController">
                                            <c:param name="action" value="AdminIndexInvoice"></c:param>
                                        </c:url>
                                        <a href="${adminIndexInvoice}">Invoice History</a>
                                    </li>
                                    
                                    <c:if test="${sessionScope.USER == null}">
                                        <li><a href="login.jsp">Login/Register</a></li>
                                    </c:if>
                                    <c:if test="${sessionScope.USER != null}">
                                        <c:url var="adminLogout" value="MainController">
                                            <c:param name="action" value="Logout"></c:param>
                                        </c:url>
                                        <li><a href="${adminLogout}">Logout</a></li>
                                    </c:if>
                                </ul>
                            </div>
                            <!-- Nav End -->
                        </div>
                    </nav>
                </div>
            </div>
        </header>
                                        
        <script src="js/jquery/jquery-2.2.4.min.js"></script>
         <!--Popper js--> 
        <script src="js/popper.min.js"></script>
         <!--Bootstrap js--> 
        <script src="js/bootstrap.min.js"></script>
         <!--Plugins js--> 
        <script src="js/plugins.js"></script>
        <script src="js/classy-nav.min.js"></script>
        <script src="js/jquery-ui.min.js"></script>
         <!--Active js--> 
        <script src="js/active.js"></script>
    </body>
</html>
