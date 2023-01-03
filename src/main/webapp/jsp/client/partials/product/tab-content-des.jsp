<%@ page import="Model.Product" %><%--
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
%>
<div id="content-des" class="tab-pane fade show active" role="tabpanel" aria-labelledby="tab-description">
  <p><%=product.getShortDescription()%></p>
  <p><%=product.getDescription()%> </p>
</div>
