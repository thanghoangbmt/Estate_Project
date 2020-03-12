<%-- 
    Document   : admin_invoice_management
    Created on : Dec 15, 2019, 5:54:00 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Admin Invoice Page</title>
    </head>
    <body>
        <c:if test="${sessionScope.USER.roleID ne 'AD'}">
            <c:redirect url="login.jsp"></c:redirect>
        </c:if>
        <%@include file="admin_nav.jsp"%>

        <c:if test="${requestScope.LIST_INVOICE != null}">
            <c:if test="${not empty requestScope.LIST_INVOICE}">
                <div style="padding-top: 8.5rem">
                    <table class="table">
                        <thead class="thead-dark">
                            <tr>
                                <th scope="col">NO</th>
                                <th scope="col">Date</th>
                                <th scope="col">User ID</th>
                                <th scope="col">Total</th>
                                <th scope="col">Show Details</th>
                            </tr>
                        </thead>

                        <tbody>
                            <c:forEach var="list" varStatus="counter" items="${requestScope.LIST_INVOICE}">
                                <tr>
                                    <th scope="row">${counter.count}</th>
                                    <td>${list.date}</td>
                                    <td>${list.userID}</td>
                                    <td>${list.getTotalPrice()}</td>
                                    <td>
                                        <form action="MainController" method="POST">
                                            <div class="form-group mb-0">
                                                <button type="submit" class="btn btn-primary btn-sm" name="action" value="Show_Invoice_Details">Show Details</button>
                                                <input type="hidden" name="invoiceDetails" value="${list.invoiceID}"/>
                                            </div>
                                        </form>
                                    </td>
                                </c:forEach>
                        </tbody>
                    </table>
                </div>
            </c:if>
        </c:if>
    </body>
</html>
