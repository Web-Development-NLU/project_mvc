<%--
  Created by IntelliJ IDEA.
  User: Quang Tho
  Date: 26/11/2022
  Time: 12:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <%
        int statusCode = (int) request.getAttribute("statusCode");
        String message = (String) request.getAttribute("message");
    %>
    <h1><%= statusCode %></h1>
    <p><%= message %></p>
</body>
</html>
