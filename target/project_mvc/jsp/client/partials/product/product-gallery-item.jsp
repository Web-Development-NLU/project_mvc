<%--
  Created by IntelliJ IDEA.
  User: Quang Tho
  Date: 02/12/2022
  Time: 13:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored = "false" %>
<div class="product-gallery-item">
  <img src="${param.img}" alt="">
  <span class="gallery-num"><c:out value="${param.num}"/></span>
</div>