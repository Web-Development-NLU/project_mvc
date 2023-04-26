<%@ page import="java.util.ArrayList" %>
<%@ page import="DTO.CartDTO" %>
<%@ page import="java.text.DecimalFormat" %>
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
    ArrayList<CartDTO> carts = (ArrayList<CartDTO>) request.getAttribute("carts");
    double sumPrice = 0;

    for(CartDTO cart: carts) {
        sumPrice += cart.getPrice() * cart.getAmount();
    }

%>
<div id="cart-container">
    <header>
        <jsp:include page="common/menu.jsp"/>
        <jsp:include page="common/searchBarMenu.jsp"/>
        <jsp:include page="common/head-bottom-page.jsp">
            <jsp:param name="title" value="GIỎ HÀNG"/>
            <jsp:param name="page" value="GIỎ HÀNG"/>
        </jsp:include>
    </header>

    <section id="cart-content" class="container-fluid">
        <div class="cart-menu">
            <div class="cart-menu_item selected">GIỎ HÀNG</div>
            <div class="cart-menu_item">NHẬP THÔNG TIN</div>
            <div class="cart-menu_item">THANH TOÁN</div>
            <div class="cart-menu_item">TRẠNG THÁI ĐƠN HÀNG</div>

        </div>

        <c:choose>
            <c:when test="<%= carts.isEmpty() %>">
                <div class="card-store-empty-container">
                    <div class="card-store-swap">
                        <div class="content-area">
                            <p>GIỎ HÀNG CỦA BẠN ĐANG TRỐNG</p>
                            <div class="btn-return-shop">
                                <span><a class="btn-text-lg bgr-black hover-bg-red" href="/product">TRỞ VỀ CỬA HÀNG</a></span>
                            </div>
                        </div>
                    </div>
                </div>
            </c:when>
            <c:otherwise>
                <div class="cart-place row">
                    <div class="cart-table mt-5 col-12 col-md-8">
                        <table class="table table-bordered">
                            <thead>
                            <tr>
                                <th class="smart-cell">SẢN PHẨM</th>
                                <th>TÊN</th>
                                <th>GIÁ</th>
                                <th>SỐ LƯỢNG</th>
                                <th>XÓA SẢN PHẨM</th>
                            </tr>
                            </thead>
                            <tbody class="cart-list">
                            <c:forEach items="<%= carts %>" var="cart">
                                <jsp:include page="partials/cart/cart-item.jsp">
                                    <jsp:param name="image" value="${cart.image}"/>
                                    <jsp:param name="name" value="${cart.name}"/>
                                    <jsp:param name="price" value="${cart.price}"/>
                                    <jsp:param name="id" value="${cart.id}"/>
                                    <jsp:param name="amount" value="${cart.amount}"/>
                                    <jsp:param name="pattern" value="${cart.pattern}"/>
                                    <jsp:param name="color" value="${cart.color}"/>
                                </jsp:include>
                            </c:forEach>
                            </tbody>
                            <tfoot>
                            <tr>
                                <td colspan="100">
                                    <input class="input-primary" type="text" name="code" placeholder="Code">
                                </td>
                            </tr>
                            </tfoot>
                        </table>
                    </div>

                    <div class="cart-info-sum mt-5 col-12 col-md-4">
                        <table class="table table-bordered">
                            <tbody>
                            <tr class="table-secondary">
                                <th>Tổng</th>
                                <th></th>
                            </tr>
                            </tbody>

                            <tfoot>
                            <tr>
                                <th class="cart-info-title">
                                    Tổng giá
                                </th>
                                <td class="cart-info-des">
                                    <div class="card-price">
                                        <span class="current-price"><%=DecimalFormat.getIntegerInstance().format(sumPrice)%> VNĐ</span>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="100">
                                    <a href="${pageContext.request.contextPath}/order"><button class="btn-text-lg bgr-red hover-bg-black">Đặt hàng</button></a>
                                </td>
                            </tr>
                            </tfoot>
                        </table>
                    </div>
                </div>
            </c:otherwise>
        </c:choose>
    </section>

    <jsp:include page="common/footer.jsp"/>
</div>

<jsp:include page="common/tail.jsp"/>
</body>
</html>
