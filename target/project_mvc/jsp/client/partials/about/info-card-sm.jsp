<%--
  Created by IntelliJ IDEA.
  User: Quang Tho
  Date: 02/12/2022
  Time: 12:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored = "false" %>

<c:choose>
  <c:when test="${param.type == 1}">
    <div class="about-info-card container-fluid">
      <div class="about-info-card_thumbnail left-content">
        <img src="https://caston.familab.net/wp-content/uploads/2022/03/about_image_5.jpg" alt="" class="info-img-lg">
      </div>
      <div class="about-info-card_content right-content">
        <div class="info_title monts"><%=request.getParameter("title")%>></div>
        <div class="info_break-line"></div>
        <div class="info_description monts"><%=request.getParameter("value")%></div>
        <div class="info_action">
          <a href="${pageContext.request.contextPath}/products"><button class="btn-text bgr-white hover-bg-red outline-black">XEM CÁC SẢN PHẨM</button></a>
        </div>
      </div>
    </div>
  </c:when>
  <c:otherwise>
    <div class="about-info-card container-fluid reverse">
      <div class="about-info-card_thumbnail right-content">
        <img src="https://caston.familab.net/wp-content/uploads/2022/03/about_image_5.jpg" alt="" class="info-img-sm">
      </div>
      <div class="about-info-card_content left-content">
        <div class="info_title monts"><%=request.getParameter("title")%></div>
        <div class="info_break-line"></div>
        <div class="info_description monts"><%=request.getParameter("value")%></div>
        <div class="info_action">
          <a href="${pageContext.request.contextPath}/products"><button class="btn-text bgr-white hover-bg-red outline-black">XEM CÁC SẢN PHẨM</button></a>
        </div>
      </div>
    </div>
  </c:otherwise>
</c:choose>