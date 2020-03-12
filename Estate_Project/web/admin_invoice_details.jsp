<%-- 
    Document   : admin_invoice_details
    Created on : Dec 15, 2019, 6:18:56 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Invoice Details Page</title>
    </head>
    <body>
        <c:if test="${sessionScope.USER.roleID ne 'AD'}">
            <c:redirect url="login.jsp"></c:redirect>
        </c:if>

        <%@include file="admin_nav.jsp"%>
        <c:if test="${requestScope.INVOICE_DETAILS != null}">
            <c:if test="${not empty requestScope.INVOICE_DETAILS}">
                <div style="padding-top: 8.5rem">
                    <span>USER ID: ${requestScope.USERID}</span> <br/>
                    <span>DATE: ${requestScope.DATE}</span> <br/>
                    <span>Total: ${requestScope.TOTAL}</span> <br/>
                </div>


                <div>
                    <table class="table">
                        <thead class="thead-dark">
                            <tr>
                                <th scope="col">PropertyID</th>
                                <th scope="col">Price</th>
                                <th scope="col">Invoice ID</th>
                                <th scope="col">Invoice Date</th>
                            </tr>
                        </thead>

                        <tbody>
                        <tbody>
                            <c:forEach var="listInvoice" varStatus="counter" items="${requestScope.INVOICE_DETAILS}">
                                <tr>
                                    <td>${listInvoice.propertyID}</td>
                                    <td>${listInvoice.price}</td>
                                    <td>${listInvoice.invoiceID}</td>
                                    <td>${listInvoice.invoiceDate}</td>
                                </tr>
                            </c:forEach>

                        </tbody>
                    </table>
                </div>



            </c:if>
        </c:if>
    </body>
</html>
