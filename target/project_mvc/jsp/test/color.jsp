<%--
  Created by IntelliJ IDEA.
  User: zxc
  Date: 09/Dec/22
  Time: 3:56 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form method="post" action="/test/color">
    <input name="name" type="text" placeholder="name">
    <input name="value" type="color" placeholder="value">
    <button type="submit" name="action" value="CREATE">Submit</button>
</form>
<h2>Update</h2>
<form method="post" action="/test/color">
    <input name="id" value="1">
    <input name="name" type="text" placeholder="name">
    <input name="value" type="text" placeholder="value">

    <button type="submit" name="action" value="UPDATE">Submit</button>
</form>
<h2>Delete</h2>
<form method="post" action="/test/color">
    <input name="id" value="1">
    <button type="submit" name="action" value="DELETE">Submit</button>
</form>
</body>
</html>
