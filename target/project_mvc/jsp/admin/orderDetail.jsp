<%@ page import="DTO.ProductOrderDTO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page import="java.text.DecimalFormat" %>
<%@ page import="Model.*" %><%--
  Created by IntelliJ IDEA.
  User: zxc
  Date: 06/Jan/23
  Time: 7:25 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<html
        lang="en"
        class="light-style layout-menu-fixed"
        dir="ltr"
        data-theme="theme-default"
        data-assets-path="../assets/"
        data-template="vertical-menu-template-free"
>
<head>
    <meta charset="utf-8"/>
    <meta
            name="viewport"
            content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0"/>

    <title>Chi tiết đơn hàng</title>

    <meta name="description" content=""/>

    <!-- Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com"/>
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin/>
    <link
            href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap"
            rel="stylesheet"
    />

    <!-- Icons. Uncomment required icon fonts -->
    <link rel="stylesheet" href="../assets/vendor/fonts/boxicons.css"/>

    <!-- Core CSS -->
    <link rel="stylesheet" href="../assets/vendor/css/style.css">
    <!-- Vendors CSS -->
    <link rel="stylesheet" href="../assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.css"/>

    <!-- Page CSS -->

    <!-- Helpers -->
    <script src="../assets/vendor/js/helpers.js"></script>

    <script src="../assets/js_admin/config.js"></script>
</head>
<body>
<%
    Order order = request.getAttribute("order") != null ? (Order) request.getAttribute("order")
            : new Order();
    ArrayList<ProductOrderDTO> productOrders = request.getAttribute("productOrders")
            != null ? (ArrayList<ProductOrderDTO>) request.getAttribute("productOrders") : new ArrayList<ProductOrderDTO>();
    DateTimeFormatter format = DateTimeFormatter.ofPattern("dd-MM-yyyy");
    boolean isDone = order.getStatus() == StatusOrder.DONE.ordinal();
    boolean isDelevering = order.getStatus() == StatusOrder.DELIVERING.ordinal();
    boolean isOrdered = order.getStatus() == StatusOrder.ORDERED.ordinal();

