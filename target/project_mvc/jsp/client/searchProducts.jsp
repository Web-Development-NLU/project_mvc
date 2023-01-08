<%@ page import="java.util.ArrayList" %>
<%@ page import="Model.Product" %>
<%@ page import="Model.Category" %>
<%@ page import="Model.Color" %>
<%@ page import="Model.Pattern" %>
<%@ page import="java.text.DecimalFormat" %>
<%--
  Created by IntelliJ IDEA.
  User: zxc
  Date: 06/Jan/23
  Time: 11:53 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored = "false" %>
<html
        lang="en"
        class="light-style layout-menu-fixed"
        dir="ltr"
        data-theme="theme-default"
        data-assets-path="/assets/"
        data-template="vertical-menu-template-free"
>
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
    String infoSearch = (request.getParameter("infoSearch") == null) ? "" : "search=" + request.getParameter("infoSearch") + "&";
%>
<div id="shop-container">
    <header>
        <jsp:include page="common/menu.jsp"/>
        <jsp:include page="common/searchBarMenu.jsp"/>
        <jsp:include page="partials/products/headSearch.jsp"/>
    </header>
<%--    <jsp:include page="common/filterProducts.jsp"/>--%>
    <div class="products-container">
        <div class="products">
            <div class="container-fluid">
                <div class="product-list row mb-5 ">
                    <c:choose>
                        <c:when test="<%=products.size() == 0%>">
                            <h5 style="text-align: center; color: #6E8192;display: block;width: 100%">Không tìm được sản phẩm phù hợp</h5>
                        </c:when>
                        <c:otherwise>
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
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
            <jsp:include page="common/pagination.jsp">
                <jsp:param name="path" value="searchProduct"/>
                <jsp:param name="number" value="<%= totalPage %>"/>
                <jsp:param name="active" value="${pagination}"/>
                <jsp:param name="search" value="${infoSearch}"/>
            </jsp:include>
        </div>
    </div>
    <jsp:include page="common/footer.jsp"/>
</div>

<jsp:include page="common/tail.jsp"/>
</div>
</body>
</html>
