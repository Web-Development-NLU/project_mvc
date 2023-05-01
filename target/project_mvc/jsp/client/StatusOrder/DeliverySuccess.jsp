<%@ page import="java.util.ArrayList" %>
<%@ page import="DTO.CartDTO" %>
<%@ page import="java.text.DecimalFormat" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<html>
    <head>
        <jsp:include page="../common/head.jsp">
            <jsp:param name="title" value="FURNITURE | GIỎ HÀNG"/>
        </jsp:include>
    </head>
<body>
<div id="cart-container">
    <header>
        <jsp:include page="../common/menu.jsp"/>
        <jsp:include page="../common/searchBarMenu.jsp"/>
        <jsp:include page="../common/head-bottom-page.jsp">
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
                                </div>
                                <hr class="my-4">

                                <div class="d-flex flex-row justify-content-between align-items-center align-content-center">
                                    <span class="big-dot active d-flex justify-content-center align-items-center"><i class="fa fa-check text-white"></i></span>
                                    <hr class="flex-fill track-line active"><span
                                        class="d-flex justify-content-center align-items-center big-dot dot active">
                                <i class="fa fa-check text-white"></i></span>
                                    <hr class="flex-fill track-line active"><span
                                        class="d-flex justify-content-center align-items-center big-dot dot active">
                                <i class="fa fa-check text-white"></i></span>
                                </div>

                                <div class="d-flex flex-row justify-content-between align-items-center">
                                    <div class="d-flex flex-column align-items-start"><a class="nav-link" type="button" href="${pageContext.request.contextPath}/Ordered"><span class="color-black">Đã đặt hàng</span></a></div>
                                    <div class="d-flex flex-column align-items-center"><a class="nav-link" type="button" href="${pageContext.request.contextPath}/OrderDelivery"><span class="color-black">Đang giao hàng</span></a></div>
                                    <div class="d-flex flex-column align-items-end"><a class="nav-link" type="button" href="${pageContext.request.contextPath}/DeliverySuccess"><span class="color-black">Giao hàng thành công</span></a></div>
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
                                <tr>
                                    <td><img src="https://mdbcdn.b-cdn.net/img/Photos/Horizontal/E-commerce/Products/13.webp"
                                             class="img-fluid" alt="Phone"></td>
                                    <td>Maria Anders</td>
                                    <td>Germany</td>
                                    <td>Alfreds Futterkiste</td>
                                    <td>Maria Anders</td>
                                    <td>Germany</td>
                                </tr>
                                <tr>
                                    <td colspan="100" style="text-align: center">
                                        Thời gian giao hàng dự kiến: 15-12-2023 đến 20-12-2023
                                    </td>
                                </tr>
                                <tr>
                                    <td><img src="https://mdbcdn.b-cdn.net/img/Photos/Horizontal/E-commerce/Products/1.webp"
                                             class="img-fluid" alt="Phone"></td>
                                    <td>Maria Anders</td>
                                    <td>Germany</td>
                                    <td>Alfreds Futterkiste</td>
                                    <td>Maria Anders</td>
                                    <td>Germany</td>
                                </tr>
                                <tr>
                                    <td colspan="100" style="text-align: center">
                                        Thời gian giao hàng dự kiến: 15-12-2023 đến 20-12-2023
                                    </td>
                                </tr>
                                
                            </table>
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

    <jsp:include page="../common/footer.jsp"/>
<jsp:include page="../common/tail.jsp"/>
</body>
</html>
