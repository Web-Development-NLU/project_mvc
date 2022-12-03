<%--
  Created by IntelliJ IDEA.
  User: Quang Tho
  Date: 02/12/2022
  Time: 12:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <jsp:include page="common/head.jsp">
    <jsp:param name="title" value="FURNITURE | LIÊN HỆ"/>
  </jsp:include>
</head>
<body>
  <div id="contact-contariner">
    <header>
      <jsp:include page="common/menu.jsp"/>
      <jsp:include page="common/searchBarMenu.jsp"/>
      <jsp:include page="common/head-bottom-page.jsp">
        <jsp:param name="title" value="LIÊN HỆ"/>
        <jsp:param name="page" value="contact"/>
      </jsp:include>
    </header>
    <div id="contact-content" class="container-fluid">
      <div class="row justify-content-between">
        <div class="contact-info col-12 col-md-4">
          <h3 class="big_title">Contact Us</h3>
          <span>There’s no place like home. To help you make yours perfect, our stores are open, we’re delivering as
            normal, our online store is available 24/7, and our customer service team is ready to help you via phone and
            Live Chat.</span>
          <div class="main-content">
            <jsp:include page="partials/contact/contact-item.jsp">
              <jsp:param name="icon" value="bi bi-geo-alt"/>
              <jsp:param name="title" value="Adress"/>
              <jsp:param name="content" value="125 Hoàng diệu, Quận 4, TP. Hồ Chí Minh"/>
            </jsp:include>
            <jsp:include page="partials/contact/contact-item.jsp">
              <jsp:param name="icon" value="bi bi-telephone"/>
              <jsp:param name="title" value="Phone"/>
              <jsp:param name="content" value="+84 360 298 108"/>
            </jsp:include>
            <jsp:include page="partials/contact/contact-item.jsp">
              <jsp:param name="icon" value="bi bi-envelope"/>
              <jsp:param name="title" value="Email"/>
              <jsp:param name="content" value="contact@furniture.com"/>
            </jsp:include>
          </div>
        </div>
        <div class="send-us-email-container col-12 col-md-6">
          <div class="header-send-us">
            <div class="title-content-swap">
              <span class="icon-email"><i class="bi bi-envelope"></i></span>
              <span class="title-head monts">Send us a message</span>
            </div>
          </div>
          <form>
            <div class="form-send-us-container">
              <div class="form-send-us-swap">
                <div class="form-container">
                  <div class="input-area">
                    <div class="field-ip-container">
                      <div class="ip_name-container">
                        <input class="input-primary monts" type="text" placeholder="Your Name *">
                      </div>
                      <div class="ip_email-container">
                        <input class="input-primary monts" type="text" placeholder="Your Email *">
                      </div>
                    </div>
                    <div class="field-area-container">
                      <textarea class="text-area monts" placeholder="Your Comment *"></textarea>
                    </div>
                  </div>
                  <div class="submit-container">
                    <a href="#"><button class="btn-text-lg bgr-black hover-bg-red monts">SEND A MESSAGE</button></a>
                  </div>
                </div>
              </div>
            </div>
          </form>
        </div>
      </div>

    </div>
    <jsp:include page="common/footer.jsp"/>
  </div>
  <jsp:include page="common/tail.jsp"/>
</body>
</html>
