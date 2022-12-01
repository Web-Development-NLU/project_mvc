<%--
  Created by IntelliJ IDEA.
  User: Quang Tho
  Date: 26/11/2022
  Time: 12:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="common/head.jsp">
        <jsp:param name="title" value="Home | Furniture"/>
    </jsp:include>
</head>
<body>
    <%
        int statusCode = (int) request.getAttribute("statusCode");
        String messageTitle = (String) request.getAttribute("messageTitle");
        String message = (String) request.getAttribute("message");
    %>
    <div id="error-container">
        <header>
            <jsp:include page="common/menu.jsp">
                <jsp:param name="logged" value="<%= false %>"/>
            </jsp:include>
            <jsp:include page="common/searchBarMenu.jsp"/>
            <jsp:include page="common/head-bottom-page.jsp">
                <jsp:param name="title" value="Page Not Found"/>
            </jsp:include>
        </header>
        <div id="error-content" class="container-fluid">
            <div class="status-error">
                <h1><%= statusCode %></h1>
                <h2><%= messageTitle %></h2>
                <span><%=message %></span>
            </div>
            <form action="">
                <div class="form-search mt-5">
                    <input class="ip_search" type="search" placeholder="Search...">
                    <button class="btn-search">
                        <i class="fa-solid fa-magnifying-glass"></i>
                    </button>
                </div>
            </form>
        </div>
        <jsp:include page="common/footer.jsp"/>
    </div>

    <jsp:include page="common/tail.jsp"/>
</body>
</html>
