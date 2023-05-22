<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="Model.Order" %>
<%@ page import="Model.StatusOrder" %>
<%@ page import="Model.ProductOrder" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="Model.Product" %>
<%@ page import="DTO.ProductOrderDTO" %>
<%@ page import="java.text.DecimalFormat" %>
<%@ page import="java.time.LocalDateTime" %>
<%@ page import="java.time.Instant" %>
<%@ page import="java.time.ZoneId" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>

<html lang="en">
<head>
    <jsp:include page="common/head.jsp">
        <jsp:param name="title" value="FURNITURE | KẾT QUẢ THANH TOÁN"/>
    </jsp:include>
    <!-- Custom styles for this template -->

</head>
<body>
<%
    Order order = (Order) request.getAttribute("order");
    boolean isDone = order.getStatus() == StatusOrder.DONE.ordinal();
    boolean isDelevering = order.getStatus() == StatusOrder.DELIVERING.ordinal();
    boolean isOrdered = order.getStatus() == StatusOrder.ORDERED.ordinal();
    ArrayList<ProductOrderDTO> productOrders = (ArrayList<ProductOrderDTO>) request.getAttribute("productOrders");
    DateTimeFormatter format = DateTimeFormatter.ofPattern("dd-MM-yyyy");
%>
<!--Begin display -->
<div id="result-payment-container">
    <header>
        <jsp:include page="common/menu.jsp">
            <jsp:param name="logged" value="<%=false%>"/>
        </jsp:include>
        <jsp:include page="common/searchBarMenu.jsp"/>
        <jsp:include page="common/head-bottom-page.jsp">
            <jsp:param name="title" value="KẾT QUẢ THANH TOÁN"/>
            <jsp:param name="page" value="Thanh toán thành công"/>
        </jsp:include>
    </header>
    <section class="h-100 gradient-custom">
        <div class="container py-5 h-100">
            <div class="row d-flex justify-content-center align-items-center h-100" style="width: auto">
                <div class="col-lg-10 col-xl-8" style="width:1400px">
                    <div class="card" style="border-radius: 10px;width:1400px;margin-left:-330px">
                        <div class="card-header">
                            <div class="card-body p-4">

                                <div class="d-flex justify-content-between align-items-center">
                                    <div class="d-flex flex-column">
                                        <c:if test="<%=order.getStatus() !=3%>">
                                            <span class="lead fw-normal">Trạng thái đơn hàng của bạn</span>
                                        </c:if>
                                        <c:if test="<%=order.getStatus() ==3%>">
                                            <span class="lead fw-normal">Trạng thái đơn hàng của bạn: <span
                                                    style="color: red;font-weight: bold">Đã hủy</span></span>
                                        </c:if>
                                    </div>
                                </div>
                                <hr class="my-4">

                                <div class="d-flex flex-row justify-content-between align-items-center align-content-center">
                                    <span class='big-dot <%= (isOrdered || isDelevering || isDone) ? "active" : ""%> d-flex justify-content-center align-items-center'><i
                                            class="fa fa-check text-white"></i></span>
                                    <hr class="flex-fill <%= (isDelevering || isDone) ? "active" : ""%> track-line ">
                                    <span
                                            class='d-flex justify-content-center align-items-center big-dot dot <%= (isDelevering || isDone) ? "active" : ""%> '>
                                    <i class="fa fa-check text-white"></i></span>
                                    <hr class="flex-fill <%= isDone ? "active" : ""%>  track-line">
                                    <span
                                            class='d-flex justify-content-center align-items-center big-dot dot <%= isDone  ? "active" : ""%>'>
                                    <i class="fa fa-check text-white"></i></span>
                                </div>

                                <div class="d-flex flex-row justify-content-between align-items-center">
                                    <div class="d-flex flex-column align-items-start"><span class="color-black">Đã đặt hàng</span>
                                    </div>
                                    <div class="d-flex flex-column align-items-center"><span class="color-black">Đang giao hàng</span>
                                    </div>
                                    <div class="d-flex flex-column align-items-end"><span class="color-black">Giao hàng thành công</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="cart-table mt-5 col-12 col-md-8">
                            <table class="table table-bordered" style="width:1365px">
                                <thead>
                                <tr>
                                    <th class="smart-cell">SẢN PHẨM</th>
                                    <th>TÊN</th>
                                    <th>Mẫu</th>
                                    <th>Màu</th>
                                    <th>Số lượng</th>
                                    <th>Tổng</th>
                                </tr>
                                </thead>
                                <tbody class="cart-list">
                                <c:forEach items="<%=productOrders%>" var="cart">
                                    <c:set var="sumPrice" value="${cart.price * cart.amount}" scope="request"/>
                                <tr>
                                    <td><img src="${cart.image}"
                                             class="img-fluid" alt="Phone"></td>
                                    <td><c:out value="${cart.name}"/></td>

                                    <td><c:out value="${(cart.pattern != null) ? cart.pattern : \"Không có\"}"/></td>
                                    <td><c:out value="${(cart.color != null) ? cart.color : \"Không có\"}"/></td>
                                    <td><c:out value="${cart.amount}"/></td>
                                    <td><%= DecimalFormat.getInstance().format(Double.parseDouble(request.getAttribute("sumPrice").toString())) %>
                                        VNĐ
                                    </td>
                                </tr>
                                </c:forEach>

                                <tr>
                                    <td colspan="100" style="text-align: center">
                                        Thời gian đặt hàng thành công: <%= order.getCreatedAt().format(format) %><br>
                                        Thời gian giao hàng dự kiến: <%= order.getEstimateDate().format(format) %>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <jsp:include page="common/footer.jsp"/>
</div>

<jsp:include page="common/tail.jsp"/>
<script src="/assets/payment/jquery-1.11.3.min.js"></script>
</body>
<style>
    .track-line {
        height: 2px !important;
        background-color: darkgray;
        opacity: 1;
    }

    .dot {
        height: 10px;
        width: 10px;
        margin-left: 3px;
        margin-right: 3px;
        margin-top: 0px;
        background-color: darkgray;
        border-radius: 50%;
        display: inline-block
    }

    .big-dot {
        height: 25px;
        width: 25px;
        margin-left: 0px;
        margin-right: 0px;
        margin-top: 0px;
        background-color: darkgray;
        border-radius: 50%;
        display: inline-block;
    }

    .big-dot i {
        font-size: 12px;
    }

    .card-stepper {
        z-index: 0
    }

    .gradient-custom {
        /* fallback for old browsers */
        background: white;

        /* Chrome 10-25, Safari 5.1-6 */
        /*background: -webkit-linear-gradient(to top left, rgba(205, 156, 242, 1), rgba(246, 243, 255, 1));*/

        /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
        /*background: linear-gradient(to top left, rgba(205, 156, 242, 1), rgba(246, 243, 255, 1))*/
    }

    .active {
        background-color: red;
    }
</style>
</html>
