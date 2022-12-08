<%@ page import="DTO.AuthorizationData" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="DTO.CartDTO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored = "false" %>
<html>
<head>
    <jsp:include page="common/head.jsp">
        <jsp:param name="title" value="FURNITURE | GIỎ HÀNG"/>
    </jsp:include>
</head>
<body>
<%
    ArrayList<CartDTO> carts = (ArrayList<CartDTO>) request.getAttribute("carts");
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
        <div class="cart-menu">
            <div class="cart-menu_item selected">GIỎ HÀNG</div>
            <div class="cart-menu_item">NHẬP THÔNG TIN</div>
            <div class="cart-menu_item">THANH TOÁN</div>
        </div>

        <c:choose>
            <c:when test="<%= carts.isEmpty() %>">
                <div class="card-store-empty-container">
                    <div class="card-store-swap">
                        <div class="content-area">
                            <p>Your cart is currently empty.</p>
                            <div class="btn-return-shop">
                                <span><a class="btn-text-lg bgr-black hover-bg-red" href="#">RETURN TO SHOP</a></span>
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
                                <th class="smart-cell">PRODUCT</th>
                                <th></th>
                                <th>PRICE</th>
                                <th>QUANTITY</th>
                                <th>SUBTOTAL</th>
                            </tr>
                            </thead>
                            <tbody class="cart-list">
                            <c:forEach items="<%= carts %>" var="cart">
                                <jsp:include page="partials/cart/cart-item.jsp">
                                    <jsp:param name="name" value="${cart.name}"/>
                                    <jsp:param name="price" value="${cart.price}"/>
                                    <jsp:param name="id" value="${cart.id}"/>
                                    <jsp:param name="amount" value="${cart.amount}"/>
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
                        <form action="">
                            <table class="table table-bordered">
                                <tbody>
                                <tr class="table-secondary">
                                    <th>CART TOTALS</th>
                                    <th></th>
                                </tr>
                                <tr>
                                    <th class="cart-info-title">
                                        Subtotal
                                    </th>
                                    <td class="cart-info-des">
                                        <div class="card-price">
                                            <span class="current-price">650.00$</span>
                                        </div>
                                    </td>
                                </tr>
                                </tbody>

                                <tfoot>
                                <tr>
                                    <th class="cart-info-title">
                                        TOTALS
                                    </th>
                                    <td class="cart-info-des">
                                        <div class="card-price">
                                            <span class="current-price">650.00$</span>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="100">
                                        <button class="btn-text-lg bgr-red hover-bg-black">ORDER</button>
                                    </td>
                                </tr>
                                </tfoot>
                            </table>
                        </form>
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