%>
<!-- Layout wrapper -->
<div class="layout-wrapper layout-content-navbar">
    <div class="layout-container">
        <!-- Menu -->

        <jsp:include page="common/menu.jsp"/>
        <!-- / Menu -->

        <!-- Layout container -->
        <div class="layout-page">
            <!-- Navbar -->

            <jsp:include page="common/navbar.jsp"/>

            <!-- / Navbar -->

            <!-- Content wrapper -->
            <div class="content-wrapper">
                <!-- Content -->
                <div class="container-xxl flex-grow-1 container-p-y">
                    <h4 class="fw-bold py-3 mb-4"><span class="text-muted fw-light">Đơn hàng /</span> Chi tiết đơn hàng
                    </h4>
                    <div class="container mt-5 mb-5" style="margin-top: 0.5rem !important;">
                        <section class="h-100 gradient-custom">
                            <div class="container py-5 h-100">

                                <div class="card-header">
                                    <div class="card-body p-4">

                                        <div class="d-flex justify-content-between align-items-center">
                                            <div class="d-flex flex-column">
                                                <span class="lead fw-normal">Trạng thái đơn hàng của bạn </span>
                                            </div>
                                        </div>
                                        <hr class="my-4">

                                        <div class="d-flex flex-row justify-content-between align-items-center align-content-center">
                                            <span class="big-dot  d-flex justify-content-center align-items-center <%= (isOrdered || isDelevering || isDone) ? "active" : ""%>"><i
                                                    class="fa fa-check text-white"></i></span>
                                            <hr class="flex-fill track-line <%= (isDelevering || isDone) ? "active" : ""%>">
                                            <span
                                                    class="d-flex justify-content-center align-items-center big-dot dot <%= (isDelevering || isDone) ? "active" : ""%>">
                                                                    <i class="fa fa-check text-white"></i></span>
                                            <hr class="flex-fill track-line <%= isDone ? "active" : ""%> ">
                                            <span
                                                    class="d-flex justify-content-center align-items-center big-dot dot <%= isDone ? "active" : ""%> ">
                                                                    <i class="fa fa-check text-white"></i></span>
                                        </div>

                                        <div class="d-flex flex-row justify-content-between align-items-center">
                                            <div class="d-flex flex-column align-items-start"><span class="color-black">Đã đặt hàng</span>
                                            </div>
                                            <div class="d-flex flex-column align-items-center"><span
                                                    class="color-black">Đang giao hàng</span></div>
                                            <div class="d-flex flex-column align-items-end"><span class="color-black">Giao hàng thành công</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="cart-table mt-5 col-12 col-md-8">
                                    <table class="table table-bordered" style="width: 950px;margin-left: 50px">
                                        <thead>
                                        <tr>
                                            <th>Mã đơn hàng</th>
                                            <td><%=order.getId()%>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>Tên khách hàng</th>
                                            <td><%=order.getUsername()%>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>Số điện thoại</th>
                                            <td><%=order.getPhone()%>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>Địa chỉ</th>
                                            <td><%=order.getCountry()%>-<%=order.getCity()%>-<%=order.getDistrict()%>
                                            </td>
                                        </tr>
                                            <% for(int i=0; i < productOrders.size();i++){
                                            Product product = (Product) request.getAttribute("product"+productOrders.get(i).getProductId());
                                        %>
                                        <tr>
                                            <th style="font-weight: bold">Tên sản phẩm</th>
                                            <td><%=product.getName()%>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>Mẫu</th>
                                            <td><%=productOrders.get(i).getPattern() != null ? productOrders.get(i).getPattern() : "Không có"%>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>Màu</th>
                                            <td><%=productOrders.get(i).getColor() != null ? productOrders.get(i).getColor() : "Không có"%>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>Giá</th>
                                            <td><%=DecimalFormat.getInstance().format(productOrders.get(i).getPrice()) %>
                                                VNĐ
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>Số lượng</th>
                                            <td><%=productOrders.get(i).getAmount()%>
                                            </td>
                                        </tr>
                                            <%} %>

                                        <tr>
                                            <th>Tống</th>
                                            <td><%=DecimalFormat.getInstance().format(order.getPrice())%> VNĐ</td>
                                        </tr>
                                        <c:if test="<%=order.getStatus()==3%>">
                                        <tr>
                                            <th>Trạng thái</th>
                                            <td style="color: red; font-weight: bold">Đã hủy</td>
                                        </tr>
                                        </c:if>
                                        <tr>
                                            <td colspan="100" style="text-align: center">
                                                Thời gian đặt hàng thành công: <%=order.getCreatedAt().format(format)%>
                                                <br>
                                                Thời gian giao hàng dự
                                                kiến: <%= order.getEstimateDate() != null ? order.getEstimateDate().format(format) : "" %>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                                <div style="display: flex; gap: 30px; margin-left: 740px">
                                    <c:if test="<%=order.getStatus()<2%>">
                                        <form method="post"
                                              action="${pageContext.request.contextPath}/admin/adminOrderDetail?id=<%=order.getId()%>">
                                            <input type="hidden" name="action" value="cancel">
                                            <button type="submit" class="btn btn-outline-dark"
                                            >Hủy đơn hàng
                                            </button>
                                        </form>
                                    </c:if>
                                    <c:if test="<%=order.getStatus()>0 && order.getStatus()!=3%>">
                                        <form method="post"
                                              action="${pageContext.request.contextPath}/admin/adminOrderDetail?id=<%=order.getId()%>">
                                            <input type="hidden" name="action" value="back">
                                            <input type="hidden" name="status" value="<%=order.getStatus()%>">
                                            <button type="submit" class="btn btn-outline-dark"
                                            >Quay lại
                                            </button>
                                        </form>
                                    </c:if>
                                    <c:if test="<%=order.getStatus()<2%>">
                                        <form method="post"
                                              action="${pageContext.request.contextPath}/admin/adminOrderDetail?id=<%=order.getId()%>">
                                            <input type="hidden" name="action" value="next">
                                            <input type="hidden" name="status" value="<%=order.getStatus()%>">
                                            <button type="submit" class="btn btn-outline-dark"
                                            >Xác
                                                nhận
                                            </button>
                                        </form>
                                    </c:if>
                                </div>
                            </div>
                        </section>
                        <!-- Footer -->
                        <footer class="content-footer footer bg-footer-theme">
                            <div class="container-xxl d-flex flex-wrap justify-content-between py-2 flex-md-row flex-column">
                                <div class="mb-2 mb-md-0">
                                    ©
                                    <script>
                                        document.write(new Date().getFullYear());
                                    </script>
                                    <a href="https://themeselection.com" target="_blank"
                                       class="footer-link fw-bolder"></a>
                                </div>

                            </div>
                        </footer>
                        <!-- / Footer -->

                        <div class="content-backdrop fade"></div>
                    </div>
                    <!-- Content wrapper -->
                </div>
                <!-- / Layout page -->
            </div>

            <!-- Overlay -->
            <div class="layout-overlay layout-menu-toggle"></div>
        </div>


        <!-- Core JS -->
        <!-- build:js assets/vendor/js/core.js -->
        <script src="/assets/vendor/libs/jquery/jquery.js"></script>
        <script src="/assets/vendor/libs/popper/popper.js"></script>
        <script src="/assets/vendor/js/bootstrap.js"></script>
        <script src="/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>
        <script type="text/javascript"
                src="https://cdnjs.cloudflare.com/ajax/libs/chosen/1.8.7/chosen.jquery.min.js"></script>
        <script src="/assets/vendor/js/menu.js"></script>
        <script src="/assets/js/upload.js"></script>
        <!-- endbuild -->

        <!-- Vendors JS -->

        <!-- Main JS -->
        <script src="/assets/js_admin/main.js"></script>
        <script>
            $(".chosen-select").chosen({
                allow_single_deselect: true,
                width: '50%',
                no_results_text: "Không tìm thấy kết quả :"
            })
        </script>
        <!-- Page JS -->

        <!-- Place this tag in your head or just before your close body tag. -->
        <script async defer src="https://buttons.github.io/buttons.js"></script>
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
