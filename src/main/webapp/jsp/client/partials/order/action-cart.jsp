<%@ page import="java.text.DecimalFormat" %><%--
  Created by IntelliJ IDEA.
  User: Quang Tho
  Date: 03/12/2022
  Time: 15:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<%
  int price = (int) Double.parseDouble(request.getParameter("price"));
  String name = request.getParameter("name");
  int amount = Integer.parseInt(request.getParameter("amount"));
  String pattern = request.getParameter("pattern");
  String color = request.getParameter("color");
%>
<div class="action-cart">
  <div class="checkout-card-product">
    <div class="product-info-container">
      <div class="img-product">
        <img src="../assets/imgs/card-shop/product_chair_wood.jpg" alt="">
      </div>
      <div class="product-info">
        <div class="product-item-name-swap">
          <span class="product-item-name monts"><%= name %></span>
          <strong class="product-quantity">× <%= amount %></strong>
        </div>
        <div class="material">
          <c:if test="<%= !color.isEmpty()%>">
            <span class="material-color">color</span>
            <span class="value-color"><%= color %></span>
          </c:if>
          <c:if test="<%= !pattern.isEmpty() %>">
            <span class="material-pattern">pattern</span>
            <span class="value-pattern"><%= pattern %></span>
          </c:if>
        </div>
      </div>
    </div>
    <div class="product-total-cost">
      <span class="total-cost"> đ<%=DecimalFormat.getIntegerInstance().format(price)%></span>
    </div>
  </div>
  <div class="checkout-action-item">
    <div class="action-item-title monts">SUBTOTAL</div>
    <div class="action-item-des">
      <div class="card-price">
        <span class="current-price">đ<%=DecimalFormat.getIntegerInstance().format(amount * price)%></span>
      </div>
    </div>
  </div>
</div>