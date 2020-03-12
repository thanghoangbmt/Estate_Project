<%-- 
    Document   : admin_insert_estate
    Created on : Dec 13, 2019, 3:01:20 AM
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
        <title>Admin Update Estate Page</title>
    </head>
    <body>
        <c:if test="${sessionScope.USER.roleID ne 'AD'}">
            <c:redirect url="login.jsp"></c:redirect>
        </c:if>

        <%@include file="admin_nav.jsp" %>
        <div class="container" style="padding-top: 150px;">
            <form action="MainController" method="POST" enctype="multipart/form-data">
                <input type="hidden" name="propertyID" value="${requestScope.propertyID}"/>
                <div class="form-group" style="width: 25%">
                    <label for="address">Address</label>
                    <input type="text" class="form-control" name="address" id="address" value="${requestScope.address}" placeholder="Enter address" required="true">
                </div>

                <div class="form-group" style="width: 25%">
                    <label for="price">Price</label>
                    <input type="number" class="form-control" name="price" id="price" value="${requestScope.strSalePrice}" placeholder="Enter price" required="true">
                </div>

                <div class="form-group" style="width: 25%">
                    <label for="square">Square</label>
                    <input type="number" class="form-control" name="square" id="square" value="${requestScope.strSquare}" placeholder="Enter square" required="true">
                </div>

                <c:if test="${requestScope.strInterior eq 'true'}">
                    <div class="form-check" style="padding-bottom: 1rem">
                        <input type="checkbox" class="form-check-input" name="interior" id="interior" value="checked" checked>
                        <label class="form-check-label" for="interior">Interior</label>
                    </div>
                </c:if>

                <c:if test="${requestScope.strInterior ne 'true'}">
                    <div class="form-check" style="padding-bottom: 1rem">
                        <input type="checkbox" class="form-check-input" name="interior" id="interior" value="checked">
                        <label class="form-check-label" for="interior">Interior</label>
                    </div>
                </c:if>

                <div class="form-group" style="width: 25%">
                    <label for="description">Description</label>
                    <input type="text" class="form-control" name="description" id="description" value="${requestScope.description}" placeholder="Enter description">
                </div>

                <div class="form-group" style="width: 25%">
                    <label for="numberOfRoom">Number Of Room</label>
                    <input type="number" class="form-control" name="numberOfRoom" id="numberOfRoom" value="${requestScope.strNumberOfRoom}" placeholder="Enter number of room" required="true" min="0">
                </div>

                <div class="form-group" style="width: 25%">
                    <label for="numberOfToilet">Number Of Toilet</label>
                    <input type="number" class="form-control" name="numberOfToilet" id="numberOfToilet" value="${requestScope.strNumberOfToilet}" placeholder="Enter number of toilet" required="true" min="0">
                </div>

                <div class="form-group" style="width: 25%">
                    <label for="category">Category</label>
                    <select class="form-control" name="category" id="category">
                        <option value="1">Villa</option>
                        <option value="2">Apartments</option>
                        <option value="3">Condos</option>
                        <option value="4">Houses</option>
                        <option value="5">Townhouses</option>
                        <option value="6">Project lands</option>
                        <option value="7">Other types</option>
                    </select>
                </div>

                <div class="form-group" style="width: 25%">
                    <label for="province">Province</label>
                    <select class="form-control" name="province" id="province">
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
                        <option value="35">Lam Đong</option>
                        <option value="36">Lang Son</option>
                        <option value="37">Lao Cai</option>
                        <option value="38">Long An</option>
                        <option value="39">Nam Đinh</option>
                        <option value="40">Nghe An</option>
                        <option value="41">Ninh Binh</option>
                        <option value="42">Ninh Thuan</option>
                        <option value="43">Phu Tho</option>
                        <option value="44">Phu Yen</option>
                        <option value="45">Quang Binh</option>
                        <option value="46">Quang Nam</option>
                        <option value="47">Quang Ngai</option>
                        <option value="48">Quang Ninh</option>
                        <option value="49">Quang Trị</option>
                        <option value="50">Soc Trang</option>
                        <option value="51">Sơn La</option>
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

                <div class="form-group" style="width: 25%">
                    <label for="owner">Owner</label>
                    <input type="text" class="form-control" name="owner" id="owner" value="${requestScope.owner}" placeholder="Enter Owner" required="true">
                </div>

                <div class="input-group mb-3">
                    <input type="file" class="form-control-file" placeholder="Photo URL" multiple name="imagesInput" required="true">
                    <input type="text" name="images" class="d-none"/>
                </div>  

                <button class="btn btn-success" name="action" value="Admin_Update_Estate">Update Estate</button>

                <input type="hidden" name="searchProvince" value="${requestScope.searchProvince}"/>
                <input type="hidden" name="searchCategory" value="${requestScope.searchCategory}"/>
                <input type="hidden" name="searchOwner" value="${requestScope.searchOwner}"/>
                <input type="hidden" name="searchBedroom" value="${requestScope.searchBedroom}"/>
                <input type="hidden" name="searchBathroom" value="${requestScope.searchBathroom}"/>
                <input type="hidden" name="searchPrice" value="${requestScope.searchPrice}"/>
                <input type="hidden" name="searchSquare" value="${requestScope.searchSquare}"/>
                <input type="hidden" name="searchInterior" value="${requestScope.searchInterior}"/>
            </form>
        </div>
    </body>
</html>
