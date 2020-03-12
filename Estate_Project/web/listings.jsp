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
        <title>South - Real Estate Agency | Listings</title>

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
                            <h3 class="breadcumb-title">Listings</h3>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- ##### Breadcumb Area End ##### -->

        <!-- ##### Advance Search Area Start ##### -->
        <form action="MainController">
            <div class="south-search-area" style="padding-top: 0rem">
                <div class="container">
                    <div class="row">
                        <div class="col-12">
                            <div class="advanced-search-form">
                                <!-- Search Title -->
                                <div class="search-title">
                                    <p>Customer Search Estate</p>
                                </div>
                                <!-- Search Form -->
                                <div class="row">
                                    <div class="col-12 col-md-4 col-lg-3">
                                        <div class="form-group">
                                            <select class="form-control" name="provinces">
                                                <option value="0">All Provinces</option>
                                                <%--<c:forEach var="provinces" items="${requestScope.PROVINCES}">--%>
                                                    <!--<option value="${provinces.id}">${provinces.name}</option>-->
                                                <%--</c:forEach>--%>
                                                <option value="1">An Giang</option>
                                                <option value="2">Vung Tau</option>
                                                <option value="3">Bac Giang</option>
                                                <option value="4">Bac Kan</option>
                                                <option value="5">Bac Lieu</option>
                                                <option value="6">Bac Ninh</option>
                                                <option value="7">Ben Tre</option>
                                                <option value="8">Binh Dinh</option>
                                                <option value="9">Binh Duong</option>
                                                <option value="10">Binh Phuoc</option>
                                                <option value="11">Binh Thuan</option>
                                                <option value="12">Ca Mau</option>
                                                <option value="13">Can Tho</option>
                                                <option value="14">Cao Bang</option>
                                                <option value="15">Da Nang</option>
                                                <option value="16">Dak Lak</option>
                                                <option value="17">Dak Nong</option>
                                                <option value="18">Dien Bien</option>
                                                <option value="19">Dong Nai</option>
                                                <option value="20">Dong Thap</option>
                                                <option value="21">Gia Lai</option>
                                                <option value="22">Ha Giang</option>
                                                <option value="23">Ha Nam</option>
                                                <option value="24">Ha Noi</option>
                                                <option value="25">Ha Tinh</option>
                                                <option value="26">Hai Duong</option>
                                                <option value="27">Hai Phong</option>
                                                <option value="28">Hoa Binh</option>
                                                <option value="29">Gia Lai</option>
                                                <option value="30">Hung Yen</option>
                                                <option value="31">Khanh Hoa</option>
                                                <option value="32">Kien Giang</option>
                                                <option value="33">Kon Tum</option>
                                                <option value="34">Lai Chau</option>
                                                <option value="35">Lam ?ong</option>
                                                <option value="36">Lang Son</option>
                                                <option value="37">Lao Cai</option>
                                                <option value="38">Long An</option>
                                                <option value="39">Nam ?inh</option>
                                                <option value="40">Nghe An</option>
                                                <option value="41">Ninh Binh</option>
                                                <option value="42">Ninh Thuan</option>
                                                <option value="43">Phu Tho</option>
                                                <option value="44">Phu Yen</option>
                                                <option value="45">Quang Binh</option>
                                                <option value="46">Quang Nam</option>
                                                <option value="47">Quang Ngai</option>
                                                <option value="48">Quang Ninh</option>
                                                <option value="49">Quang Tr?</option>
                                                <option value="50">Soc Trang</option>
                                                <option value="51">S?n La</option>
                                                <option value="52">Tay Ninh</option>
                                                <option value="53">Thai Binh</option>
                                                <option value="54">Thai Nguyen</option>
                                                <option value="55">Thanh Hoa</option>
                                                <option value="56">Thua Thien Hue</option>
                                                <option value="57">Tien Giang</option>
                                                <option value="58">TP HCM</option>
                                                <option value="59">Tra Vinh</option>
                                                <option value="60">Tuyen Quang</option>
                                                <option value="61">Vinh Long</option>
                                                <option value="62">Vinh Phúc</option>
                                                <option value="63">Yen Bai</option>
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
                                        <!-- Submit -->
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

        <!-- ##### Listing Content Wrapper Area Start ##### -->
        <section class="listings-content-wrapper section-padding-100">
            <div class="container">
                <div class="row">

                    <!-- Single Featured Property -->
                    <c:forEach var="list" varStatus="counter" items="${requestScope.LISTPROPERTY}">
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
        <!-- ##### Listing Content Wrapper Area End ##### -->

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