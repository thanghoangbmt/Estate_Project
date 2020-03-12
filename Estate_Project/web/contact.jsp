<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="description" content="">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

        <!-- Title  -->
        <title>South - Real Estate Agency | Contact</title>

        <!-- Favicon  -->
        <link rel="icon" href="img/core-img/favicon.ico">

        <!-- Style CSS -->
        <link rel="stylesheet" href="style.css">

    </head>

    <body>
        <c:if test="${sessionScope.USER.roleID eq 'AD'}">
            <c:redirect url="AdminIndexController"></c:redirect>
        </c:if>
        <%@include file="nav.jsp" %>
        <!-- ##### Breadcumb Area Start ##### -->
        <section class="breadcumb-area bg-img" style="background-image: url(img/bg-img/hero1.jpg);">
            <div class="container h-100">
                <div class="row h-100 align-items-center">
                    <div class="col-12">
                        <div class="breadcumb-content">
                            <h3 class="breadcumb-title">Contact</h3>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- ##### Breadcumb Area End ##### -->

        <section class="south-contact-area section-padding-100">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <div class="contact-heading">
                            <h6>Contact info</h6>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-12 col-lg-4">
                        <div class="content-sidebar">
                            <!-- Office Hours -->
                            <div class="weekly-office-hours">
                                <ul>
                                    <li class="d-flex align-items-center justify-content-between"><span>Monday - Friday</span> <span>09 AM - 19 PM</span></li>
                                    <li class="d-flex align-items-center justify-content-between"><span>Saturday</span> <span>09 AM - 14 PM</span></li>
                                    <li class="d-flex align-items-center justify-content-between"><span>Sunday</span> <span>Closed</span></li>
                                </ul>
                            </div>
                            <!-- Address -->
                            <div class="address mt-30">
                                <h6><img src="img/icons/phone-call.png" alt=""> +45 677 8993000 223</h6>
                                <h6><img src="img/icons/envelope.png" alt=""> office@template.com</h6>
                                <h6><img src="img/icons/location.png" alt=""> Main Str. no 45-46, b3, 56832,<br>Los Angeles, CA</h6>
                            </div>
                        </div>
                    </div>

                    <!-- Contact Form Area -->
                    <div class="col-12 col-lg-8">
                        <div class="contact-form">
                            <form action="#" method="post">
                                <div class="form-group">
                                    <input type="text" class="form-control" name="text" id="contact-name" placeholder="Your Name">
                                </div>
                                <div class="form-group">
                                    <input type="number" class="form-control" name="number" id="contact-number" placeholder="Your Phone">
                                </div>
                                <div class="form-group">
                                    <input type="email" class="form-control" name="email" id="contact-email" placeholder="Your Email">
                                </div>
                                <div class="form-group">
                                    <textarea class="form-control" name="message" id="message" cols="30" rows="10" placeholder="Your Message"></textarea>
                                </div>
                                <button type="submit" class="btn south-btn">Send Message</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- ##### Footer Area Start ##### -->
        <%@include file="footer_ui.jsp" %>
        <!-- ##### Footer Area End ##### -->

        <!-- jQuery (Necessary for All JavaScript Plugins) -->
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
        <!-- Google Maps -->
        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAwuyLRa1uKNtbgx6xAJVmWy-zADgegA2s"></script>
        <script src="js/map-active.js"></script>

    </body>

</html>
