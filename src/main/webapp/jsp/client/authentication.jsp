<%--
  Created by IntelliJ IDEA.
  User: Quang Tho
  Date: 01/12/2022
  Time: 12:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored = "false" %>
<html>
<head>
    <jsp:include page="common/head.jsp">
      <jsp:param name="title" value="FURNITURE | ĐĂNG NHẬP"/>
    </jsp:include>
</head>
<body>
  <%
    String error = (request.getAttribute("error") == null) ? "" : request.getAttribute("error").toString();
    String email = (request.getAttribute("email") == null) ? "" : request.getAttribute("email").toString();
    String emailLogin = (request.getAttribute("emailLogin") == null) ? "" : request.getAttribute("emailLogin").toString();
    String errorLogin = (request.getAttribute("errorLogin") == null) ? "" : request.getAttribute("errorLogin").toString();
  %>
  <div id="authen-container">
    <header>
      <jsp:include page="common/menu.jsp"/>
      <jsp:include page="common/searchBarMenu.jsp"/>
      <jsp:include page="common/head-bottom-page.jsp">
        <jsp:param name="title" value="ĐĂNG NHẬP"/>
        <jsp:param name="page" value="login"/>
      </jsp:include>
    </header>
    <div id="login-content" class="container-fluid">
      <div class="row">
        <div class="col-12 col-md">
          <div class="login-container">
            <h2>Đăng nhập</h2>
            <form class="form-swap" action="${pageContext.request.contextPath}/login" method="post">
              <c:if test="<%= !errorLogin.isEmpty() %>">
                <div class="color-red mb-3 overflow-hidden">
                  <%= errorLogin %>
                </div>
              </c:if>
              <div class="ip_user-name">
                <input id="ip_name-account" type="text" name="email" value="<%= emailLogin %>">
                <label for="ip_name-account">Địa chỉ email *</label>
              </div>
              <div id="ip_password" class="ip_password">
                <input class="ip_password-login" id="ip_password-login" name="password" type="password">
                <label for="ip_password-login">Mật khẩu *</label>
                <span class="show-password" id="show-password">
                  <i class="bi bi-eye-slash"></i>
                </span>
              </div>
              <div class="lost-password-container">
                <a href="${pageContext.request.contextPath}/forgotPassword" class="btn-link hover-text-red color-black monts">Quên mật khẩu?</a>
              </div>
              <div class="btn-login">
                <button class="btn-text-lg bgr-black hover-bg-red">Đăng nhập</button>
              </div>
            </form>
          </div>
        </div>

        <div class="col-12 col-md">
          <div class="register-container">
            <h2>Đăng ký</h2>
            <form class="form-swap" action="${pageContext.request.contextPath}/signup" method="post">
              <c:if test="<%= !error.isEmpty() %>">
                <div class="color-red mb-3 overflow-hidden">
                  <%= error %>
                </div>
              </c:if>

              <div class="ip_user-name">
                <input id="ip_new-name" name="email" type="email" required value="<%=email%>">
                <label for="ip_new-name">Địa chỉ email *</label>
              </div>
              <div class="ip_email">
                <input id="ip_password_register" name="password" type="password" required>
                <label for="ip_password_register">Mật khẩu *</label>
              </div>
              <p class="monts">Mã xác nhận sẽ gửi về email của bạn.</p>
              <div class="privacy-policy-text">
                <p class="monts">Dữ liệu cá nhân của bạn sẽ được sử dụng để hỗ trợ trải nghiệm của bạn trên toàn trang web này, để quản lý quyền truy cập vào tài khoản của bạn và cho các mục đích khác được mô tả trong
                  <a class="monts" href="#">chính sách bảo mật của chúng tôi.</a></p>
              </div>
              <div class="btn-register">
                <button class="btn-text-lg bgr-black hover-bg-red">Đăng ký</button>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
    <jsp:include page="common/footer.jsp"/>
  </div>
  <jsp:include page="common/tail.jsp"/>
</body>
</html>
