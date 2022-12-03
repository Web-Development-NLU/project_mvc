<%--
  Created by IntelliJ IDEA.
  User: Quang Tho
  Date: 01/12/2022
  Time: 10:59
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored = "false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<c:if test="${param.type == '2'}">
    <div class="card-components-2 col-6 col-md-4 col-lg-3">
        <div class="product-item-wrap">
            <div class="img-product-container unset-border">
                <a href="#">
                    <img class="img-product transt-04-linear" src="/assets/imgs/card-shop/chair-product.jpg" alt="">
                </a>
                <div class="btn-card-product translateY-bottom-btn">
                    <a href="#"><button class="btn-icon bgr-white hover-bg-red br-50 shadow-01"><i
                            class="bi bi-bag"></i></button></a>
                    <a href="#"><button class="btn-icon bgr-white hover-bg-red br-50 shadow-01"><i
                            class="fa-regular fa-heart fw-500"></i></button></a>
                    <a href="#"><button class="btn-icon bgr-white hover-bg-red br-50 shadow-01"><i
                            class="fa-sharp fa-solid fa-magnifying-glass"></i></button></a>
                </div>
            </div>
            <div class="info-product">
                <div class="star-rate" data-rate="4"></div>
                <h2 class="product-name">
                    <a href="#"><span>Pauline Barstool</span></a>
                </h2>
                <div class="card-price">
                    <span class="current-price">560.00$</span>
                    <span class="cost cl-text-price"></span>
                </div>
            </div>
        </div>
    </div>
</c:if>
<c:if test="${param.type == '1'}">
    <div class="card-product-1 col-6 col-md-4 col-lg-3">
        <div class="product-item-wrap">
            <div class="img-product-container">
                <a href="#">
                    <img class="img-product transt-04-linear" src="../assets/imgs/card-shop/chair-product.jpg" alt="">
                </a>
                <div class="btn-card-product translateX-bottom-btn">
                    <a class="tf-1" href="#"><button class="btn-icon bgr-white hover-bg-red color-black shadow-01"><i
                            class="bi bi-bag"></i></button></a>
                    <a class="tf-2" href="#"><button class="btn-icon bgr-white hover-bg-red color-black shadow-01"><i
                            class="fa-regular fa-heart"></i></button></a>
                    <a class="tf-3" href="#"><button class="btn-icon bgr-white hover-bg-red color-black shadow-01"><i
                            class="fa-sharp fa-solid fa-magnifying-glass"></i></button></a>
                </div>
            </div>
            <div class="info-product">
                <div class="star-rate" data-rate="4"></div>
                <h2 class="product-name">
                    <a href="#"><span>Pauline Barstool</span></a>
                </h2>
                <div class="card-price">
                    <span class="current-price">560.00$</span>
                    <span class="cost cl-text-price"></span>
                </div>
            </div>
        </div>
    </div>
</c:if>
