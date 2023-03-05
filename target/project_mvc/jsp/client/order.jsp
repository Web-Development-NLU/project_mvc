<%@ page import="java.util.ArrayList" %>
<%@ page import="DTO.CartDTO" %>
<%@ page import="Model.User" %>
<%@ page import="java.text.DecimalFormat" %>
<%@ page import="DTO.AuthorizationData" %><%--
  Created by IntelliJ IDEA.
  User: Quang Tho
  Date: 03/12/2022
  Time: 14:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <jsp:include page="common/head.jsp">
        <jsp:param name="title" value="FURNITURE | GIỎ HÀNG"/>
    </jsp:include>
</head>
<body>
<%
    AuthorizationData authorizationData = (AuthorizationData) session.getAttribute("authorization");
    boolean logged = (boolean) request.getAttribute("logged");
    ArrayList<CartDTO> carts = (ArrayList<CartDTO>) request.getAttribute("carts");
    User user = (User) request.getAttribute("user");
    String error = (request.getAttribute("error") == null) ? "" : request.getAttribute("error").toString();
    String firstName = "";
    String lastName = "";
    String country = "";
    String city = "";
    String district = "";
    String address = "";
    String phone = "";
    String email = "";
    if(user != null) {
        firstName = (user.getFirstName() != null) ? user.getFirstName() : "";
        lastName = (user.getLastName() != null) ? user.getLastName() : "";
        country = (user.getCountry() != null) ? user.getCountry() : "";
        city = (user.getCity() != null) ? user.getCity() : "";
        district = (user.getDistrict() != null) ? user.getDistrict() : "";
        address = (user.getAddress() != null) ? user.getAddress() : "";
        phone = (user.getPhone() != null) ? user.getPhone() : "";
        email = (user.getEmail() != null) ? user.getEmail() : "";
    }

    double sumPrice = 0;

    for(CartDTO cart: carts) {
        sumPrice += cart.getPrice() * cart.getAmount();
    }
%>
<div id="order-container">
    <header>
        <jsp:include page="common/menu.jsp"/>
        <jsp:include page="common/searchBarMenu.jsp"/>
        <jsp:include page="common/head-bottom-page.jsp">
            <jsp:param name="title" value="GIỎ HÀNG"/>
            <jsp:param name="page" value="GIỎ HÀNG"/>
        </jsp:include>
    </header>

    <section id="checkout-content" class="container-fluid">
        <div class="cart-menu">
            <div class="cart-menu_item">GIỎ HÀNG</div>
            <div class="cart-menu_item selected">NHẬP THÔNG TIN </div>
            <div class="cart-menu_item">THANH TOÁN</div>
        </div>

        <div class="checkout-other-action mt-5 mb-5">
            <div class="action-link">
                <i class="fa-regular fa-user action-icon"></i>
                <a href="/login" disabled="<%=logged ? "true":"false"%>" class="action-content">BẤM VÀO ĐÂY ĐỂ ĐĂNG NHẬP</a>
            </div>
        </div>

        <form action="${pageContext.request.contextPath}/order" method="post">
            <div class="checkout-detail row">
                <div class="checkout-billing col-12 col-lg-8">
                    <div class="checkout-billing_title">Chi tiết đơn hàng</div>
                    <c:if test="<%= !error.isEmpty() %>">
                        <div class="color-red mb-3 overflow-hidden">
                            <%= error %>
                        </div>
                    </c:if>
                    <div class="billing-name row">
                        <div class="input-secondary col">
                            <label for="firstName">Họ *</label>
                            <input type="text" id="firstName" name="firstName" value="<%= firstName %>">
                        </div>
                        <div class="input-secondary col">
                            <label for="lastName">Tên *</label>
                            <input type="text" id="lastName" name="lastName" value="<%= lastName %>">
                        </div>
                    </div>
                    <div class="input-secondary">
                        <label for="country">Quốc gia *</label>
                        <input type="text" id="country" name="country" value="<%= country %>">
                    </div>
                    <div class="input-secondary">
                        <label for="city">Thành phố/ Tỉnh *</label>
                        <input type="text" id="city" name="city" value="<%= city %>">
                    </div>
                    <div class="input-secondary">
                        <label for="district">Quận *</label>
                        <input type="text" id="district" name="district" value="<%= district %>">
                    </div>
                    <div class="input-secondary">
                        <label for="address">Địa chỉ cụ thể *</label>
                        <input type="text" id="address" name="address" value="<%= address %>">
                    </div>
                    <div class="input-secondary">
                        <label for="phone">Số điện thoại *</label>
                        <input type="text" id="phone" name="phone" value="<%= phone %>">
                    </div>
                    <div class="input-secondary">
                        <label for="email">Email *</label>
                        <input type="text" id="email" name="email" VALUE="<%= email %>">
                    </div>

                </div>

                <div class="checkout-action col-12 col-lg-4">
                    <div class="checkout-carts-list">
                        <div class="action-item-title monts mb-3">SẢN PHẨM</div>
                        <div class="action-carts">
                            <c:forEach items="<%= carts %>" var="cart">
                                <jsp:include page="partials/order/action-cart.jsp">
                                    <jsp:param name="image" value="${cart.image}"/>
                                    <jsp:param name="name" value="${cart.name}"/>
                                    <jsp:param name="price" value="${cart.price}"/>
                                    <jsp:param name="amount" value="${cart.amount}"/>
                                    <jsp:param name="pattern" value="${cart.pattern}"/>
                                    <jsp:param name="color" value="${cart.color}"/>
                                </jsp:include>
                            </c:forEach>
                        </div>
                    </div>

                    <div class="checkout-action-item totals">
                        <div class="action-item-title monts">TỔNG GIÁ</div>
                        <div class="action-item-des">
                            <div class="card-price">
                                <span class="current-price"><%=DecimalFormat.getIntegerInstance().format(sumPrice)%> VNĐ</span>
                            </div>
                        </div>
                    </div>
                    <button class="btn-text-lg bgr-black hover-bg-red monts">TIẾN HÀNH THANH TOÁN</button>
                </div>
            </div>
        </form>

    </section>

    <jsp:include page="common/footer.jsp"/>
</div>

<jsp:include page="common/tail.jsp"/>
</body>
</html>
