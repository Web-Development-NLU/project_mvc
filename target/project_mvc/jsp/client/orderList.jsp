<%@ page import="java.util.ArrayList" %>
<%@ page import="Model.Order" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<%--
  Created by IntelliJ IDEA.
  User: zxc
  Date: 30/Dec/22
  Time: 12:08 PM
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
<%
    ArrayList<Order> orders = (ArrayList<Order>) request.getAttribute("orders");
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
        <div class="cart-place">
            <div class="cart-table mt-5">
                <table class="table table-bordered">
                    <thead>
                    <tr>
                        <th>ID</th>
                        <th>Thông tin chi tiết</th>
                        <th>Ngày tạo</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="<%= orders %>" var="order">
                        <tr style="border-bottom: 1px solid #DEE2E6">
                            <td style="border-right: 1px solid #DEE2E6"><a href="${pageContext.request.contextPath}/orderDetail?id=${order.id}">${order.id}</a></td>
                            <td style="border-right: 1px solid #DEE2E6">${order.info}</td>
                            <td style="border-left: 1px solid #DEE2E6">${order.createdAt}</td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </section>

    <jsp:include page="common/footer.jsp"/>
</div>
<jsp:include page="common/tail.jsp"/>
</body>
</html>
