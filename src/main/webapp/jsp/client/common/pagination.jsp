<%--
  Created by IntelliJ IDEA.
  User: Quang Tho
  Date: 01/12/2022
  Time: 12:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored = "false" %>
<nav aria-label="Page navigation">
  <ul class="pagination">
    <li class="page-item pagination-item"><a class="page-link color-black" href="#"><i
            class="fa-solid fa-angle-left"></i></a></li>

    <c:forEach var = "i" begin="0" end="${param.number - 1}">
      <c:choose>
        <c:when test="${param.active == i}">
          <li class="page-item pagination-item"><a class="page-link color-black pg-action" href="${pageContext.request.contextPath}/${param.path}/${i}"><c:out value="${i + 1}"/></a></li>
        </c:when>
        <c:otherwise>
          <li class="page-item pagination-item"><a class="page-link color-black" href="${pageContext.request.contextPath}/${param.path}/${i}"><c:out value="${i + 1}"/></a></li>
        </c:otherwise>
      </c:choose>

    </c:forEach>

    <li class="page-item pagination-item"><a class="page-link color-black" href="#"><i
            class="fa-solid fa-angle-right"></i></a></li>
  </ul>
</nav>
