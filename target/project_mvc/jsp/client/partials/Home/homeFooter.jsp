<%--
  Created by IntelliJ IDEA.
  User: Quang Tho
  Date: 01/12/2022
  Time: 10:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  Boolean logged = (Boolean) request.getAttribute("logged");
%>
<div class="foot-end-bgr-white foot-end ">
  <div class="wrap-foot-end">
    <div class="foot-end-column">
      <div class="wrap-content">
        <div class="col-foot-left">
          <div class="icon-title-foot">
<%--            <h2 class="cpw-res"> <div class="mb-2 mb-md-0">--%>
<%--              ©--%>
<%--              <script>--%>
<%--                document.write(new Date().getFullYear());--%>
<%--              </script>--%>
<%--            </div></h2>--%>
            Furniture
          </div>
        </div>
        <div class="cpw-container">
          <h2 class="hide-content">Furniture</h2>
        </div>
      </div>
    </div>
    <div class="foot-end-column">
      <div class="wrap-content">
        <div class="col-foot-right">
          <ul>
            <li><a href="/contact"><span>Liên hệ và Hỏi đáp</span></a></li>
            <li><a href="<%=logged ? "/orderList" : "/searchOrder" %>"><span>Tra cứu đơn hàng</span></a></li>
            <li><a href="/about"><span>Về chúng tôi</span></a></li>
          </ul>
          <div class="social-media-foot">
            <a href="#">
              <button class="btn-icon bgr-black hover-bg-red br-50"><i class="fa-brands fa-twitter"></i>
              </button>
            </a>
            <a href="#">
              <button class="btn-icon bgr-black hover-bg-red br-50"><i class="fab fa-dribbble"></i>
              </button>
            </a>
            <a href="#">
              <button class="btn-icon bgr-black hover-bg-red br-50"><i class="fab fa-behance"></i></i>
              </button>
            </a>
            <a href="#">
              <button class="btn-icon bgr-black hover-bg-red br-50"><i class="fab fa-instagram"></i>
              </button>
            </a>
          </div>
        </div>
      </div>
    </div>
  </div>
  <div class="visible-res">
    <h2 class="cpw-res"> <div class="mb-2 mb-md-0">
      ©
      <script>
        document.write(new Date().getFullYear());
      </script>
    </div></h2>
  </div>
</div>
