<%-- 
    Document   : error.jsp
    Created on : Dec 13, 2019, 11:31:25 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Error Page</title>
    </head>
    <body>
        <h1>${requestScope.ERRORMESSAGE}</h1>
    </body>
</html>
