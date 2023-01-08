<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="Model.Product" %><%--
  Created by IntelliJ IDEA.
  User: Quang Tho
  Date: 01/12/2022
  Time: 10:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored = "false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  ArrayList<Product> products = (ArrayList<Product>) request.getAttribute("products");
%>
<div class="products-container bgr-white-02">
  <div class="products">
    <div class="product_title monts">Sản phẩm vừa xem</div>
    <div class="container-fluid">
      <div class="product-list row mb-5 ">
        <c:forEach items="<%=products%>" var="product"  >
          <jsp:include page="../../common/card.jsp">
            <jsp:param name="type" value="2"/>
            <jsp:param name="name" value="${product.name}"/>
            <jsp:param name="thumbnails" value="${product.thumbnail}"/>
            <jsp:param name="price" value="${product.price}"/>
            <jsp:param name="id" value="${product.id}"/>
            <jsp:param name="avg" value="${product.avg}"/>
          </jsp:include>
        </c:forEach>
      </div>
    </div>
  </div>
</div>
