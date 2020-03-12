<%-- 
    Document   : view_invoice_history
    Created on : Dec 16, 2019, 8:57:30 PM
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
        <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

        <!-- Title  -->
        <title>South - Real Estate Agency | Invoice History</title>

        <!-- Favicon  -->
        <link rel="icon" href="img/core-img/favicon.ico">

        <!-- Style CSS -->
        <link rel="stylesheet" href="style.css">

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
            <c:redirect url="AdminIndexController"></c:redirect>
        </c:if>

        <c:if test="${sessionScope.USER == null}">
            <c:redirect url="login.jsp"></c:redirect>
        </c:if>
        <%@include file="nav.jsp"%>

        <c:if test="${requestScope.INVOICE_HISTORY == null}">
            <div class="view-area text-center" style="padding-top: 15rem; padding-bottom: 15rem">
                <span>Empty Invoice History!!!</span>
            </div>
        </c:if>

        <c:if test="${requestScope.INVOICE_HISTORY != null}">
            <c:if test="${not empty requestScope.INVOICE_HISTORY}">
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
                                                    <div class="py-2 text-uppercase">Date</div>
                                                </th>
                                                <th scope="col" class="border-0 bg-light">
                                                    <div class="py-2 text-uppercase">User ID</div>
                                                </th>
                                                <th scope="col" class="border-0 bg-light">
                                                    <div class="py-2 text-uppercase">Total</div>
                                                </th>
                                                <th scope="col" class="border-0 bg-light">
                                                    <div class="py-2 text-uppercase">Show Details</div>
                                                </th>
                                            </tr>
                                        </thead>

                                        <tbody>
                                            <c:forEach var="list" varStatus="counter" items="${requestScope.INVOICE_HISTORY}">
                                                <tr>
                                                    <th scope="row" class="border-0">
                                                        <div class="p-2">
                                                            <div class="ml-3 d-inline-block align-middle">
                                                                <strong>${counter.count}</strong>
                                                            </div>
                                                        </div>
                                                    </th>
                                                    <td class="border-0 align-middle"><strong>${list.date}</strong></td>
                                                    <td class="border-0 align-middle"><strong>${list.userID}</strong></td>
                                                    <td class="border-0 align-middle"><strong>${list.getTotalPrice()}</strong></td>
                                                    <td class="border-0 align-middle">
                                                        <c:url var="ShowDetails" value="MainController">
                                                            <c:param name="action" value="Show_Invoice_History_Details"></c:param>
                                                            <c:param name="invoiceID" value="${list.invoiceID}"></c:param>
                                                        </c:url>
                                                        <a href="${ShowDetails}" class="text-dark"><i>Show Details</i></a>
                                                    </td>
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
