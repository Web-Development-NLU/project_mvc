<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="Model.Order" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <jsp:include page="../common/head.jsp">
            <jsp:param name="title" value="FURNITURE | KẾT QUẢ THANH TOÁN"/>
        </jsp:include>
        <!-- Custom styles for this template -->

    </head>
    <body>
        <%
            Order order = (Order) request.getAttribute("order");
        %>
        <!--Begin display -->
        <div id="result-payment-container">
            <header>
                <jsp:include page="../common/menu.jsp">
                    <jsp:param name="logged" value="<%=false%>"/>
                </jsp:include>
                <jsp:include page="../common/searchBarMenu.jsp"/>
                <jsp:include page="../common/head-bottom-page.jsp">
                    <jsp:param name="title" value="KẾT QUẢ THANH TOÁN"/>
                    <jsp:param name="page" value="payment_done"/>
                </jsp:include>
            </header>
            <div class="container mt-5 mb-5">
                <div class="header clearfix">
                    <h3 class="text-muted">VNPAY RESPONSE</h3>
                </div>
                <div class="table-responsive">
                    <div class="form-group">
                        <label >Mã đơn hàng:</label>
                        <label><%=order.getId()%></label>
                    </div>
                    <div class="form-group">
                        <label >Mã giao dịch VNPAY:</label>
                        <label><%=order.getTransID()%></label>
                    </div>
                    <div class="form-group">
                        <label >Tên khách hàng:</label>
                        <label><%=order.getUsername()%></label>
                    </div>
                    <div class="form-group">
                        <label>Quốc gia:</label>
                        <label><%=order.getCountry()%></label>
                    </div>
                    <div class="form-group">
                        <label >Thành phố:</label>
                        <label><%=order.getCity()%></label>
                    </div>
                    <div class="form-group">
                        <label >Quận/Huyện:</label>
                        <label><%=order.getDistrict()%></label>
                    </div>
                    <div class="form-group">
                        <label >Số điện thoại:</label>
                        <label><%=order.getPhone()%></label>
                    </div>
                    <div class="form-group">
                        <label >Email:</label>
                        <label><%=order.getEmail()%></label>
                    </div>
                </div>

            </div>
            <jsp:include page="../common/footer.jsp"/>
        </div>

        <jsp:include page="../common/tail.jsp"/>
        <script src="/assets/payment/jquery-1.11.3.min.js"></script>
    </body>
</html>
