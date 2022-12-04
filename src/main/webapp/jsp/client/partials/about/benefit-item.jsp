<%--
  Created by IntelliJ IDEA.
  User: Quang Tho
  Date: 02/12/2022
  Time: 12:45
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored = "false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="card-benefit col-12 col-md-6 col-lg-4">
  <div class="text-icon-benefit ">
    <div class="img_benefit">
      <img src="${param.img}" alt="Not found">
    </div>
    <div class="content-benefit">
      <h3><c:out value="${param.title}"/></h3>
      <span><c:out value="${param.des}"/></span>
    </div>
  </div>
</div>
