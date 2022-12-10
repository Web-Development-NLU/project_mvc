<%--
  Created by IntelliJ IDEA.
  User: Quang Tho
  Date: 03/12/2022
  Time: 14:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="common/head.jsp">
        <jsp:param name="title" value="FURNITURE | GIỎ HÀNG"/>
    </jsp:include>
</head>
<body>

<div id="order-container">
    <header>
        <jsp:include page="common/menu.jsp"/>
        <jsp:include page="common/searchBarMenu.jsp"/>
        <jsp:include page="common/head-bottom-page.jsp">
            <jsp:param name="title" value="GIỎ HÀNG"/>
            <jsp:param name="page" value="cart"/>
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
                <a href="#" class="action-content">BẤM VÀO ĐÂY ĐỂ ĐĂNG NHẬP</a>
            </div>
        </div>

        <form action="">
            <div class="checkout-detail row">
                <div class="checkout-billing col-12 col-lg-8">
                    <div class="checkout-billing_title">Chi tiết đơn hàng</div>
                    <div class="billing-name row">
                        <div class="input-secondary col">
                            <label for="firstName">Frist Name *</label>
                            <input type="text" id="firstName" name="firstName">
                        </div>
                        <div class="input-secondary col">
                            <label for="lastName">Last Name *</label>
                            <input type="text" id="lastName" name="lastName">
                        </div>
                    </div>
                    <div class="input-secondary">
                        <label for="country">Country *</label>
                        <input type="text" id="country">
                    </div>
                    <div class="input-secondary">
                        <label for="city">City/Province *</label>
                        <input type="text" id="city" name="city">
                    </div>
                    <div class="input-secondary">
                        <label for="district">District *</label>
                        <input type="text" id="district" name="district">
                    </div>
                    <div class="input-secondary">
                        <label for="address">Address *</label>
                        <input type="text" id="address" name="address">
                    </div>
                    <div class="input-secondary">
                        <label for="phone">Phone *</label>
                        <input type="text" id="phone" name="phone">
                    </div>
                    <div class="input-secondary">
                        <label for="email">Email *</label>
                        <input type="text" id="email" name="email">
                    </div>
                    <div class="checkout-additional-info">
                        <div class="checkout-additional-info_title">Additional Infomation</div>
                        <textarea class="text-area mt-4" placeholder="Additional info" name="additionalInfo"></textarea>
                    </div>
                </div>

                <div class="checkout-action col-12 col-lg-4">
                    <div class="checkout-carts-list">
                        <div class="action-item-title monts mb-3">SẢN PHẨM</div>
                        <div class="action-carts">
                            <jsp:include page="partials/order/action-cart.jsp"/>
                            <jsp:include page="partials/order/action-cart.jsp"/>
                        </div>
                    </div>

                    <div class="checkout-action-item totals">
                        <div class="action-item-title monts">TỔNG GIÁ</div>
                        <div class="action-item-des">
                            <div class="card-price">
                                <span class="current-price">650.00$</span>
                            </div>
                        </div>
                    </div>
                    <a href="#"><button class="btn-text-lg bgr-black hover-bg-red monts">TIẾN HÀNH THANH TOÁN</button></a>
                </div>
            </div>
        </form>

    </section>

    <jsp:include page="common/footer.jsp"/>
</div>

<jsp:include page="common/tail.jsp"/>
</body>
</html>
