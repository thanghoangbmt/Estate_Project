<%-- 
    Document   : view_invoice_history_details
    Created on : Dec 16, 2019, 9:48:30 PM
    Author     : Admin
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <style>
            body {
                background: #eecda3;
                background: -webkit-linear-gradient(to right, #eecda3, #ef629f);
                background: linear-gradient(to right, #eecda3, #ef629f);
                min-height: 100vh;
            }
        </style>
        <title>South - Real Estate Agency | Invoice History Details</title>
    </head>
    <body>
        <c:if test="${sessionScope.USER.roleID eq 'AD'}">
            <c:redirect url="AdminIndexController"></c:redirect>
        </c:if>

        <c:if test="${sessionScope.USER == null}">
            <c:redirect url="login.jsp"></c:redirect>
        </c:if>

        <%@include file="nav.jsp"%>

        <c:if test="${requestScope.LIST_INVOICE_HISTORY_DETAILS == null}">
            <div class="view-area text-center" style="padding-top: 15rem; padding-bottom: 15rem">
                <span>Empty Invoice History!!!</span>
            </div>
        </c:if>

        <c:if test="${requestScope.LIST_INVOICE_HISTORY_DETAILS != null}">
            <c:if test="${not empty requestScope.LIST_INVOICE_HISTORY_DETAILS}">
                <div class="row">
                    <div class="col-lg-12 p-5 bg-white rounded shadow-sm mb-5">

                        <!-- Shopping cart table -->
                        <div class="pb-5" style="padding-top: 9rem">
                            <div class="container">
                                <div class="table-responsive">
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th scope="col" class="border-0 bg-light">
                                                    <div class="p-2 px-3 text-uppercase">NO</div>
                                                </th>
                                                <th scope="col" class="border-0 bg-light">
                                                    <div class="py-2 text-uppercase">Property ID</div>
                                                </th>
                                                <th scope="col" class="border-0 bg-light">
                                                    <div class="py-2 text-uppercase">Price</div>
                                                </th>
                                                <th scope="col" class="border-0 bg-light">
                                                    <div class="py-2 text-uppercase">Invoice ID</div>
                                                </th>
                                                <th scope="col" class="border-0 bg-light">
                                                    <div class="py-2 text-uppercase">Date</div>
                                                </th>
                                            </tr>
                                        </thead>

                                        <tbody>
                                            <c:forEach var="list" varStatus="counter" items="${requestScope.LIST_INVOICE_HISTORY_DETAILS}">
                                                <tr>
                                                    <th scope="row" class="border-0">
                                                        <div class="p-2">
                                                            <div class="ml-3 d-inline-block align-middle">
                                                                <strong>${counter.count}</strong>
                                                            </div>
                                                        </div>
                                                    </th>
                                                    <td class="border-0 align-middle"><strong>${list.propertyID}</strong></td>
                                                    <td class="border-0 align-middle"><strong>${list.price}</strong></td>
                                                    <td class="border-0 align-middle"><strong>${list.invoiceID}</strong></td>
                                                    <td class="border-0 align-middle"><strong>${list.invoiceDate}</strong></td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                                <!-- End -->
                            </div>
                        </div>
                    </div>
                </div>

            </c:if>
        </c:if>
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
