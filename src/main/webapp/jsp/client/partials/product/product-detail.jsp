<%--
  Created by IntelliJ IDEA.
  User: Quang Tho
  Date: 02/12/2022
  Time: 13:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored = "false" %>
<div class="product-detail col col-lg-4">
  <div class="product_rate-point">
    <div class="star-rate" data-rate="4"></div>
    <div class="rate-number">(4 reviews)</div>
  </div>
  <div class="product_name monts">
    <h2>Read Bookcase</h2>
  </div>
  <div class="product_price">210.00$</div>
  <div class="product_description">
    <p>Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend
      leo.</p>
  </div>
  <form action="${pageContext.request.contextPath}/addToCart?id=215891e8-76c6-11ed-971e-6018955a5f6c" method="post">
    <div class="product_options">
      <div class="gallery-action product_options-choice">
        <div class="product_option_title">Color:</div>
        <div class="input-radio rd-yellow">
          <label>
            <input type="radio" name="color" value="yellow">
            <div class="radio-bg"></div>
          </label>
        </div>
        <div class="input-radio rd-red">
          <label>
            <input type="radio" name="color" value="red">
            <div class="radio-bg"></div>
          </label>
        </div>
      </div>

      <div class="product_size product_options-choice">
        <div class="product_option_title">Pattern: </div>
        <div class="input-radio-text">
          <label>
            <input type="radio" name="pattern" value="Small">
            <div class="radio-btn">Small</div>
          </label>
        </div>
        <div class="input-radio-text">
          <label>
            <input type="radio" name="pattern" value="Large">
            <div class="radio-btn">Large</div>
          </label>
        </div>
      </div>
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
