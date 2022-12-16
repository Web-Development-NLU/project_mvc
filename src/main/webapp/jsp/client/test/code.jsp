<%--
  Created by IntelliJ IDEA.
  User: zxc
  Date: 15/Dec/22
  Time: 4:25 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h2>Create</h2>
<form method="post" action="/test/code">
    <input name="value" type="text" placeholder="value">
    <input name="categoryId" type="text" placeholder="categoryId">
    <input name="productId" type="text" placeholder="productId">
    <button type="submit" name="action" value="CREATE">Submit</button>
</form>
<form method="post" action="/test/code">
    <input name="categoryId" type="text" placeholder="categoryId">
    <input name="productId" type="text" placeholder="productId">
    <button type="submit" name="action" value="CREATE">Submit</button>
</form>
<h2>Update</h2>
<form method="post" action="/test/code">
    <input name="id" value="1">
    <input name="value" type="text" placeholder="value">
    <input name="categoryId" type="text" placeholder="categoryId">
    <input name="productId" type="text" placeholder="productId">
    <button type="submit" name="action" value="UPDATE">Submit</button>
</form>
<h2>Delete</h2>
<form method="post" action="/test/code">
    <input name="id" value="1">
    <button type="submit" name="action" value="DELETE">Submit</button>
</form>
</body>
</html>
