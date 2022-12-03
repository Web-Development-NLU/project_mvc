<%--
  Created by IntelliJ IDEA.
  User: Quang Tho
  Date: 01/12/2022
  Time: 12:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="common/head.jsp">
      <jsp:param name="title" value="FURNITURE | ĐĂNG NHẬP"/>
    </jsp:include>
</head>
<body>
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
            <h2>Login</h2>
            <form class="form-swap" action="">
              <div class="ip_user-name">
                <input id="ip_name-account" type="text">
                <label for="ip_name-account">Username or email address *</label>
              </div>
              <div id="ip_password" class="ip_password">
                <input class="ip_password-login" id="ip_password-login" type="password">
                <label for="ip_password-login">Password *</label>
                <span class="show-password" id="show-password">
                  <i class="bi bi-eye-slash"></i>
                </span>
              </div>
              <div class="lost-password-container">
                <div class="checkbox">
                  <input type="checkbox" id="check_box">
                  <label for="check_box">Remember me</label>
                </div>
                <a class="btn-link hover-text-red color-black monts">Lost your password?</a>
              </div>
              <div class="btn-login">
                <a href="#"><button class="btn-text-lg bgr-black hover-bg-red">LOG IN</button></a>
              </div>
            </form>
          </div>
        </div>

        <div class="col-12 col-md">
          <div class="register-container">
            <h2>REGISTER</h2>
            <form class="form-swap" action="">
              <div class="ip_user-name">
                <input id="ip_new-name" type="text">
                <label for="ip_new-name">Username *</label>
              </div>
              <div class="ip_email">
                <input id="ip_email-register" type="email">
                <label for="ip_email-register">Email address *</label>
              </div>
              <p class="monts">A password will be sent to your email address.</p>
              <div class="privacy-policy-text">
                <p class="monts">Your personal data will be used to support your experience throughout this website,
                  to
                  manage access to your account, and for other purposes described in our <a class="monts"
                                                                                            href="#">privacy
                    policy.</a></p>
              </div>
              <div class="btn-register">
                <a href="#"><button class="btn-text-lg bgr-black hover-bg-red">REGISTER</button></a>
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
