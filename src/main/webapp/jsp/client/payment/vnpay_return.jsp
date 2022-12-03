<%@page import="java.net.URLEncoder"%>
<%@page import="java.nio.charset.StandardCharsets"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="java.util.Iterator"%>
<%@page import="java.util.Collections"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Enumeration"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@ page import="Payment.Config" %>

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
            //Begin process return from VNPAY
            Map fields = new HashMap();
            for (Enumeration params = request.getParameterNames(); params.hasMoreElements();) {
                String fieldName = URLEncoder.encode((String) params.nextElement(), StandardCharsets.US_ASCII.toString());
                String fieldValue = URLEncoder.encode(request.getParameter(fieldName), StandardCharsets.US_ASCII.toString());
                if ((fieldValue != null) && (fieldValue.length() > 0)) {
                    fields.put(fieldName, fieldValue);
                }
            }

            String vnp_SecureHash = request.getParameter("vnp_SecureHash");
            if (fields.containsKey("vnp_SecureHashType")) {
                fields.remove("vnp_SecureHashType");
            }
            if (fields.containsKey("vnp_SecureHash")) {
                fields.remove("vnp_SecureHash");
            }
            String signValue = Config.hashAllFields(fields);

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
                        <label >TransId:</label>
                        <label><%=request.getParameter("vnp_TxnRef")%></label>
                    </div>
                    <div class="form-group">
                        <label >Amount:</label>
                        <label><%=request.getParameter("vnp_Amount")%></label>
                    </div>
                    <div class="form-group">
                        <label >Order info:</label>
                        <label><%=request.getParameter("vnp_OrderInfo")%></label>
                    </div>
                    <div class="form-group">
                        <label >Response Code (vnp_ResponseCode):</label>
                        <label><%=request.getParameter("vnp_ResponseCode")%></label>
                    </div>
                    <div class="form-group">
                        <label >VNPAY TransId:</label>
                        <label><%=request.getParameter("vnp_TransactionNo")%></label>
                    </div>
                    <div class="form-group">
                        <label >Bank Code:</label>
                        <label><%=request.getParameter("vnp_BankCode")%></label>
                    </div>
                    <div class="form-group">
                        <label >Pay Date:</label>
                        <label><%=request.getParameter("vnp_PayDate")%></label>
                    </div>
                    <div class="form-group">
                        <label >Payment Status:</label>
                        <label>
                            <%
                                if (signValue.equals(vnp_SecureHash)) {
                                    if ("00".equals(request.getParameter("vnp_TransactionStatus"))) {
                                        System.out.print("Success");
                                    } else {
                                        System.out.print("Failed");
                                    }

                                } else {
                                    System.out.print("invalid signature");
                                }
                            %></label>
                    </div>
                </div>

            </div>
            <jsp:include page="../common/footer.jsp"/>
        </div>

        <jsp:include page="../common/tail.jsp"/>
        <script src="/assets/payment/jquery-1.11.3.min.js"></script>
    </body>
</html>
