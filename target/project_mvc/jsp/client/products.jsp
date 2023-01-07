<%@ page import="java.util.ArrayList" %>
<%@ page import="Model.Product" %>
<%@ page import="Model.Category" %>
<%@ page import="Model.Color" %>
<%@ page import="Model.Pattern" %>
<%@ page import="java.text.DecimalFormat" %><%--
  Created by IntelliJ IDEA.
  User: Quang Tho
  Date: 01/12/2022
  Time: 12:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored = "false" %>
<html>
<head>
    <jsp:include page="common/head.jsp">
      <jsp:param name="title" value="FUNITURE | SẢN PHẨM"/>
    </jsp:include>
</head>
<body>
<%
    ArrayList<Product> products = (ArrayList<Product>) request.getAttribute("products");
    int pagination = (int) request.getAttribute("pagination");
    String numPage = DecimalFormat.getIntegerInstance().format(Double.parseDouble(request.getAttribute("numPage").toString()));
    int totalPage = Integer.parseInt(numPage);
%>
    <div id="shop-container">
        <header>
            <jsp:include page="common/menu.jsp"/>
            <jsp:include page="common/searchBarMenu.jsp"/>
            <jsp:include page="partials/products/headSearch.jsp"/>
        </header>
        <jsp:include page="common/filterProducts.jsp"/>
        <div class="products-container">
            <div class="products">
                <div class="container-fluid">
                    <div class="product-list row mb-5 ">
                        <c:forEach items="<%=products%>" var="product">
                            <jsp:include page="common/card.jsp">
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
                <jsp:include page="common/pagination.jsp">
                    <jsp:param name="path" value="products"/>
                    <jsp:param name="number" value="<%= totalPage %>"/>
                    <jsp:param name="active" value="${pagination}"/>
                </jsp:include>
            </div>
        </div>
        <jsp:include page="common/footer.jsp"/>
    </div>

    <jsp:include page="common/tail.jsp"/>
</body>
</html>
