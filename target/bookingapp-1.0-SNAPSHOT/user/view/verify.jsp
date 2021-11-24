<%--
  Created by IntelliJ IDEA.
  User: dangq
  Date: 11/25/2021
  Time: 2:31 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Verify Page</title>
</head>
<body>
        <form action="${pageContext.request.contextPath}/register" method="post">
            <input type="hidden" name="action" value="save">
            <span>${message}</span>
            <span>Code:</span>
            <input type="text" name="code">
            <input type="submit" value="Submit">
        </form>
</body>
</html>
