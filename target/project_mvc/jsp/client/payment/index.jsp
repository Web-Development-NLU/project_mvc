<%@ page import="java.text.DecimalFormat" %><%--
    Document   : index
    Created on : Sep 29, 2015, 7:23:18 PM
    Author     : xonv
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <jsp:include page="../common/head.jsp">
            <jsp:param name="title" value="FURNITURE | THANH TOÁN"/>
        </jsp:include>
    </head>
    <%
        int sumPrice = (int) request.getAttribute("sumPrice");
        String name = request.getAttribute("name").toString();
    %>
    <body style="padding: 0">
        <div id="payment-container">
            <header>
                <jsp:include page="../common/menu.jsp">
                    <jsp:param name="logged" value="<%= false %>"/>
                </jsp:include>
                <jsp:include page="../common/searchBarMenu.jsp"/>
                <jsp:include page="../common/head-bottom-page.jsp">
                    <jsp:param name="title" value="Thanh Toán"/>
                    <jsp:param name="page" value="payment"/>
                </jsp:include>
            </header>
            <div class="container mt-5 mb-5">
                <section id="checkout-content" class="container-fluid mb-5">
                    <div class="cart-menu">
                        <div class="cart-menu_item">GIỎ HÀNG</div>
                        <div class="cart-menu_item">NHẬP THÔNG TIN </div>
                        <div class="cart-menu_item selected">THANH TOÁN</div>
                    </div>
                    <div class="checkout-other-action mt-5 mb-5">
                        <div class="action-link">
                            <i class="fa-regular fa-user action-icon"></i>
                            RETURNING CUSTOMER?
                            <a href="#" class="action-content">CLICK HERE TO LOGIN</a>
                        </div>
                    </div>

                    <ul class="nav nav-tabs" id="myTab" role="tablist">
                        <li class="nav-item" role="presentation">
                            <button class="nav-link active" id="credit-tab" data-toggle="tab" data-target="#credit" type="button" role="tab" aria-controls="credit" aria-selected="true">Thanh toán ngay</button>
                        </li>
                        <li class="nav-item" role="presentation">
                            <button class="nav-link" id="cod-tab" data-toggle="tab" data-target="#cod" type="button" role="tab" aria-controls="cod" aria-selected="false">Thanh toán khi nhận hàng</button>
                        </li>
                    </ul>
                    <div class="tab-content" id="myTabContent">
                        <div class="tab-pane fade show active" id="credit" role="tabpanel" aria-labelledby="credit-tab">
                            <h3 class="mt-5">Thanh Toán đơn hàng</h3>
                            <div class="table-responsive">
                                <form action="${pageContext.request.contextPath}/vnpayajax" id="frmCreateOrder" method="post">
                                    <div class="form-group">
                                        <label for="language">Loại thanh toán </label>
                                        <select name="ordertype" id="ordertype" class="form-control">
                                            <option value="billpayment">Thanh toán hóa đơn</option>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label for="amount">Số tiền</label>
                                        <input class="form-control" data-val="true" data-val-number="The field Amount must be a number." data-val-required="The Amount field is required." id="amount" max="100000000" min="1" type="number" name="amount" value="<%= sumPrice %>" readonly/>
                                    </div>
                                    <div class="form-group">
                                        <%--@declare id="orderdescription"--%><label for="OrderDescription">Nội dung thanh toán</label>
                                        <textarea class="form-control" cols="20" id="vnp_OrderInfo" name="vnp_OrderInfo" rows="2"><%= name %></textarea>
                                    </div>
                                    <div class="form-group">
                                        <label for="bankcode">Ngân hàng</label>
                                        <select name="bankcode" id="bankcode" class="form-control">
                                            <option value="">Không chọn </option>
                                            <option value="VNPAYQR">VNPAYQR</option>
                                            <option value="MBAPP">MBAPP</option>
                                            <option value= "INTCARD">INTCARD</option>
                                            <option value= "VNBANK">VNBANK</option>
                                            <option value= "VNPAYEWALLET">VNPAYEWALLET</option>
                                            <option value="NCB">  	Ngan hang NCB</option>
                                            <option value="SACOMBANK">Ngan hang SacomBank  </option>
                                            <option value="EXIMBANK"> 	Ngan hang EximBank </option>
                                            <option value="MSBANK"> 	Ngan hang MSBANK </option>
                                            <option value="NAMABANK"> 	Ngan hang NamABank </option>
                                            <option value="VISA">  	Thanh toan qua VISA/MASTER</option>
                                            <option value="VNMART">  	Vi dien tu VnMart</option>
                                            <option value="VIETINBANK">Ngan hang Vietinbank  </option>
                                            <option value="VIETCOMBANK"> 	Ngan hang VCB </option>
                                            <option value="HDBANK">Ngan hang HDBank</option>
                                            <option value="DONGABANK">  	Ngan hang Dong A</option>
                                            <option value="TPBANK"> 	Ngân hàng TPBank </option>
                                            <option value="OJB">  	Ngân hàng OceanBank</option>
                                            <option value="BIDV"> Ngân hàng BIDV </option>
                                            <option value="TECHCOMBANK"> 	Ngân hàng Techcombank </option>
                                            <option value="VPBANK"> 	Ngan hang VPBank </option>
                                            <option value="AGRIBANK"> 	Ngan hang Agribank </option>
                                            <option value="MBBANK"> 	Ngan hang MBBank </option>
                                            <option value="ACB"> Ngan hang ACB </option>
                                            <option value="OCB"> Ngan hang OCB </option>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label for="language">Ngôn ngữ</label>
                                        <select name="language" id="language" class="form-control">
                                            <option value="vn">Tiếng Việt</option>
                                            <option value="en">English</option>
                                        </select>
                                    </div>
                                    <button type="submit" class="btn btn-text bgr-black">Thanh toán</button>
                                </form>
                            </div>
                        </div>
                        <div class="tab-pane fade" id="cod" role="tabpanel" aria-labelledby="cod-tab">
                            <form action="${pageContext.request.contextPath}/codOrder">
                                <button type="submit" class="btn btn-text bgr-black">Đặt hàng</button>
                            </form>
                        </div>
                    </div>

                </section>

            </div>

            <jsp:include page="../common/footer.jsp"/>
        </div>
        <jsp:include page="../common/tail.jsp"/>
        <script src="${pageContext.request.contextPath}/assets/payment/jquery-1.11.3.min.js"></script>
        <link href="https://pay.vnpay.vn/lib/vnpay/vnpay.css" rel="stylesheet" />
        <script src="https://pay.vnpay.vn/lib/vnpay/vnpay.min.js"></script>
        <script type="text/javascript">
            $("#frmCreateOrder").submit(function () {
                var postData = $("#frmCreateOrder").serialize();
                var submitUrl = $("#frmCreateOrder").attr("action");
                $.ajax({
                    type: "POST",
                    url: submitUrl,
                    data: postData,
                    dataType: 'JSON',
                    success: function (x) {
                        if (x.code === '00') {
                            if (window.vnpay) {
                                vnpay.open({width: 768, height: 600, url: x.data});
                            } else {
                                location.href = x.data;
                            }
                            return false;
                        } else {
                            alert(x.Message);
                        }
                    }
                });
                return false;
            });
        </script>

    </body>
</html>
