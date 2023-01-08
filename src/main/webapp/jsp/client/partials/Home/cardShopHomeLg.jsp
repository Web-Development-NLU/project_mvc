<%@ page import="Model.Shop" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: Quang Tho
  Date: 01/12/2022
  Time: 10:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<%
  ArrayList<Shop> lgShop = (ArrayList<Shop>) request.getAttribute("largeShop");
%>
<div class="card-shop-lg-list row no-gutters">
  <c:forEach items="<%=lgShop%>" var="shop">
    <div class="card-shop-lg col-12 col-md">
      <a href="${shop.redirect}" class="color-white">
        <img class="card-shop-lg_thumbnail" width="960" height="626"
             src="${shop.image}">
        <div class="card-shop-lg_content">
          <div class="card-title monts">Cửa hàng</div>
          <div class="card-subtitle monts"><c:out value="${shop.name}"/></div>
          <div class="card-line-decor bgr-white"></div>
          <div class="card-action">
            <a href="${shop.redirect}"><button class="btn-text bgr-white hover-text-red monts">Xem sản phẩm</button></a>
          </div>
        </div>
      </a>
    </div>
  </c:forEach>
</div>