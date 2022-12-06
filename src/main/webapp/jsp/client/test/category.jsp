<%--
  Created by IntelliJ IDEA.
  User: lyha8
  Date: 12/6/2022
  Time: 3:11 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<form method="post" action="/test/category">
    <input name="name" type="text" placeholder="name">
        <button type="submit" name="action" value="CREATE">Submit</button>
</form>
<h2>Update</h2>
<form method="post" action="/test/category">
    <input name="name" placeholder="name">
    <button type="submit" name="action" value="UPDATE">Submit</button>
</form>
<h2>Delete</h2>
<form method="post" action="/test/category">
    <input name="id" value="ed286d7f-715f-11ed-8c95-6018955a5f6c" readonly>
    <button type="submit" name="action" value="DELETE">Submit</button>
</form>
</body>
</html>
