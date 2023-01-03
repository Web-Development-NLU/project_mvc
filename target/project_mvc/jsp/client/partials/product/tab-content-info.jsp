<%@ page import="Model.Product" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="Model.Color" %><%--
  Created by IntelliJ IDEA.
  User: Quang Tho
  Date: 02/12/2022
  Time: 13:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<%
  Product product = (Product) request.getAttribute("product");
  ArrayList<Color> colors = (ArrayList<Color>) request.getAttribute("colors");
%>
<div id="content-info" class="tab-pane fade" role="tabpanel" aria-labelledby="tab-info">
  <table class="table table-bordered">
    <c:if test="<%=product.getDimensions() != null || !product.getDimensions().isEmpty()%>">
      <tr>
        <th>Kích thước </th>
        <td><%=product.getDimensions()%></td>
      </tr>
    </c:if>
    <c:if test="<%=colors != null%>">
      <tr>
        <th>Màu sắc</th>
        <td>
          <c:forEach items="<%=colors%>" var="color">
            <c:out value="${color}"/>
          </c:forEach>
        </td>
      </tr>
    </c:if>
    <c:if test="<%=product.getMaterial() != null | !product.getMaterial().isEmpty()%>">
      <tr>
        <th>Chất liệu</th>
        <td>
          <%=product.getMaterial()%>
        </td>
      </tr>
    </c:if>
  </table>
</div>