<%--
  Created by IntelliJ IDEA.
  User: Quang Tho
  Date: 02/12/2022
  Time: 15:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored = "false" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <% String error = (String) request.getAttribute("error"); %>

    <c:if test="<%= error != null %>">
        <p><%= error %></p>
    </c:if>

    <form action="${pageContext.request.contextPath}/test/upload" method="post" enctype="multipart/form-data">
        <input type="file" name="fileName">
        <button type="submit" value="Upload">submit</button>
    </form>
</body>
</html>
