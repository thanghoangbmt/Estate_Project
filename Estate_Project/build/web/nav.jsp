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
                        <a class="nav-brand" href="IndexController"><img src="img/core-img/logo.png" alt=""></a>

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
                                    <li><a href="IndexController">Home</a></li>
                                    <!--<li><a href="#">Pages</a>-->
                                    <!--<ul class="dropdown">-->
                                    <!--<li><a href="IndexController">Home</a></li>-->
                                    <!--<li><a href="about-us.jsp">About Us</a></li>-->
                                    <!--<li><a href="CustomerSearchEstateController">Listings</a>-->
                                    <!--<ul class="dropdown">-->
                                    <li><a href="CustomerSearchEstateController">Listings</a></li>
                                    <!--</ul>-->
                                    <!--</li>-->

                                    <!--<li><a href="contact.jsp">Contact</a></li>-->

                                    <!--</ul>-->
                                    <!--</li>-->

                                    <!--<li><a href="blog.jsp">Blog</a></li>-->
                                    <li><a href="#">Elements</a>
                                        <ul class="dropdown">
                                            <li><a href="blog.jsp">Blog</a></li>
                                            <li><a href="single-blog.jsp">Single Blog</a></li>
                                            <li><a href="elements.jsp">Elements</a></li>
                                            <li><a href="about-us.jsp">About Us</a></li>
                                        </ul>
                                    </li>

                                    <li><a href="contact.jsp">Contact</a></li>

                                    <c:if test="${sessionScope.USER == null}">
                                        <li>
                                            <a href="login.jsp">Login/Register</a>
                                        </li>
                                    </c:if>
                                    <c:if test="${sessionScope.USER.roleID eq 'Customer'}">
                                        <li>
                                            <c:url var="InvoiceHistory" value="MainController">
                                                <c:param name="action" value="ViewInvoiceHistory"></c:param>
                                            </c:url>
                                            <a href="${InvoiceHistory}">View Invoice History</a>
                                        </li>
                                    </c:if>

                                    <c:if test="${sessionScope.CART != null}">
                                        <c:url var="viewCart" value="MainController">
                                            <c:param name="action" value="ViewCart"></c:param>
                                        </c:url>
                                        <li>
                                            <a href="${viewCart}">View Cart(${sessionScope.CART.cart.size()})</a>
                                        </li>
                                    </c:if>

                                    <c:if test="${sessionScope.USER != null}">
                                        <c:url var="userLogout" value="MainController">
                                            <c:param name="action" value="Logout"></c:param>
                                        </c:url>
                                        <li><a href="${userLogout}">Logout</a></li>
                                        </c:if>


                                </ul>

                                <!-- Search Form -->
                                <div class="south-search-form">
                                    <form action="#" method="post">
                                        <input type="search" name="search" id="search" placeholder="Search Anything ...">
                                        <button type="submit"><i class="fa fa-search" aria-hidden="true"></i></button>
                                    </form>
                                </div>

                                <!-- Search Button -->
                                <a href="#" class="searchbtn"><i class="fa" aria-hidden="true"></i></a>
                            </div>
                            <!-- Nav End -->
                        </div>
                    </nav>
                </div>
            </div>
        </header>
        <!-- ##### Header Area End ##### -->

    </body>
</html>
