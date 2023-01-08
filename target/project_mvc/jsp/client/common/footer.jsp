<%--
  Created by IntelliJ IDEA.
  User: Quang Tho
  Date: 26/11/2022
  Time: 14:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<%
  Boolean logged = (Boolean) request.getAttribute("logged");
%>
<footer>
  <div class="footer">
    <div class="footer-wrap">
      <div class="wrap-content-foot">
        <div class="footer-column">
          <div class="icon-title-foot menu_logo">
            <h2 class="monts">FURNITURE</h2>
          </div>
          <div class="sub-text-foot">
                <span class="sub-text-style">Sáng tạo, hiện đại, hiệu quả</span>
          </div>
          <div class="element-widget-foot">
            <h2>Theo dõi chúng tôi</h2>
          </div>
          <div class="social-media-foot">
            <a href="#">
              <button class="btn-icon bgr-black hover-bg-red br-50"><i class="fa-brands fa-twitter"></i>
              </button>
            </a>
            <a href="#">
              <button class="btn-icon bgr-black hover-bg-red br-50"><i class="fab fa-dribbble"></i></button>
            </a>
            <a href="#">
              <button class="btn-icon bgr-black hover-bg-red br-50"><i class="fab fa-behance"></i></i>
              </button>
            </a>
            <a href="#">
              <button class="btn-icon bgr-black hover-bg-red br-50"><i class="fab fa-instagram"></i></button>
            </a>
          </div>
        </div>
        <div class="footer-column">
          <div class="title-footer-column">
            <h4>Thông tin về chúng tôi</h4>
          </div>
          <div class="horizontal-line">
            <div class="line"></div>
          </div>
          <div class="element-content-container">
            <ul>
              <li>
                <a href="${pageContext.request.contextPath}/about"><span class="sub-text-style">Về chúng tôi</span></a>
              </li>
              <li>
                <a href="${pageContext.request.contextPath}/products"><span class="sub-text-style">Các sản phẩm</span></a>
              </li>
            </ul>
          </div>
        </div>
        <div class="footer-column help-res">
          <div class="title-footer-column">
            <h4>Hỗ trợ</h4>
          </div>
          <div class="horizontal-line">
            <div class="line"></div>
          </div>
          <div class="element-content-container">
            <ul>
              <li>
                <a href="${pageContext.request.contextPath}/contact"><span class="sub-text-style">Liên hệ và đặt câu hỏi</span></a>
              </li>
              <li>
                <a href="<%=logged ? "/orderList" : "/searchOrder" %> "><span class="sub-text-style">Tra cứu đơn hàng</span></a>
              </li>
            </ul>
          </div>
        </div>
        <div class="footer-column">
          <div class="title-footer-column">
            <h4>Tính năng</h4>
          </div>
          <div class="horizontal-line">
            <div class="line"></div>
          </div>
          <div class="element-content-container">
            <ul>
              <li>
                <a href="${pageContext.request.contextPath}/login"><span class=" sub-text-style">Đăng nhập</span></a>
              </li>
              <li>
                <a href="${pageContext.request.contextPath}/login"><span class=" sub-text-style">Đăng ký</span></a>
              </li>
              <li>
                <a href="${pageContext.request.contextPath}/forgotPassword"><span class="sub-text-style">Quên mật khẩu</span></a>
              </li>
            </ul>
          </div>
        </div>
      </div>
    </div>
  </div>
  <div class="foot-end">
    <div class="wrap-foot-end">
      <div class="foot-end-column">
        <div class="wrap-content">
          <div class="col-foot-left">
            <h2>Copyright @ 2022 Caston. All rights reserved.</h2>
          </div>
        </div>
      </div>
      <div class="foot-end-column">
        <div class="wrap-content">
          <div class="col-foot-right">
            <img src="../assets/imgs/card-shop/payment.png" alt="">
          </div>
        </div>
      </div>
    </div>
  </div>
</footer>
