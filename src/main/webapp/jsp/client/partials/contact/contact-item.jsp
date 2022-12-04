<%--
  Created by IntelliJ IDEA.
  User: Quang Tho
  Date: 02/12/2022
  Time: 13:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored = "false" %>
<div class="contact-item">
  <div class="icon_contact">
    <span> <i class="${param.icon}"></i></span>
  </div>
  <div class="container-content-contact">
    <h3>
      <span class="title_contact"><c:out value="${param.title}"/></span>
    </h3>
    <p class="content-contact"><c:out value="${param.content}"/></p>
  </div>
</div>