<%--
  Created by IntelliJ IDEA.
  User: Quang Tho
  Date: 29/11/2022
  Time: 22:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
  <form method="POST" action="/mail">
    <label>
      <input name="email" placeholder="email">
    </label>
    <button type="submit" >Submit</button>
  </form>
</body>
</html>
