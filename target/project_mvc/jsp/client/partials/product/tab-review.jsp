<%@ page import="java.util.ArrayList" %>
<%@ page import="Model.Review" %>
<%@ page import="Model.Product" %>
<%@ page import="Model.User" %><%--
  Created by IntelliJ IDEA.
  User: Quang Tho
  Date: 02/12/2022
  Time: 13:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>

<%
  ArrayList<Review> reviews = (ArrayList<Review>) request.getAttribute("reviews");
  Product product = (Product) request.getAttribute("product");
  User user = (User) request.getAttribute("user");
%>

<div id="content-reviews" class="tab-pane fade" role="tabpanel" aria-labelledby="tab-reviews">
  <p class="review-note"></p>
  <form action="${pageContext.request.contextPath}/review" method="post">
    <div class="review-point">
      <div class="radio-icon">
        <label>
          <input type="radio" name="point" value="5" required>
          <i class="fa-regular fa-star"></i>
        </label>
      </div>
      <div class="radio-icon">
        <label>
          <input type="radio" name="point" value="4" required>
          <i class="fa-regular fa-star"></i>
        </label>
      </div>
      <div class="radio-icon">
        <label>
          <input type="radio" name="point" value="3" required>
          <i class="fa-regular fa-star"></i>
        </label>
      </div>
      <div class="radio-icon">
        <label>
          <input type="radio" name="point" value="2" required>
          <i class="fa-regular fa-star"></i>
        </label>
      </div>
      <div class="radio-icon">
        <label>
          <input type="radio" name="point" value="1" required>
          <i class="fa-regular fa-star"></i>
        </label>
      </div>
      <div class="title monts">YOUR RATING*</div>
    </div>
    <br>
    <div class="review-box row">
      <div class="review-col-2 col-12 col-md">
        <div class="input-secondary">
          <label for="email">Your comment *</label>
          <textarea class="text-area" name="comment" required></textarea>
        </div>
      </div>
      <div class="review-col-1 col-12 col-md">
        <div class="input-secondary">
          <label for="ip_name">Your Name *</label>
          <input type="text" id="ip_name" name="name" value="<%= (user != null) ? user.getFirstName() + " " + user.getLastName() : ""%>" required>
        </div>
        <br>
        <div class="input-secondary">
          <label for="email">Your Email *</label>
          <input type="email" id="email" name="email" value="<%= (user != null) ? user.getEmail() : ""%>" required>
        </div>
        <div class="review-submit">
          <br>
          <button class="btn-text-lg bgr-black" value="<%=product.getId()%>" name="product" type="submit">SUBMIT</button>
        </div>
      </div>
    </div>
    <div class="review-options">
      <div class="checkbox">
        <br>
        <input type="checkbox" name="isSave" id="check_box">
        <label for="check_box">Save my name, email, and website in this browser for the next time I
          comment.</label>
      </div>
    </div>
  </form>
  <div class="reviews-list">
    <div class="reviews-list_title">Other Reviews</div>
    <c:forEach items="<%=reviews%>" var="review">
      <div class="card-review">
        <div class="card-review-info">
          <img src="https://secure.gravatar.com/avatar/f5a3778cab66f714ab062b54743030aa?s=60&d=mm&r=g" alt=""
               class="avatar">
          <div class="cr-info_personal">
            <div class="info_personal-name monts"><c:out value="${review.name}"/><span class="star-rate" data-rate="${review.point}"></span></div>
            <div class="info_personal-date monts"><c:out value="${review.createdAt}"/> </div>
          </div>
        </div>
        <div class="card-review-content">
          <p><c:out value="${review.comment}"/></p>
        </div>
      </div>
    </c:forEach>
  </div>
</div>