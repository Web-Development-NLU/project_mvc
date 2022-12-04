<%--
  Created by IntelliJ IDEA.
  User: Quang Tho
  Date: 01/12/2022
  Time: 12:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored = "false" %>
<html>
<head>
    <jsp:include page="common/head.jsp">
      <jsp:param name="title" value="FUNITURE | SẢN PHẨM"/>
    </jsp:include>
</head>
<body>
    <div id="shop-container">
        <header>
            <jsp:include page="common/menu.jsp">
                <jsp:param name="logged" value="<%= false %>"/>
            </jsp:include>
            <jsp:include page="common/searchBarMenu.jsp"/>
            <jsp:include page="partials/products/headBottom.jsp"/>
        </header>
        <jsp:include page="common/filterProducts.jsp"/>
        <div class="products-container">
            <div class="products">
                <div class="container-fluid">
                    <div class="product-list row mb-5 ">
                        <c:forEach begin="1" end="12">
                            <jsp:include page="common/card.jsp">
                                <jsp:param name="type" value="2"/>
                            </jsp:include>
                        </c:forEach>
                    </div>
                </div>
                <jsp:include page="common/pagination.jsp">
                    <jsp:param name="path" value="#"/>
                    <jsp:param name="number" value="${10}"/>
                    <jsp:param name="active" value="0"/>
                </jsp:include>
            </div>
        </div>
        <jsp:include page="common/footer.jsp"/>
    </div>

    <jsp:include page="common/tail.jsp"/>
</body>
</html>
