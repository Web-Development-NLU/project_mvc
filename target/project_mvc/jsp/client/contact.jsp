<%@ page import="Model.Contact" %><%--
  Created by IntelliJ IDEA.
  User: Quang Tho
  Date: 02/12/2022
  Time: 12:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<html>
<head>
  <jsp:include page="common/head.jsp">
    <jsp:param name="title" value="FURNITURE | LIÊN HỆ"/>
  </jsp:include>
</head>
<body>
<%
  Contact contact = (Contact) request.getAttribute("contact");
  String success = (request.getAttribute("success") == null) ? null : request.getAttribute("success").toString();
%>
  <div id="contact-contariner">
    <header>
      <jsp:include page="common/menu.jsp"/>
      <jsp:include page="common/searchBarMenu.jsp"/>
      <jsp:include page="common/head-bottom-page.jsp">
        <jsp:param name="title" value="LIÊN HỆ"/>
        <jsp:param name="page" value="Liên hệ"/>
      </jsp:include>
    </header>
    <div id="contact-content" class="container-fluid">
      <div class="row justify-content-between">
        <div class="contact-info col-12 col-md-4">
          <h3 class="big_title">Liên hệ với chúng tôi</h3>
          <span>Căn nhà là một thành quả tuyệt vời cho sự nỗ lực của bạn, hãy làm nó trở nên đẹp hơn và đáng sống hơn. Đó là lý do chúng tôi ở đây để giúp bạn.
          Đừng ngần ngại chia sẻ câu chuyện của bạn với chúng tôi. Chúng tôi luôn sẵn sàng được phục vụ.</span>
          <div class="main-content">
            <jsp:include page="partials/contact/contact-item.jsp">
              <jsp:param name="icon" value="bi bi-geo-alt"/>
              <jsp:param name="title" value="Địa chỉ"/>
              <jsp:param name="content" value="<%=contact.getAddress()%>"/>
            </jsp:include>
            <jsp:include page="partials/contact/contact-item.jsp">
              <jsp:param name="icon" value="bi bi-telephone"/>
              <jsp:param name="title" value="Số điện thoại"/>
              <jsp:param name="content" value="<%=contact.getPhone()%>"/>
            </jsp:include>
            <jsp:include page="partials/contact/contact-item.jsp">
              <jsp:param name="icon" value="bi bi-envelope"/>
              <jsp:param name="title" value="Email"/>
              <jsp:param name="content" value="<%=contact.getEmail()%>"/>
            </jsp:include>
          </div>
        </div>
        <div class="send-us-email-container col-12 col-md-6">
          <div class="header-send-us">
            <div class="title-content-swap">
              <span class="icon-email"><i class="bi bi-envelope"></i></span>
              <span class="title-head monts">BẠN MUỐN ĐƯỢC TƯ VẤN ?</span>
            </div>
          </div>
          <form action="${pageContext.request.contextPath}/customer?page=contact" method="post">
            <div class="form-send-us-container">
              <div class="form-send-us-swap">
                <div class="form-container">
                  <div class="input-area">
                    <div class="field-ip-container">
                      <div class="ip_name-container">
                        <input class="input-primary monts" type="text" name="name" placeholder="Tên của bạn *" required>
                      </div>
                      <div class="ip_email-container">
                        <input class="input-primary monts" type="email" name="email" placeholder="Email của bạn *" required>
                      </div>
                    </div>
                    <div class="field-area-container">
                      <textarea class="text-area monts" name="message" placeholder="Bạn muốn hỏi điều gì"></textarea>
                    </div>
                  </div>
                  <div class="submit-container">
                    <button class="btn-text-lg bgr-black hover-bg-red monts">GỬI CHO CHÚNG TÔI</button>
                  </div>
                </div>
              </div>
            </div>
          </form>
        </div>
      </div>

    </div>
    <c:if test="<%=success != null%>">
      <div class="alert-success alert alert-dismissible fade show fixed-top" role="alert">
        <strong>Thành công</strong> <%=success%>
        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
    </c:if>
    <jsp:include page="common/footer.jsp"/>
  </div>
  <jsp:include page="common/tail.jsp"/>
</body>
</html>
