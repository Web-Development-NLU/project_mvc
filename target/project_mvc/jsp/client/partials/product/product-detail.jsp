<%@ page import="java.text.DecimalFormat" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="Model.Color" %>
<%@ page import="Model.Product" %>
<%@ page import="Model.Pattern" %>
<%@ page import="DTO.StatReview" %><%--
  Created by IntelliJ IDEA.
  User: Quang Tho
  Date: 02/12/2022
  Time: 13:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored = "false" %>
<%
  Product product = (Product) request.getAttribute("product");
  ArrayList<Color> colors = (ArrayList<Color>) request.getAttribute("colors");
  ArrayList<Pattern> patterns = (ArrayList<Pattern>) request.getAttribute("patterns");
  StatReview statReview = (StatReview) request.getAttribute("statReview");
%>
<div class="product-detail col col-lg-4">
  <div class="product_rate-point">
    <div class="star-rate" data-rate="<%=statReview.getAvg()%>"></div>
    <div class="rate-number">(<%=statReview.getSum()%> reviews)</div>
  </div>
  <div class="product_name monts">
    <h2><%=product.getName()%></h2>
  </div>
  <div class="product_price"><%=DecimalFormat.getInstance().format(product.getPrice())%> VNĐ</div>
  <div class="product_description">
    <p><%=product.getShortDescription()%></p>
  </div>
  <form action="${pageContext.request.contextPath}/addToCart?id=<%=product.getId()%>" method="post">
    <div class="product_options">
      <c:if test="<%=!colors.isEmpty()%>">
        <div class="gallery-action product_options-choice">
            <div class="product_option_title">Color:</div>
            <c:forEach items="<%=colors%>" var="color">
              <div class="input-radio">
                <label>
                  <input type="radio" name="color" value="${color.name}" required>
                  <div class="radio-bg" style="background: ${color.value}"></div>
                </label>
              </div>
            </c:forEach>
        </div>
      </c:if>
      <c:if test="<%=!patterns.isEmpty()%>">
        <div class="product_size product_options-choice">
          <div class="product_option_title">Pattern: </div>
          <c:forEach items="<%=patterns%>" var="pattern">
            <div class="input-radio-text">
              <label>
                <input type="radio" name="pattern" value="${pattern.name}" required>
                <div class="radio-btn">${pattern.name}</div>
              </label>
            </div>
          </c:forEach>
        </div>
      </c:if>
    </div>

    <div class="product_action row flex-row-reverse">
      <div class="product_number col-3 col-sm-2 col-lg-3">
        <input type="number" class="input-number" name="amount" value="1">
      </div>
      <div class="col-9 col-lg">
        <button class="btn-text-lg bgr-black hover-bg-red" type="submit">ADD TO CART</button>
      </div>
    </div>
  </form>
  <div class="product_btn-add-wishlist">
    <div class="wishlist-btn-icon"><i class="fa-regular fa-heart"></i></div>
    <div class="wishlist-title">Add to wishlist</div>
  </div>
  <div class="product_info">
    <div class="product_info-item">
      <div class="product_info-type">Category:</div>
      <div class="product_info-name">Storage</div>
    </div>
  </div>
  <div class="action-share-social">
    <span class="title">Share:</span>
    <a href="#"><button class="social-item hover-text-red br-50"><i
            class="fa-brands fa-facebook-f"></i></button></a>
    <a href="#"><button class="social-item hover-text-red br-50"><i
            class="fa-brands fa-twitter"></i></button></a>
  </div>
</div>
