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
        <title>South - Real Estate Agency | Elements</title>

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
                            <h3 class="breadcumb-title">Elements</h3>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- ##### Breadcumb Area End ##### -->

        <!-- ##### Elements Area Start ##### -->
        <section class="elements-area section-padding-100-0">
            <div class="container">

                <div class="row">
                    <!-- ##### Progress Bars & Accordions ##### -->
                    <div class="col-12">
                        <div class="elements-title">
                            <h2>Accordions &amp; Tabs</h2>
                        </div>
                    </div>

                    <!-- ##### Accordians ##### -->
                    <div class="col-12 col-lg-6">
                        <div class="accordions mb-100" id="accordion" role="tablist" aria-multiselectable="true">
                            <!-- single accordian area -->
                            <div class="panel single-accordion">
                                <h6><a role="button" class="" aria-expanded="true" aria-controls="collapseOne" data-toggle="collapse" data-parent="#accordion" href="#collapseOne">Donec ipsum metus, pharetr a quis nunc sit amet, maximus.
                                        <span class="accor-open"><i class="fa fa-plus" aria-hidden="true"></i></span>
                                        <span class="accor-close"><i class="fa fa-minus" aria-hidden="true"></i></span>
                                    </a></h6>
                                <div id="collapseOne" class="accordion-content collapse show">
                                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed vel lectus eu felis semper finibus ac eget ipsum. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam vulputate id justo quis facilisis.</p>
                                </div>
                            </div>
                            <!-- single accordian area -->
                            <div class="panel single-accordion">
                                <h6>
                                    <a role="button" class="collapsed" aria-expanded="true" aria-controls="collapseTwo" data-parent="#accordion" data-toggle="collapse" href="#collapseTwo">Maximus vehicula nibh. Prae sent pulvinar porta.
                                        <span class="accor-open"><i class="fa fa-plus" aria-hidden="true"></i></span>
                                        <span class="accor-close"><i class="fa fa-minus" aria-hidden="true"></i></span>
                                    </a>
                                </h6>
                                <div id="collapseTwo" class="accordion-content collapse">
                                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed vel lectus eu felis semper finibus ac eget ipsum. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam vulputate id justo quis facilisis.</p>
                                </div>
                            </div>
                            <!-- single accordian area -->
                            <div class="panel single-accordion">
                                <h6>
                                    <a role="button" aria-expanded="true" aria-controls="collapseThree" class="collapsed" data-parent="#accordion" data-toggle="collapse" href="#collapseThree">Pharetr a quis nunc sit amet, maximus vehicula nibh.
                                        <span class="accor-open"><i class="fa fa-plus" aria-hidden="true"></i></span>
                                        <span class="accor-close"><i class="fa fa-minus" aria-hidden="true"></i></span>
                                    </a>
                                </h6>
                                <div id="collapseThree" class="accordion-content collapse">
                                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed vel lectus eu felis semper finibus ac eget ipsum. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam vulputate id justo quis facilisis.</p>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- ##### Tabs ##### -->
                    <div class="col-12 col-lg-6">
                        <div class="south-tabs-content">
                            <ul class="nav nav-tabs" id="myTab" role="tablist">
                                <li class="nav-item">
                                    <a class="nav-link" id="tab--1" data-toggle="tab" href="#tab1" role="tab" aria-controls="tab1" aria-selected="false">Suspendisse dictu</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link active" id="tab--2" data-toggle="tab" href="#tab2" role="tab" aria-controls="tab2" aria-selected="false">Ero malesuada</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" id="tab--3" data-toggle="tab" href="#tab3" role="tab" aria-controls="tab3" aria-selected="true">Ependisse dictu</a>
                                </li>
                            </ul>

                            <div class="tab-content mb-100" id="myTabContent">
                                <div class="tab-pane fade" id="tab1" role="tabpanel" aria-labelledby="tab--1">
                                    <div class="south-tab-content">
                                        <!-- Tab Text -->
                                        <div class="south-tab-text">
                                            <h6>Curabitur rhoncus auctor eleifend</h6>
                                            <p>Integer nec bibendum lacus. Praesent malesuada congue, Suspendisse dictum enim sit amet libero malesu ada feugiat. Praesent malesuada congue magna at finibus. In hac habitasse platea dictumst. Curabitur rhoncus auctor eleifend. Praesent malesuada congue.</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="tab-pane fade show active" id="tab2" role="tabpanel" aria-labelledby="tab--2">
                                    <div class="south-tab-content">
                                        <!-- Tab Text -->
                                        <div class="south-tab-text">
                                            <h6>Curabitur rhoncus auctor eleifend</h6>
                                            <p>Integer nec bibendum lacus. Praesent malesuada congue, Suspendisse dictum enim sit amet libero malesu ada feugiat. Praesent malesuada congue magna at finibus. In hac habitasse platea dictumst. Curabitur rhoncus auctor eleifend. Praesent malesuada congue.</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="tab-pane fade" id="tab3" role="tabpanel" aria-labelledby="tab--3">
                                    <div class="south-tab-content">
                                        <!-- Tab Text -->
                                        <div class="south-tab-text">
                                            <h6>Curabitur rhoncus auctor eleifend</h6>
                                            <p>Integer nec bibendum lacus. Praesent malesuada congue, Suspendisse dictum enim sit amet libero malesu ada feugiat. Praesent malesuada congue magna at finibus. In hac habitasse platea dictumst. Curabitur rhoncus auctor eleifend. Praesent malesuada congue.</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <!-- ##### Loaders ##### -->
                    <div class="col-12">
                        <div class="elements-title">
                            <h2>Loaders</h2>
                        </div>

                        <div class="our-skills-area text-center">
                            <div class="row">
                                <div class="col-12 col-sm-6 col-lg-3">
                                    <div class="single-pie-bar mb-100" data-percent="75">
                                        <canvas class="bar-circle" width="100" height="100"></canvas>
                                        <h5>Hard Work</h5>
                                    </div>
                                </div>
                                <div class="col-12 col-sm-6 col-lg-3">
                                    <div class="single-pie-bar mb-100" data-percent="83">
                                        <canvas class="bar-circle" width="100" height="100"></canvas>
                                        <h5>Creativity</h5>
                                    </div>
                                </div>
                                <div class="col-12 col-sm-6 col-lg-3">
                                    <div class="single-pie-bar mb-100" data-percent="25">
                                        <canvas class="bar-circle" width="100" height="100"></canvas>
                                        <h5>Good Luck</h5>
                                    </div>
                                </div>
                                <div class="col-12 col-sm-6 col-lg-3">
                                    <div class="single-pie-bar mb-100" data-percent="95">
                                        <canvas class="bar-circle" width="100" height="100"></canvas>
                                        <h5>Development</h5>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>

                <div class="row">
                    <!-- ##### Milestones ##### -->
                    <div class="col-12">
                        <div class="elements-title">
                            <h2>Milestones</h2>
                        </div>
                    </div>

                    <!-- Single Cool Fact -->
                    <div class="col-12 col-sm-6 col-lg-3">
                        <div class="single-cool-fact-area mb-100">
                            <img src="img/icons/prize2.png" alt="">
                            <h2><span class="counter">14</span></h2>
                            <h6>Years of Experience</h6>
                        </div>
                    </div>
                    <!-- Single Cool Fact -->
                    <div class="col-12 col-sm-6 col-lg-3">
                        <div class="single-cool-fact-area mb-100">
                            <img src="img/icons/new2.png" alt="">
                            <h2>+<span class="counter">1000</span></h2>
                            <h6>Happy clients</h6>
                        </div>
                    </div>
                    <!-- Single Cool Fact -->
                    <div class="col-12 col-sm-6 col-lg-3">
                        <div class="single-cool-fact-area mb-100">
                            <img src="img/icons/house2.png" alt="">
                            <h2><span class="counter">14</span>k</h2>
                            <h6>Followers on FB</h6>
                        </div>
                    </div>
                    <!-- Single Cool Fact -->
                    <div class="col-12 col-sm-6 col-lg-3">
                        <div class="single-cool-fact-area mb-100">
                            <img src="img/icons/house1.png" alt="">
                            <h2><span class="counter">723</span></h2>
                            <h6>Finished Projects</h6>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <!-- ##### Icon Boxes ##### -->
                    <div class="col-12">
                        <div class="elements-title">
                            <h2>Icon boxes</h2>
                        </div>
                    </div>

                    <!-- Single Service Area -->
                    <div class="col-12 col-md-6 col-lg-4">
                        <div class="single-service-area mb-100">
                            <div class="service-content">
                                <h5><img class="mr-15" src="img/icons/home3.png" alt=""> Perfect Home for me</h5>
                                <p>Lorem ipsum dolor sit amet, consecte tuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut.</p>
                            </div>
                        </div>
                    </div>

                    <!-- Single Service Area -->
                    <div class="col-12 col-md-6 col-lg-4">
                        <div class="single-service-area mb-100">
                            <div class="service-content">
                                <h5><img class="mr-15" src="img/icons/rent.png" alt=""> Perfect Home for me</h5>
                                <p>Dolor sit amet, consecte tuer elit, sed diam nonummy nibh euismod tincidunt ut ldolore magna.</p>
                            </div>
                        </div>
                    </div>

                    <!-- Single Service Area -->
                    <div class="col-12 col-md-6 col-lg-4">
                        <div class="single-service-area mb-100">
                            <div class="service-content">
                                <h5><img class="mr-15" src="img/icons/flat.png" alt=""> Perfect Home for me</h5>
                                <p>Lorem ipsum dolor sit amet, consecte tuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut.</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- ##### Elements Area End ##### -->

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

    </body>

</html>