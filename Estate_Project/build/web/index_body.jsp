<%-- 
    Document   : index_body
    Created on : Dec 8, 2019, 7:41:50 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <!--        <meta charset="UTF-8">-->
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="description" content="">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <link rel="icon" href="img/core-img/favicon.ico">

        <link rel="stylesheet" href="style.css">
    </head>

    <body>
        <section class="hero-area">
            <div class="hero-slides owl-carousel">
                <!-- Single Hero Slide -->
                <div class="single-hero-slide bg-img" style="background-image: url(img/bg-img/hero1.jpg);">
                    <div class="container h-100">
                        <div class="row h-100 align-items-center">
                            <div class="col-12">
                                <div class="hero-slides-content">
                                    <h2 data-animation="fadeInUp" data-delay="100ms">Find your home</h2>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Single Hero Slide -->
                <div class="single-hero-slide bg-img" style="background-image: url(img/bg-img/hero2.jpg);">
                    <div class="container h-100">
                        <div class="row h-100 align-items-center">
                            <div class="col-12">
                                <div class="hero-slides-content">
                                    <h2 data-animation="fadeInUp" data-delay="100ms">Find your dream house</h2>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Single Hero Slide -->
                <div class="single-hero-slide bg-img" style="background-image: url(img/bg-img/hero3.jpg);">
                    <div class="container h-100">
                        <div class="row h-100 align-items-center">
                            <div class="col-12">
                                <div class="hero-slides-content">
                                    <h2 data-animation="fadeInUp" data-delay="100ms">Find your perfect house</h2>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- ##### Hero Area End ##### -->

        <!-- ##### Advance Search Area Start ##### -->
        <form action="MainController">
            <div class="south-search-area" style="padding-top: 0rem">
                <div class="container">
                    <div class="row">
                        <div class="col-12">
                            <div class="advanced-search-form">
                                <div class="search-title">
                                    <p>Customer Search Estate</p>
                                </div>
                                <div class="row">
                                    <div class="col-12 col-md-4 col-lg-3">
                                        <div class="form-group">
                                            <select class="form-control" name="provinces">
                                                <option value="0">All Provinces</option>
                                                <c:forEach var="provinces" items="${requestScope.PROVINCES}">
                                                    <option value="${provinces.id}">${provinces.name}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                    </div>

                                    <div class="col-12 col-md-4 col-lg-3">
                                        <div class="form-group">
                                            <select class="form-control" name="catagories" id="catagories">
                                                <option value="0">All Catagories</option>
                                                <c:forEach var="categories" items="${requestScope.CATEGORIES}">
                                                    <option value="${categories.id}">${categories.type}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                    </div>


                                    <div class="col-12 col-md-4 col-lg-3">
                                        <div class="form-group">
                                            <select class="form-control" name="owners" id="owners">
                                                <option value="0">All Owners</option>
                                                <c:forEach var="owners" items="${requestScope.OWNERS}">
                                                    <option value="${owners.id}">${owners.name}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                    </div>

                                    <div class="col-12 col-md-4 col-lg-2">
                                        <div class="form-group">
                                            <select class="form-control" name="bedrooms" id="bedrooms">
                                                <option value="0">Bedrooms</option>
                                                <option value="1">1</option>
                                                <option value="2">2</option>
                                                <option value="3">3</option>
                                                <option value="4">4</option>
                                                <option value="6">5+</option>
                                            </select>
                                        </div>
                                    </div>

                                    <div class="col-12 col-md-4 col-lg-3">
                                        <div class="form-group">
                                            <select class="form-control" name="bathrooms" id="bathrooms">
                                                <option value="0">Bathrooms</option>
                                                <option value="1">1</option>
                                                <option value="2">2</option>
                                                <option value="3">3</option>
                                                <option value="4">4</option>
                                                <option value="6">5+</option>
                                            </select>
                                        </div>
                                    </div>

                                    <div class="col-12 col-md-4 col-lg-3">
                                        <div class="form-group">
                                            <select class="form-control" name="square" id="square">
                                                <option value="0">Square</option>
                                                <option value="1">0-50 sq. ft</option>
                                                <option value="2">50-100 sq. ft</option>
                                                <option value="3">100-200 sq. ft</option>
                                                <option value="4">200-500 sq. ft</option>
                                                <option value="5">500+ sq. ft</option>
                                            </select>
                                        </div>
                                    </div>

                                    <div class="col-12 col-md-4 col-lg-3">
                                        <div class="form-group">
                                            <select class="form-control" name="price" id="price">
                                                <option value="0">Price</option>
                                                <option value="1">< 500 000$</option>
                                                <option value="2">500 000$ - 1 000 000$</option>
                                                <option value="3">1 000 000$ - 2 000 000$</option>
                                                <option value="4">2 000 000$ - 5 000 000$</option>
                                                <option value="5">> 5 000 000$</option>
                                            </select>
                                        </div>
                                    </div>

                                    <div class="col-12 col-md-4 col-lg-2">
                                        <div class="form-check">
                                            <input type="checkbox" class="form-check-input" name="InteriorChb" id="InteriorChb" value="checked">
                                            <label class="form-check-label" for="exampleCheck1">Interior</label>
                                        </div>
                                    </div>

                                    <div class="col-12 d-flex justify-content-center align-items-end">
                                        <div class="form-group mb-0">
                                            <button type="submit" class="btn south-btn" name="action" value="Customer_Search_Estate">Search</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </form>
        <!-- ##### Advance Search Area End ##### -->

        <!-- ##### Featured Properties Area Start ##### -->
        <section class="featured-properties-area section-padding-100-50">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <div class="section-heading wow fadeInUp">
                            <h2>Featured Properties</h2>
                            <p>Suspendisse dictum enim sit amet libero malesuada feugiat.</p>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <c:forEach var="list" varStatus="counter" items="${sessionScope.TOPSIXLIST}">
                        <!-- Single Featured Property -->
                        <div class="col-12 col-md-6 col-xl-4">
                            <div class="single-featured-property mb-50 wow fadeInUp" data-wow-delay="100ms">
                                <!-- Property Thumbnail -->
                                <c:url var="Details" value="MainController">
                                    <c:param name="action" value="ShowDetails_Estate"></c:param>
                                    <c:param name="propertyID" value="${list.propertyID}"></c:param>
                                </c:url>
                                <a href="${Details}">
                                    <div class="property-thumb">
                                        <img src="${list.images.get(0)}" alt="">

                                        <div class="tag">
                                            <span>For Sale</span>
                                        </div>
                                        <div class="list-price">
                                            <p>$${list.salePrice}</p>
                                        </div>
                                    </div>
                                    <!-- Property Content -->
                                    <div class="property-content">
                                        <h5>${list.category} in ${list.province}</h5>
                                        <p class="location"><img src="img/icons/location.png" alt="">${list.address}</p>
                                        <p>${list.description}</p>
                                        <div class="property-meta-data d-flex align-items-end justify-content-between">
                                            <div class="new-tag">
                                                <img src="img/icons/new.png" alt="">
                                            </div>
                                            <div class="bathroom">
                                                <img src="img/icons/bathtub.png" alt="">
                                                <span>${list.numberOfToilet}</span>
                                            </div>
                                            <div class="garage">
                                                <img src="img/icons/garage.png" alt="">
                                                <span>2</span>
                                            </div>
                                            <div class="space">
                                                <img src="img/icons/space.png" alt="">
                                                <span>${list.square}</span>
                                            </div>
                                        </div>
                                    </div>
                                </a>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </section>
        <!-- ##### Featured Properties Area End ##### -->

        <!-- ##### Call To Action Area Start ##### -->
        <section class="call-to-action-area bg-fixed bg-overlay-black" style="background-image: url(img/bg-img/cta.jpg)">
            <div class="container h-100">
                <div class="row align-items-center h-100">
                    <div class="col-12">
                        <div class="cta-content text-center">
                            <h2 class="wow fadeInUp" data-wow-delay="300ms">Are you looking for a place to rent?</h2>
                            <h6 class="wow fadeInUp" data-wow-delay="400ms">Suspendisse dictum enim sit amet libero malesuada feugiat.</h6>
                            <a href="#" class="btn south-btn mt-50 wow fadeInUp" data-wow-delay="500ms">Search</a>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- ##### Call To Action Area End ##### -->

        <!-- ##### Testimonials Area Start ##### -->
        <section class="south-testimonials-area section-padding-100">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <div class="section-heading wow fadeInUp" data-wow-delay="250ms">
                            <h2>Client testimonials</h2>
                            <p>Suspendisse dictum enim sit amet libero malesuada feugiat.</p>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-12">
                        <div class="testimonials-slides owl-carousel wow fadeInUp" data-wow-delay="500ms">

                            <!-- Single Testimonial Slide -->
                            <div class="single-testimonial-slide text-center">
                                <h5>Perfect Home for me</h5>
                                <p>Etiam nec odio vestibulum est mattis effic iturut magna. Pellentesque sit amet tellus blandit. Etiam nec odio vestibulum est mattis effic iturut magna. Pellentesque sit am et tellus blandit. Etiam nec odio vestibul. Etiam nec
                                    odio vestibulum est mat tis effic iturut magna.</p>

                                <div class="testimonial-author-info">
                                    <img src="img/bg-img/feature6.jpg" alt="">
                                    <p>Daiane Smith, <span>Customer</span></p>
                                </div>
                            </div>

                            <!-- Single Testimonial Slide -->
                            <div class="single-testimonial-slide text-center">
                                <h5>Perfect Home for me</h5>
                                <p>Etiam nec odio vestibulum est mattis effic iturut magna. Pellentesque sit amet tellus blandit. Etiam nec odio vestibulum est mattis effic iturut magna. Pellentesque sit am et tellus blandit. Etiam nec odio vestibul. Etiam nec
                                    odio vestibulum est mat tis effic iturut magna.</p>

                                <div class="testimonial-author-info">
                                    <img src="img/bg-img/feature6.jpg" alt="">
                                    <p>Daiane Smith, <span>Customer</span></p>
                                </div>
                            </div>

                            <!-- Single Testimonial Slide -->
                            <div class="single-testimonial-slide text-center">
                                <h5>Perfect Home for me</h5>
                                <p>Etiam nec odio vestibulum est mattis effic iturut magna. Pellentesque sit amet tellus blandit. Etiam nec odio vestibulum est mattis effic iturut magna. Pellentesque sit am et tellus blandit. Etiam nec odio vestibul. Etiam nec
                                    odio vestibulum est mat tis effic iturut magna.</p>

                                <div class="testimonial-author-info">
                                    <img src="img/bg-img/feature6.jpg" alt="">
                                    <p>Daiane Smith, <span>Customer</span></p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- ##### Testimonials Area End ##### -->

        <!-- ##### Editor Area Start ##### -->
        <section class="south-editor-area d-flex align-items-center">
            <!-- Editor Content -->
            <div class="editor-content-area">
                <!-- Section Heading -->
                <div class="section-heading wow fadeInUp" data-wow-delay="250ms">
                    <img src="img/icons/prize.png" alt="">
                    <h2>jeremy Scott</h2>
                    <p>Realtor</p>
                </div>
                <p class="wow fadeInUp" data-wow-delay="500ms">Etiam nec odio vestibulum est mattis effic iturut magna. Pellentesque sit amet tellus blandit. Etiam nec odiomattis effic iturut magna. Pellentesque sit am et tellus blandit. Etiam nec odio vestibul. Etiam nec odio vestibulum est mat tis effic
                    iturut magna. Curabitur rhoncus auctor eleifend. Fusce venenatis diam urna, eu pharetra arcu varius ac. Etiam cursus turpis lectus, id iaculis risus tempor id. Phasellus fringilla nisl sed sem scelerisque, eget aliquam magna vehicula.</p>
                <div class="address wow fadeInUp" data-wow-delay="750ms">
                    <h6><img src="img/icons/phone-call.png" alt=""> +45 677 8993000 223</h6>
                    <h6><img src="img/icons/envelope.png" alt=""> office@template.com</h6>
                </div>
                <div class="signature mt-50 wow fadeInUp" data-wow-delay="1000ms">
                    <img src="img/core-img/signature.png" alt="">
                </div>
            </div>

            <!-- Editor Thumbnail -->
            <div class="editor-thumbnail">
                <img src="img/bg-img/editor.jpg" alt="">
            </div>
        </section>

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
