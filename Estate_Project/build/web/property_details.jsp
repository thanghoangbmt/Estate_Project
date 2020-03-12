<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="description" content="">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

        <!-- Title  -->
        <title>South - Real Estate Agency | Property Details</title>

        <!-- Favicon  -->
        <link rel="icon" href="img/core-img/favicon.ico">

        <!-- Style CSS -->
        <link rel="stylesheet" href="style.css">

    </head>

    <body>
        <c:if test="${sessionScope.USER.roleID ne 'AD'}">
            <c:redirect url="login.jsp"></c:redirect>
        </c:if>
        
        <c:if test="${sessionScope.USER.roleID eq 'AD'}">
            <%@include file="admin_nav.jsp" %>
        </c:if>
        
        <%--<c:if test="${sessionScope.User.roleID eq 'Customer'}">--%>
            <%--<%@include file="nav.jsp" %>--%>
        <%--</c:if>--%>
        
        <%--<c:if test="${sessionScope.User.roleID == null}">--%>
            <%--<%@include file="nav.jsp" %>--%>
        <%--</c:if>--%>
        
        <!-- ##### Blog Area Start ##### -->
        <section class="south-blog-area" style="padding-top: 190px;">
            <div class="container">
                <div class="row">
                    <div class="col-12 col-lg-8">
                        <c:if test="${requestScope.PROPERTY_DETAILS.images.size() > 1}">
                            <div class="blog-sidebar-area">
                                <div class="featured-properties-slides owl-carousel">
                                    <c:forEach var="listImage" items="${requestScope.PROPERTY_DETAILS.images}">

                                        <!-- Single Slide -->
                                        <div class="single-featured-property">
                                            <!-- Property Thumbnail -->
                                            <div class="property-thumb">
                                                <img src="${listImage}" alt="">
                                            </div>
                                            <!-- Property Content -->
                                        </div>

                                        <!-- Single Slide -->
                                        <!--                                        <div class="single-featured-property">
                                                                                     Property Thumbnail 
                                                                                    <div class="property-thumb">
                                                                                        <img src="img/bg-img/feature2.jpg" alt="">
                                                                                    </div>
                                                                                     Property Content 
                                                                                </div>-->
                                    </c:forEach>

                                </div>
                            </div>
                        </c:if>

                        <c:if test="${requestScope.PROPERTY_DETAILS.images.size() == 1}">
                            <div class="property-thumb">
                                <img src="${requestScope.PROPERTY_DETAILS.images.get(0)}" alt="">
                            </div>
                        </c:if>
                    </div>

                    <!--Blog-->
                    <div class="col-12 col-lg-4">
                        <div class="blog-sidebar-area">

                            <div class="south-catagories-card mb-15">
                                <h5>Address: ${requestScope.PROPERTY_DETAILS.address}</h5>
                            </div>

                            <div class="south-catagories-card mb-15">
                                <h5>Price ${requestScope.PROPERTY_DETAILS.salePrice} $</h5>
                            </div>

                            <div class="south-catagories-card mb-15">
                                <h5>Square: ${requestScope.PROPERTY_DETAILS.square} sq. ft</h5>
                            </div>

                            <div class="south-catagories-card mb-15">
                                <h5>
                                    Interior: 
                                    <c:if test="${requestScope.PROPERTY_DETAILS.interior == true}">Yes</c:if>
                                    <c:if test="${requestScope.PROPERTY_DETAILS.interior == false}">No</c:if>
                                    </h5>
                                </div>

                                <div class="south-catagories-card mb-15">
                                    <h5>Description ${requestScope.PROPERTY_DETAILS.description}</h5>
                            </div>

                            <div class="south-catagories-card mb-15">
                                <h5>Number Of Room: ${requestScope.PROPERTY_DETAILS.numberOfRoom}</h5>
                            </div>

                            <div class="south-catagories-card mb-15">
                                <h5>Number Of Toilet: ${requestScope.PROPERTY_DETAILS.numberOfToilet}</h5>
                            </div>
                            
                            <c:if test="${sessionScope.USER.roleID eq 'AD'}">
                                <div class="south-catagories-card mb-15">
                                    <h5>
                                        Sold: 
                                        <c:if test="${requestScope.PROPERTY_DETAILS.sold == true}">Yes</c:if>
                                        <c:if test="${requestScope.PROPERTY_DETAILS.sold == false}">No</c:if>
                                    </h5>
                                </div>
                            </c:if>
                            
                            <div class="south-catagories-card mb-15">
                                    <h5>Category: ${requestScope.PROPERTY_DETAILS.category}</h5>
                            </div>

                            <div class="south-catagories-card mb-15">
                                <h5>Province: ${requestScope.PROPERTY_DETAILS.province}</h5>
                            </div>

                            <div class="south-catagories-card mb-15">
                                <h5>Owner: ${requestScope.PROPERTY_DETAILS.owner}</h5>
                            </div>

                            <div class="featured-properties-slides owl-carousel">

                                <!-- Single Slide -->
                                <div class="single-featured-property">
                                    <!-- Property Thumbnail -->
                                    <div class="property-thumb">
                                        <img src="img/bg-img/feature1.jpg" alt="">

                                        <div class="tag">
                                            <span>For Sale</span>
                                        </div>
                                        <div class="list-price">
                                            <p>$945 679</p>
                                        </div>
                                    </div>
                                    <!-- Property Content -->
                                    <div class="property-content">
                                        <h5>Villa in Los Angeles</h5>
                                        <p class="location"><img src="img/icons/location.png" alt="">Upper Road 3411, no.34 CA</p>
                                        <p>Integer nec bibendum lacus. Suspendisse dictum enim sit amet libero malesuada.</p>
                                        <div class="property-meta-data d-flex align-items-end justify-content-between">
                                            <div class="new-tag">
                                                <img src="img/icons/new.png" alt="">
                                            </div>
                                            <div class="bathroom">
                                                <img src="img/icons/bathtub.png" alt="">
                                                <span>2</span>
                                            </div>
                                            <div class="garage">
                                                <img src="img/icons/garage.png" alt="">
                                                <span>2</span>
                                            </div>
                                            <div class="space">
                                                <img src="img/icons/space.png" alt="">
                                                <span>120 sq ft</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <!-- Single Slide -->
                                <div class="single-featured-property">
                                    <!-- Property Thumbnail -->
                                    <div class="property-thumb">
                                        <img src="img/bg-img/feature2.jpg" alt="">

                                        <div class="tag">
                                            <span>For Sale</span>
                                        </div>
                                        <div class="list-price">
                                            <p>$945 679</p>
                                        </div>
                                    </div>
                                    <!-- Property Content -->
                                    <div class="property-content">
                                        <h5>Town House in Los Angeles</h5>
                                        <p class="location"><img src="img/icons/location.png" alt="">Upper Road 3411, no.34 CA</p>
                                        <p>Integer nec bibendum lacus. Suspendisse dictum enim sit amet libero malesuada.</p>
                                        <div class="property-meta-data d-flex align-items-end justify-content-between">
                                            <div class="new-tag">
                                                <img src="img/icons/new.png" alt="">
                                            </div>
                                            <div class="bathroom">
                                                <img src="img/icons/bathtub.png" alt="">
                                                <span>2</span>
                                            </div>
                                            <div class="garage">
                                                <img src="img/icons/garage.png" alt="">
                                                <span>2</span>
                                            </div>
                                            <div class="space">
                                                <img src="img/icons/space.png" alt="">
                                                <span>120 sq ft</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-12">
                        <!-- Pagination -->
                        <div class="south-pagination mt-100 d-flex">
                            <nav aria-label="Page navigation">
                                <ul class="pagination">
                                    <li class="page-item"><a class="page-link active" href="#">01</a></li>
                                    <li class="page-item"><a class="page-link" href="#">02</a></li>
                                    <li class="page-item"><a class="page-link" href="#">03</a></li>
                                </ul>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- ##### Blog Area End ##### -->

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