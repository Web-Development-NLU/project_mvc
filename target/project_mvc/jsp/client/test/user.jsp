<%--
  Created by IntelliJ IDEA.
  User: Quang Tho
  Date: 01/12/2022
  Time: 14:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form method="post" action="/test/user">
    <input name="email" type="email" placeholder="email">
    <input name="password" type="password" placeholder="password">
    <button type="submit" name="action" value="CREATE">Submit</button>
</form>
<h2>Update</h2>
<form method="post" action="/test/user">
    <input name="id" value="df07a8cc-7153-11ed-8c95-6018955a5f6c" readonly>
    <input name="firstName" placeholder="firstName">
    <input name="lastName" placeholder="lastName">
    <input name="phone" placeholder="phone">
    <input name="country" placeholder="country">
    <input name="city" placeholder="city">
    <input name="district" placeholder="district">
    <input name="address" placeholder="address">

    <button type="submit" name="action" value="UPDATE">Submit</button>
</form>
<h2>Delete</h2>
<form method="post" action="/test/user">
    <input name="id" value="ed286d7f-715f-11ed-8c95-6018955a5f6c" readonly>
    <button type="submit" name="action" value="DELETE">Submit</button>
</form>
</body>
</html>
