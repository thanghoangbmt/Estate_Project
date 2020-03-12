<%-- 
    Document   : viewCart
    Created on : Dec 14, 2019, 9:22:05 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            body {
                background: #eecda3;
                background: -webkit-linear-gradient(to right, #eecda3, #ef629f);
                background: linear-gradient(to right, #eecda3, #ef629f);
                min-height: 100vh;
            }
        </style>
    </head>
    <body>
        <c:if test="${sessionScope.USER.roleID eq 'AD'}">
            <c:redirect url="index.jsp"></c:redirect>
        </c:if>
        <%@include file="nav.jsp" %>


        <div class="pb-5" style="padding-top: 9rem">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12 p-5 bg-white rounded shadow-sm mb-5">

                        <!-- Shopping cart table -->
                        <div class="table-responsive">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th scope="col" class="border-0 bg-light">
                                            <div class="p-2 px-3 text-uppercase">Estate</div>
                                        </th>
                                        <th scope="col" class="border-0 bg-light">
                                            <div class="py-2 text-uppercase">Price</div>
                                        </th>
                                        <th scope="col" class="border-0 bg-light">
                                            <div class="py-2 text-uppercase">Remove</div>
                                        </th>
                                    </tr>
                                </thead>
                                <c:if test="${not empty requestScope.CHECKOUT_SUCCESSFULLY_MESSAGE}">
                                    Success: ${requestScope.CHECKOUT_SUCCESSFULLY_MESSAGE}
                                </c:if>

                                <c:if test="${not empty requestScope.CHECKOUT_FAILED_MESSAGE}">
                                    <br/>

                                    <font color="red">Error: ${requestScope.CHECKOUT_FAILED_MESSAGE}</font>
                                </c:if>
                                <tbody>
                                    <c:forEach var="cartList" varStatus="totalPrice" items="${sessionScope.CART.cart}">
                                        <tr>
                                            <th scope="row" class="border-0">
                                                <div class="p-2">
                                                    <img src="${cartList.getValue().images.get(0)}" alt="" width="70" class="img-fluid rounded shadow-sm">
                                                    <div class="ml-3 d-inline-block align-middle">
                                                        <h5 class="mb-0">
                                                            <c:url var="Details" value="MainController">
                                                                <c:param name="action" value="ShowDetails_Estate"></c:param>
                                                                <c:param name="propertyID" value="${cartList.getKey()}"></c:param>
                                                            </c:url>
                                                            <a href="${Details}" class="text-dark d-inline-block align-middle">${cartList.getValue().category} in ${cartList.getValue().province}</a>
                                                        </h5>
                                                        <span class="text-muted font-weight-normal font-italic d-block">${cartList.getValue().address} - ${cartList.getValue().description}</span>
                                                    </div>
                                                </div>
                                            </th>
                                            <td class="border-0 align-middle"><strong>$${cartList.getValue().salePrice}</strong></td>
                                            <td class="border-0 align-middle">
                                                <c:url var="Remove" value="MainController">
                                                    <c:param name="action" value="Remove_Estate_In_Cart"></c:param>
                                                    <c:param name="propertyID" value="${cartList.getKey()}"></c:param>
                                                </c:url>
                                                <a href="${Remove}" class="text-dark"><i class="fa fa-trash">Remove</i></a>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                        <!-- End -->
                    </div>
                </div>

                <div class="row py-5 p-4 bg-white rounded shadow-sm">
                    <div class="col-lg-6">
                        <div class="bg-light rounded-pill px-4 py-3 text-uppercase font-weight-bold">Coupon code</div>
                        <div class="p-4">
                            <p class="font-italic mb-4">If you have a coupon code, please enter it in the box below</p>
                            <div class="input-group mb-4 border rounded-pill p-2">
                                <input type="text" placeholder="Apply coupon" aria-describedby="button-addon3" class="form-control border-0">
                                <div class="input-group-append border-0">
                                    <button id="button-addon3" type="button" class="btn btn-dark px-4 rounded-pill"><i class="fa fa-gift mr-2"></i>Apply coupon</button>
                                </div>
                            </div>
                        </div>
                        <div class="bg-light rounded-pill px-4 py-3 text-uppercase font-weight-bold">Instructions for seller</div>
                        <div class="p-4">
                            <p class="font-italic mb-4">If you have some information for the seller you can leave them in the box below</p>
                            <textarea name="" cols="30" rows="2" class="form-control"></textarea>
                        </div>
                    </div>

                    <div class="col-lg-6">
                        <div class="bg-light rounded-pill px-4 py-3 text-uppercase font-weight-bold">Order summary </div>
                        <div class="p-4">
                            <p class="font-italic mb-4">Shipping and additional costs are calculated based on values you have entered.</p>
                            <ul class="list-unstyled mb-4">
                                <li class="d-flex justify-content-between py-3 border-bottom"><strong class="text-muted">Order Subtotal </strong><strong>$${sessionScope.CART.getTotalPrice()}</strong></li>
                                <li class="d-flex justify-content-between py-3 border-bottom"><strong class="text-muted">Discount</strong><strong>$0.00</strong></li>
                                <li class="d-flex justify-content-between py-3 border-bottom"><strong class="text-muted">Total</strong>
                                    <h5 class="font-weight-bold">$${sessionScope.CART.getTotalPrice()}</h5>
                                </li>
                            </ul>
                            <c:if test="${sessionScope.CART.cart.size() > 0}">
                                <c:if test="${sessionScope.USER == null}">
                                    <c:url var="checkOut" value="login.jsp">
                                        <c:param name="action" value="Login"></c:param>
                                    </c:url>
                                </c:if>

                                <c:if test="${sessionScope.USER != null}">
                                    <c:url var="checkOut" value="MainController">
                                        <c:param name="action" value="CheckOut_Cart"></c:param>
                                    </c:url>
                                </c:if>


                                <a href="${checkOut}" class="btn btn-dark rounded-pill py-2 btn-block">Procceed to checkout</a>
                            </c:if>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <%@include file="footer_ui.jsp" %>

    <script src="js/jquery/jquery-2.2.4.min.js"></script>
    <!-- Popper js -->
    <script src="js/bootstrap/popper.min.js"></script>
    <!-- Bootstrap js -->
    <script src="js/bootstrap/bootstrap.min.js"></script>
    <!-- All Plugins js -->
    <script src="js/plugins/plugins.js"></script>
    <!-- Active js -->
    <script src="js/active.js"></script>
</body>
</html>
