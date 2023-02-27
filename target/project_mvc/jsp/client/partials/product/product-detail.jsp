<%@ page import="java.text.DecimalFormat" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="DTO.StatReview" %>
<%@ page import="Model.*" %>
<%@ page import="Services.CategoryServices" %><%--
=======
<%@ page import="Model.Pattern" %><%--
>>>>>>> a54fe1ac2474d64b9373d2e8acf7d69699fc7c06
  Created by IntelliJ IDEA.
  User: Quang Tho
  Date: 02/12/2022
  Time: 13:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<%
    Product product = (Product) request.getAttribute("product");
    ArrayList<Color> colors = (ArrayList<Color>) request.getAttribute("colors");
    ArrayList<Pattern> patterns = (ArrayList<Pattern>) request.getAttribute("patterns");
    StatReview statReview = (StatReview) request.getAttribute("statReview");
    boolean isUnavailable = product.getStatus() == StatusProduct.UNAVAILABLE.ordinal();
    CategoryServices categoryServices = new CategoryServices("category");
    Category category = categoryServices.findById(String.valueOf(product.getCategoryId()), Category.class);
%>
<div class="product-detail col col-lg-4">
    <div class="product_rate-point">
        <div class="star-rate" data-rate="<%=statReview.getAvg()%>"></div>
        <div class="rate-number">(<%=statReview.getSum()%> đánh giá)</div>
    </div>
    <div class="product_name monts">
        <h2><%=product.getName()%>
        </h2>
    </div>
    <div class="product_price"><%=DecimalFormat.getInstance().format(product.getPrice())%> VNĐ</div>
    <div class="product_description">
        <p><%=product.getShortDescription()%>
        </p>
    </div>
    <form action="${pageContext.request.contextPath}/addToCart?id=<%=product.getId()%>" method="post">
        <div class="product_options">
            <c:if test="<%=!colors.isEmpty()%>">
                <div class="gallery-action product_options-choice">
                    <div class="product_option_title">Màu :</div>
                    <c:forEach items="<%=colors%>" var="color">
                        <div class="input-radio">
                            <label>
                                <input type="radio" name="color" value="${color.name}">
                                <div class="radio-bg" style="background: ${color.value}"></div>
                            </label>
                        </div>
                    </c:forEach>
                </div>
            </c:if>
            <c:if test="<%=!patterns.isEmpty()%>">
                <div class="product_size product_options-choice">
                    <div class="product_option_title">Mẫu :</div>
                    <c:forEach items="<%=patterns%>" var="pattern">
                        <div class="input-radio-text">
                            <label>
                                <input type="radio" name="pattern" value="${pattern.name}">
                                <div class="radio-btn">${pattern.name}</div>
                            </label>
                        </div>
                    </c:forEach>
                </div>
            </c:if>
        </div>

        <div class="product_action row flex-row-reverse">
            <div class="product_number col-3 col-sm-2 col-lg-3">
                <input type="number" class="input-number" name="amount" value="1" min=1 required>
            </div>
            <div class="col-9 col-lg">
                <c:choose>
                    <c:when test="<%=isUnavailable%>">
                        <button class="btn-text-lg bgr-black hover-bg-red" type="button" disabled>Hết hàng</button>
                    </c:when>
                    <c:otherwise>
                        <button class="btn-text-lg bgr-black hover-bg-red" type="submit">Thêm vào giỏ hàng</button>
                    </c:otherwise>
                </c:choose>

            </div>
        </div>
        <div class="color-red mt-2"><%=session.getAttribute("error" + product.getId()) != null ? session.getAttribute("error" + product.getId()) : ""%>
        </div>
    </form>

    <div class="product_info">
        <div class="product_info-item">
            <div class="product_info-type">Danh mục:</div>
            <div class="product_info-name"><%=category.getName()%>
            </div>
        </div>
    </div>
    <div class="action-share-social">
        <span class="title">Chia sẻ:</span>
        <a href="#">
            <button class="social-item hover-text-red br-50"><i
                    class="fa-brands fa-facebook-f"></i></button>
        </a>
        <a href="#">
            <button class="social-item hover-text-red br-50"><i
                    class="fa-brands fa-twitter"></i></button>
        </a>
    </div>
</div>
