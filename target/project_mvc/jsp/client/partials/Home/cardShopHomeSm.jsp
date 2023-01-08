<%@ page import="Model.Shop" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: Quang Tho
  Date: 01/12/2022
  Time: 10:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<%
  ArrayList<Shop> smallShop = (ArrayList<Shop>) request.getAttribute("smallShop");
%>
<div class="container_card-shop mt-md-5 mb-md-5 mt-sm-3 mb-sm-3">
  <c:forEach items="<%=smallShop%>" var="shop">
    <div class="card-shop">
      <a href="${shop.redirect}">
        <img src="${shop.image}">
      </a>
      <div class="card-shop_text">
        <h2 class="card-shop_title monts"><c:out value="${shop.name}"/></h2>
        <a href="${shop.redirect}">
          <div class="card-shop_action">Xem sản phẩm</div>
        </a>
      </div>
    </div>
  </c:forEach>
</div>
