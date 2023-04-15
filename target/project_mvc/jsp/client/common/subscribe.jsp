<%--
  Created by IntelliJ IDEA.
  User: Quang Tho
  Date: 01/12/2022
  Time: 11:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<%
    String pointer = request.getParameter("page");
    String param = (pointer == null) ? "" : "?page=" + pointer;
%>
<div class="subscribe-section container-fluid">
    <div class="subscribe-section_title">
        Bạn cần tư vấn bất cứ điều gì <br> hãy để lại email của bạn
    </div>
    <form action="${pageContext.request.contextPath}/customer<%=param%>" method="post">
        <div class="input-line">
            <input type="email" name="email" placeholder="Địa chỉ email của bạn" required>
            <button type="submit">GỬI
                <i class="fa-solid fa-chevron-right"></i>
            </button>
        </div>
    </form>
</div>