<%@ page import="java.util.ArrayList" %>
<%@ page import="Model.Order" %>
<%@ page import="java.text.DecimalFormat" %>
<%@ page import="java.net.URLEncoder" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<%--
  Created by IntelliJ IDEA.
  User: zxc
  Date: 30/Dec/22
  Time: 12:08 PM
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
    ArrayList<Order> orders = (ArrayList<Order>) request.getAttribute("orders");
    int pagination = (int) request.getAttribute("pagination");
    String numPage = DecimalFormat.getIntegerInstance().format(Double.parseDouble(request.getAttribute("numPage").toString()));
    int totalPage = Integer.parseInt(numPage);
%>
<div id="cart-container">
    <header>
        <jsp:include page="common/menu.jsp"/>
        <jsp:include page="common/searchBarMenu.jsp"/>
        <jsp:include page="common/head-bottom-page.jsp">
            <jsp:param name="title" value="GIỎ HÀNG"/>
            <jsp:param name="page" value="Đơn hàng của tôi"/>
        </jsp:include>
    </header>

    <section id="cart-content" class="container-fluid">
        <div class="cart-place" style="margin-top: 2rem">
            <c:choose>
                <c:when test="${!orders.isEmpty()}">
                    <form class="form-search" action="/orderList" accept-charset="utf-8">
                        <input class="ip_search" type="search" placeholder="Nhập mã đơn hàng..." name="infoSearch">
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
                            <c:forEach items="<%= orders %>" var="order">
                                <tr style="border-bottom: 1px solid #DEE2E6">
                                    <td style="border-right: 1px solid #DEE2E6"><a href="${pageContext.request.contextPath}/orderDetail?id=${order.id}">${order.id}</a></td>
                                    <td style="border-right: 1px solid #DEE2E6">${order.info}</td>
                                    <td style="border-left: 1px solid #DEE2E6;">${order.createdAt}</td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </c:when>
                <c:otherwise>
                    <form class="form-search" action="/orderList">
                        <input class="ip_search" type="search" placeholder="Nhập mã đơn hàng..." name="infoSearch">
                        <button class="btn-search">
                            <i class="fa-solid fa-magnifying-glass"></i>
                        </button>
                    </form>
                    <div style="text-align: center;margin: 3.5rem 0">${infoSearch != null ? "Không tìm thấy đơn đặt hàng" : "Không có đơn đặt hàng nào"}</div>
                </c:otherwise>
            </c:choose>
        </div>
        <nav aria-label="Page navigation">
            <ul class="pagination" style="justify-content: center">
                <li class="page-item pagination-item" style="display: <%= totalPage < 2 ? "none" : "block" %>"><a class="page-link color-black" href="${pageContext.request.contextPath}/orderList?page=<%= pagination -1 %>"><i class="fa-solid fa-angle-left"></i></a></li>
                <c:forEach begin="1" end="<%= totalPage %>" var="item">
                    <li class="page-item pagination-item" style="display: <%= totalPage < 2 ? "none" : "block" %>"><a class="page-link color-black ${item == pagination ? "pg-action":""}" href="${pageContext.request.contextPath}/orderList?page=${item}">${item}</a></li>
                </c:forEach>
                <li class="page-item pagination-item" style="display: <%= totalPage < 2 ? "none" : "block" %>"><a class="page-link color-black" href="${pageContext.request.contextPath}/orderList?page=<%= pagination + 1 %>"><i class="fa-solid fa-angle-right"></i></a></li>
            </ul>
        </nav>
    </section>

    <jsp:include page="common/footer.jsp"/>
</div>
<jsp:include page="common/tail.jsp"/>
</body>
</html>
