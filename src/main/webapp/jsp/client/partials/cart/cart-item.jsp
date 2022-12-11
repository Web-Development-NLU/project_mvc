<%@ page import="java.text.DecimalFormat" %><%--
  Created by IntelliJ IDEA.
  User: Quang Tho
  Date: 03/12/2022
  Time: 14:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<%
    int price = (int) Double.parseDouble(request.getParameter("price"));
    String name = request.getParameter("name");
    int amount = Integer.parseInt(request.getParameter("amount"));
    String pattern = request.getParameter("pattern");
    String color = request.getParameter("color");
    String size = request.getParameter("size");
%>
<tr class="cart-item">
    <td class="cart-item_img"><img
            src="https://caston.familab.net/wp-content/uploads/2021/09/product_pilke-18-natural-birch-with-light-hr_2-420x420.jpg">
    </td>
    <td>
        <div><a href="#"><h4><%=name%></h4></a></div>
        <c:if test="<%= !pattern.isEmpty() %>">
            <div class="mb-1"><%=pattern%></div>
        </c:if>
        <c:if test="<%= !color.isEmpty() %>">
            <div class="mb-1"><%=color%></div>
        </c:if>
        <c:if test="<%= !size.isEmpty() %>">
            <div class="mb-1"><%=size%></div>
        </c:if>
    </td>
    <td class="cart-price">
        <div class="card-price">
            <span class="current-price"><%=DecimalFormat.getIntegerInstance().format(price)%> VNĐ</span>
        </div>
    </td>
    <td>
        <div class="product_number">
            <form action="${pageContext.request.contextPath}/cart" method="post">
                <input name="id" value="<%= request.getParameter("id")%>" class="d-none">
                <input type="number" class="input-number" name="amount" value="<%=amount%>"
                       onchange="this.form.submit()">
            </form>
        </div>
    </td>
    <td class="cart_sum-price">
        <form action="${pageContext.request.contextPath}/cart" method="post">
            <input name="id" value="<%= request.getParameter("id")%>" class="d-none">
            <button class="btn-text color-red" name="action" value="DELETE"><i class="fa-sharp fa-solid fa-trash"></i>
            </button>
        </form>
    </td>
</tr>
