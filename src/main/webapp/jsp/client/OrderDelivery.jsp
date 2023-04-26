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
<%--<%--%>
<%--    ArrayList<CartDTO> carts = (ArrayList<CartDTO>) request.getAttribute("carts");--%>
<%--    double sumPrice = 0;--%>

<%--    for(CartDTO cart: carts) {--%>
<%--        sumPrice += cart.getPrice() * cart.getAmount();--%>
<%--    }--%>

<%--%>--%>
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
            <div class="cart-menu_item">GIỎ HÀNG</div>
            <div class="cart-menu_item">NHẬP THÔNG TIN</div>
            <div class="cart-menu_item">THANH TOÁN</div>
            <div class="cart-menu_item selected">TRẠNG THÁI ĐƠN HÀNG</div>
        </div>
    </section>
</div>
<%--        <c:choose>--%>
<%--            <c:when test="<%= carts.isEmpty() %>">--%>
<%--                <div class="card-store-empty-container">--%>
<%--                    <div class="card-store-swap">--%>
<%--                        <div class="content-area">--%>
<%--                            <p>GIỎ HÀNG CỦA BẠN ĐANG TRỐNG</p>--%>
<%--                            <div class="btn-return-shop">--%>
<%--                                <span><a class="btn-text-lg bgr-black hover-bg-red" href="/product">TRỞ VỀ CỬA HÀNG</a></span>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </c:when>--%>
<%--            <c:otherwise>--%>
<%--            </c:otherwise>--%>
<%--        </c:choose>--%>

    <section class="h-100 gradient-custom" >
        <div class="container py-5 h-100">
            <div class="row d-flex justify-content-center align-items-center h-100" style="width: auto" >
                <div class="col-lg-10 col-xl-8" style="width:1400px">
                    <div class="card" style="border-radius: 10px;width:1400px;margin-left:-330px">
                        <div class="card-header">
                            <div class="card-body p-4">

                                <div class="d-flex justify-content-between align-items-center">
                                    <div class="d-flex flex-column">
                                        <span class="lead fw-normal">Trạng thái đơn hàng của bạn</span>
                                    </div>
                                    <div>
                                        <button class="btn btn-outline-primary" type="button"><i class="bi bi-bag"></i> Giỏ hàng</button>
                                    </div>
                                </div>
                                <hr class="my-4">

                                <div class="d-flex flex-row justify-content-between align-items-center align-content-center">
                                    <span class="big-dot active d-flex justify-content-center align-items-center"><i class="fa fa-check text-white"></i></span>
                                    <hr class="flex-fill track-line"><span
                                        class="d-flex justify-content-center align-items-center big-dot dot">
                                <i class="fa fa-check text-white"></i></span>
                                    <hr class="flex-fill track-line"><span
                                        class="d-flex justify-content-center align-items-center big-dot dot">
                                <i class="fa fa-check text-white"></i></span>
                                </div>

                                <div class="d-flex flex-row justify-content-between align-items-center">
                                    <div class="d-flex flex-column align-items-start"><a class="nav-link" type="button" href="Ordering.html"><span>Đã đặt hàng</span></a></div>
                                    <div class="d-flex flex-column align-items-center"><a class="nav-link" type="button" href="OrderDelivery.html"><span>Đang giao hàng</span></a></div>
                                    <div class="d-flex flex-column align-items-end"><a class="nav-link" type="button" href="DeliverySuccess.html"><span>Giao hàng thành công</span></a></div>
                                </div>
                            </div>
                        </div>
                        <div class="card-body p-4">
                            <div class="card shadow-0 border mb-4">
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-md-2">
                                            <img src="https://mdbcdn.b-cdn.net/img/Photos/Horizontal/E-commerce/Products/13.webp"
                                                 class="img-fluid" alt="Phone">
                                        </div>
                                        <div class="col-md-2 text-center d-flex justify-content-center align-items-center">
                                            <p class="text-muted mb-0">Tên sản phẩm: Ghế</p>
                                        </div>
                                        <div class="col-md-2 text-center d-flex justify-content-center align-items-center">
                                            <p class="text-muted mb-0 small">Mẫu: Phương tây</p>
                                        </div>
                                        <div class="col-md-2 text-center d-flex justify-content-center align-items-center">
                                            <p class="text-muted mb-0 small">Màu: trắng</p>
                                        </div>
                                        <div class="col-md-2 text-center d-flex justify-content-center align-items-center">
                                            <p class="text-muted mb-0 small">Số lượng: 1</p>
                                        </div>
                                        <div class="col-md-2 text-center d-flex justify-content-center align-items-center">
                                            <p class="text-muted mb-0 small">45000 VND</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="card shadow-0 border mb-4">
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-md-2">
                                            <img src="https://mdbcdn.b-cdn.net/img/Photos/Horizontal/E-commerce/Products/1.webp"
                                                 class="img-fluid" alt="Phone">
                                        </div>
                                        <div class="col-md-2 text-center d-flex justify-content-center align-items-center">
                                            <p class="text-muted mb-0">Tên sản phẩm: Ghế</p>
                                        </div>
                                        <div class="col-md-2 text-center d-flex justify-content-center align-items-center">
                                            <p class="text-muted mb-0 small">Pink rose</p>
                                        </div>
                                        <div class="col-md-2 text-center d-flex justify-content-center align-items-center">
                                            <p class="text-muted mb-0 small">Capacity: 32GB</p>
                                        </div>
                                        <div class="col-md-2 text-center d-flex justify-content-center align-items-center">
                                            <p class="text-muted mb-0 small">Qty: 1</p>
                                        </div>
                                        <div class="col-md-2 text-center d-flex justify-content-center align-items-center">
                                            <p class="text-muted mb-0 small">$399</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="card shadow-0 border mb-4">
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-md-2">
                                            <img src="https://mdbcdn.b-cdn.net/img/Photos/Horizontal/E-commerce/Products/1.webp"
                                                 class="img-fluid" alt="Phone">
                                        </div>
                                        <div class="col-md-2 text-center d-flex justify-content-center align-items-center">
                                            <p class="text-muted mb-0">Tên sản phẩm: Ghế</p>
                                        </div>
                                        <div class="col-md-2 text-center d-flex justify-content-center align-items-center">
                                            <p class="text-muted mb-0 small">Pink rose</p>
                                        </div>
                                        <div class="col-md-2 text-center d-flex justify-content-center align-items-center">
                                            <p class="text-muted mb-0 small">Capacity: 32GB</p>
                                        </div>
                                        <div class="col-md-2 text-center d-flex justify-content-center align-items-center">
                                            <p class="text-muted mb-0 small">Qty: 1</p>
                                        </div>
                                        <div class="col-md-2 text-center d-flex justify-content-center align-items-center">
                                            <p class="text-muted mb-0 small">$399</p>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
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
        .active{
            background-color: red;
        }
    </style>

    <jsp:include page="common/footer.jsp"/>
<jsp:include page="common/tail.jsp"/>
</body>
</html>
