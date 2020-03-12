<%-- 
    Document   : admin_estate_management
    Created on : Dec 11, 2019, 10:57:01 AM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Account Management Page</title>

    </head>

    <body>
        <c:if test="${sessionScope.USER.roleID ne 'AD'}">
            <c:redirect url="login.jsp"></c:redirect>
        </c:if>

        <%@include file="admin_nav.jsp"%>
        <form action="MainController">
            <div class="form-group" style="padding-top: 9rem">
                <button type="submit" class="btn south-btn" name="action" value="Admin_Insert_New_Account" style="background-color: #99ff99">Add New Account</button>
            </div>
        </form>

        <c:if test="${requestScope.LISTACCOUNT != null}">
            <c:if test="${not empty requestScope.LISTACCOUNT}">
                <div>
                    <table class="table">
                        <thead class="thead-dark">
                            <tr>
                                <th scope="col">NO</th>
                                <th scope="col">User ID</th>
                                <th scope="col">Password</th>
                                <th scope="col">Role ID</th>
                                <th scope="col">User Name</th>
                                <th scope="col">Gender</th>
                                <th scope="col">Active</th>
                                <th scope="col">Update</th>
                                <th scope="col">Delete</th>
                            </tr>
                        </thead>
                </div>

            <tbody>
                <c:forEach var="list" varStatus="counter" items="${requestScope.LISTACCOUNT}">
                    <tr>
                        <th scope="row">${counter.count}</th>
                        <td>${list.userID}</td>
                        <td>${list.password}</td>
                        <td>${list.roleID}</td>
                        <td>${list.userName}</td>
                        <td>${list.gender}</td>
                        <td>${list.isActived}</td>
                        <td>
                            <form action="MainController" method="POST">
                                <div class="form-group mb-0">
                                    <button type="submit" class="btn btn-primary btn-sm" name="action" value="Admin_Edit_Account">Update</button>
                                    <input type="hidden" name="userID" value="${list.userID}"/>
                                    <input type="hidden" name="password" value="${list.password}"/>
                                    <input type="hidden" name="roleID" value="${list.roleID}"/>
                                    <input type="hidden" name="userName" value="${list.userName}"/>
                                    <input type="hidden" name="gender" value="${list.gender}"/>
                                </div>
                            </form>
                        </td>
                        <td>
                            <c:if test="${list.isActived == true}">
                                <c:url var="delete_Account" value="MainController">
                                    <c:param name="userID" value="${list.userID}"></c:param>
                                    <c:param name="action" value="Admin_Delete_Account"></c:param>
                                </c:url>
                                <c:if test="${list.userID eq sessionScope.USER.userID}">
                                    <a href="${delete_Account}" class="deleteLink">Delete</a>
                                </c:if>

                                <c:if test="${list.userID ne sessionScope.USER.userID}">
                                    <a href="${delete_Account}" class="deleteLink">Delete</a>
                                </c:if>
                            </c:if>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </c:if>
    </c:if>

</body>

<script>
    function myFunction(e) {
        if (!confirm('Do you really want to delete?'))
        {
            e.preventDefault();
        }
    }
    const deleteLinks = document.querySelectorAll('.deleteLink');
    for (let link of deleteLinks) {
        link.addEventListener('click', e => {
            myFunction(e);
        });
    }
</script>
</html>
