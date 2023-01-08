<%@ page import="Model.Order" %>
<%@ page import="java.util.ArrayList" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><%--
  Created by IntelliJ IDEA.
  User: zxc
  Date: 05/Jan/23
  Time: 1:35 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html
        lang="en"
        class="light-style layout-menu-fixed"
        dir="ltr"
        data-theme="theme-default"
        data-assets-path="/assets/"
        data-template="vertical-menu-template-free"
>
<head>
  <jsp:include page="common/head.jsp">
    <jsp:param name="title" value="FURNITURE | GIỎ HÀNG"/>
  </jsp:include>
</head>
<body>
<%
  Order order = (Order) request.getAttribute("order");
  boolean orderEmpty = (boolean) request.getAttribute("orderEmpty");
%>
<div id="cart-container">
  <header>
    <jsp:include page="common/menu.jsp"/>
    <jsp:include page="common/searchBarMenu.jsp"/>
    <jsp:include page="common/head-bottom-page.jsp">
      <jsp:param name="title" value="GIỎ HÀNG"/>
      <jsp:param name="page" value="cart"/>
    </jsp:include>
  </header>

  <section id="cart-content" class="container-fluid">
    <div class="cart-place" style="margin-top: 2rem">
      <c:choose>
        <c:when test="${order != null}">
          <form class="form-search" action="/searchOrder" method="post">
            <input class="ip_search" type="search" placeholder="Nhập mã đơn hàng..." name="search_order">
            <button class="btn-search">
              <i class="fa-solid fa-magnifying-glass"></i>
            </button>
          </form>
          <div class="cart-table mt-5" style="margin-top: 10px !important;">
            <table class="table table-bordered">
              <thead>
              <tr>
                <th>ID</th>
                <th>Thông tin chi tiết</th>
                <th>Ngày tạo</th>
              </tr>
              </thead>
              <tbody>
              <tr style="border-bottom: 1px solid #DEE2E6">
                <td style="border-right: 1px solid #DEE2E6"><a href="${pageContext.request.contextPath}/orderDetail?id=${order.id}">${order.id}</a></td>
                <td style="border-right: 1px solid #DEE2E6">${order.info}</td>
                <td style="border-left: 1px solid #DEE2E6">${order.createdAt}</td>
              </tr>
              </tbody>
            </table>
          </div>
        </c:when>
        <c:when test="${orderEmpty == true}">
          <form class="form-search" action="/searchOrder" method="post" style="margin-bottom: 1rem;text-align: center; display: block">
            <input class="ip_search" type="search" placeholder="Nhập mã đơn hàng..." name="search_order">
            <button class="btn-search" style="transform: translateY(2px);">
              <i class="fa-solid fa-magnifying-glass"></i>
            </button>
          </form>
          <div style="text-align: center;margin-bottom: 1.5rem">Mã đơn hàng không tồn tại</div>
        </c:when>
        <c:otherwise>
          <form class="form-search" action="/searchOrder" method="post" style="margin-bottom: 1rem;text-align: center; display: block">
            <input class="ip_search" type="search" placeholder="Nhập mã đơn hàng..." name="search_order">
            <button class="btn-search" style="transform: translateY(2px);">
              <i class="fa-solid fa-magnifying-glass"></i>
            </button>
          </form>
        </c:otherwise>
      </c:choose>
    </div>
  </section>

  <jsp:include page="common/footer.jsp"/>
</div>
<jsp:include page="common/tail.jsp"/>
</body>
</html>
