<%--
  Created by IntelliJ IDEA.
  User: Quang Tho
  Date: 04/12/2022
  Time: 09:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored = "false" %>
<html>
<head>
  <jsp:include page="common/head.jsp">
    <jsp:param name="title" value="FURNITURE | ĐĂNG KÝ"/>
  </jsp:include>
</head>
<body>
<div id="signup-container">
  <header>
    <jsp:include page="common/menu.jsp"/>
    <jsp:include page="common/searchBarMenu.jsp"/>
    <jsp:include page="common/head-bottom-page.jsp">
      <jsp:param name="title" value="ĐĂNG KÝ"/>
      <jsp:param name="page" value="signup"/>
    </jsp:include>
  </header>
    <div class="forgot-password container-fluid">
      <div class="forgot-password-swap">
        <div class="form-reset-password">
          <p class="monts">Bạn đã đổi mật khẩu thành công.</p>
          <div class="btn-form-forgot-password">
            <a href="${pageContext.request.contextPath}/login"><button class="btn-text-lg bgr-black hover-bg-red monts">TRỞ VỀ ĐĂNG NHẬP</button></a>
          </div>
        </div>
      </div>
    </div>

  <jsp:include page="common/footer.jsp"/>
</div>
<jsp:include page="common/tail.jsp"/>
</body>
</html>
