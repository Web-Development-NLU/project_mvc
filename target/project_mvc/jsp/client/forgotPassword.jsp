<%--
  Created by IntelliJ IDEA.
  User: Quang Tho
  Date: 06/12/2022
  Time: 10:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <jsp:include page="common/head.jsp">
      <jsp:param name="title" value="FURNITURE | QUÊN MẬT KHẨU"/>
    </jsp:include>
</head>
<body>
  <%
    String errorForgot = (request.getAttribute("errorForgot") == null) ? "" : request.getAttribute("errorForgot").toString();
  %>
  <div id="forgot-password-controller">
    <header>
      <jsp:include page="common/menu.jsp"/>
      <jsp:include page="common/searchBarMenu.jsp"/>
      <jsp:include page="common/head-bottom-page.jsp">
        <jsp:param name="title" value="QUÊN MẬT KHẨU"/>
        <jsp:param name="page" value="/forgotPassword"/>
      </jsp:include>
    </header>
    <form action="${pageContext.request.contextPath}/forgotPassword" method="post">
      <div class="forgot-password container-fluid">
        <div class="forgot-password-swap">
          <div class="form-reset-password">
            <p class="monts">Hãy để lại email đăng ký của bạn chúng tôi sẽ gửi đến bạn một email xác minh.</p>
            <c:if test="<%= !errorForgot.isEmpty() %>">
              <div class="color-red mb-3 overflow-hidden">
                <%= errorForgot %>
              </div>
            </c:if>
            <div class="container-ip-info-user">
              <label class="monts" for="user-login">Email</label>
              <input id="user-login" type="text" name="email">
            </div>
            <div class="btn-form-forgot-password">
              <button class="btn-text-lg bgr-black hover-bg-red monts">TIẾP TỤC</button>
            </div>
          </div>
        </div>
      </div>
    </form>
    <jsp:include page="common/footer.jsp"/>
  </div>
  <jsp:include page="common/tail.jsp"/>
</body>
</html>
