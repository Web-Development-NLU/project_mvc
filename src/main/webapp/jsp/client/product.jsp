<%@ page import="Model.Product" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="DTO.StatReview" %><%--
  Created by IntelliJ IDEA.
  User: Quang Tho
  Date: 02/12/2022
  Time: 13:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <jsp:include page="common/head.jsp">
        <jsp:param name="title" value="FURNITURE | SẢN PHẨM"/>
    </jsp:include>
</head>
<body>
<%
    Product product = (Product) request.getAttribute("product");
    String[] thumbnails = product.getThumbnail().split(",");
    ArrayList<Product> relatedProduct = (ArrayList<Product>) request.getAttribute("relatedProducts");
    StatReview statReview = (StatReview) request.getAttribute("statReview");
%>

<div id="container">
    <jsp:include page="common/menu.jsp">
        <jsp:param name="classes" value="menu-white sticky-menu"/>
    </jsp:include>
    <jsp:include page="common/searchBarMenu.jsp"/>
    <div class="head-bottom-breadcrumb">
        <div aria-label="breadcrumb">
            <ol class="breadcrumb color-black">
                <li class="breadcrumb-item monts" aria-current="page"><a href="#" class="color-black">Trang chủ</a></li>
                <li class="breadcrumb-item monts" aria-current="page">Sản phẩm</li>
                <li class="breadcrumb-item monts" aria-current="page">/ <%=product.getName()%></li>

            </ol>
        </div>
    </div>

    <div class="product-container container-fluid">
        <div class="product row">
            <div class="product-images col-md-12 col-lg-7">
                <div class="product-gallery">
                    <c:set var="count" value="1"/>
                    <c:set var="sum" value="<%=thumbnails.length%>"/>
                    <c:forEach items="<%=thumbnails%>" var="thumbnail">
                        <jsp:include page="partials/product/product-gallery-item.jsp">
                            <jsp:param name="img" value="${thumbnail}"/>
                            <jsp:param name="num" value="${count}/${sum}"/>
                        </jsp:include>
                        <c:set var="count" value="${count + 1}"/>
                    </c:forEach>

                </div>
                <div class="gallery-action">
                    <c:forEach items="<%=thumbnails%>" var="thumbnail">
                        <jsp:include page="partials/product/gallery-action-item.jsp">
                            <jsp:param name="img" value="${thumbnail}"/>
                        </jsp:include>
                    </c:forEach>
                </div>
            </div>

            <jsp:include page="partials/product/product-detail.jsp"/>
        </div>
    </div>
    <div class="tabs-container">
        <div class="tabs-info-product container-fluid" id="tab-parent">
            <div class="tab-info-product_list nav nav-tabs" role="tablist">
                <div class="nav-item tab-item active" id="tab-description" role="tab" data-toggle="tab"
                     data-target="#content-des" aria-controls="content-des" aria-selected="true">MÔ TẢ
                </div>
                <div class="nav-item tab-item" id="tab-info" role="tab" data-toggle="tab" data-target="#content-info"
                     aria-controls="content-info" aria-selected="false">THÔNG TIN THÊM
                </div>
                <div class="nav-item tab-item" id="tab-reviews" role="tab" data-toggle="tab"
                     data-target="#content-reviews"
                     aria-controls="content-reviews" aria-selected="false">ĐÁNH GIÁ <span
                        class="reviews-number">(<%=statReview.getSum()%>)</span></div>
            </div>

            <div class="content-list tab-content">
                <jsp:include page="partials/product/tab-content-des.jsp"/>
                <jsp:include page="partials/product/tab-content-info.jsp"/>
                <jsp:include page="partials/product/tab-review.jsp"/>
            </div>
        </div>
    </div>

    <div class="products-container">
        <div class="products">
            <div class="product_title monts">Sản phẩm liên quan</div>
            <div class="container-fluid">
                <div class="product-list row mb-5 ">
                    <c:forEach items="<%=relatedProduct%>" var="product">
                        <jsp:include page="common/card.jsp">
                            <jsp:param name="type" value="1"/>
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

    <jsp:include page="common/footer.jsp"/>
</div>

<jsp:include page="common/tail.jsp"/>
</body>
</html>
