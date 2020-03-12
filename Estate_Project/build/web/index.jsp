<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="description" content="">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>South - Real Estate Agency | Home</title>
    </head>

    <body>
        <c:if test="${sessionScope.USER.roleID eq 'AD'}">
            <c:redirect url="AdminIndexController"></c:redirect>
        </c:if>
        
        <c:if test="${sessionScope.TOPSIXLIST == null}">
            <c:redirect url="IndexController"></c:redirect>
        </c:if>
        
        <%@include file="nav.jsp"%>
        <%@include file="index_body.jsp"%>
        <%@include file="footer_ui.jsp"%>
    </body>
</html>