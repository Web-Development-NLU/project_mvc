<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="Model.Slide" %>
<%@ page import="Model.Shop" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <jsp:include page="common/head.jsp">
        <jsp:param name="title" value="FURNITURE | TRANG CHỦ"/>
    </jsp:include>
</head>
<%
    ArrayList<Slide> slides = (ArrayList<Slide>) request.getAttribute("slides");
    String success = (request.getAttribute("success") == null) ? null : request.getAttribute("success").toString();
    String error = (request.getParameter("error") == null) ? null : request.getParameter("error").toString();
    String token = session.getAttribute("token") != null ? (String) session.getAttribute("token") : "";
%>
<body>
<div id="home-container">
    <header>
        <jsp:include page="common/menu.jsp"/>
        <jsp:include page="common/searchBarMenu.jsp"/>
        <div class="head_bottom">
            <div id="slider" class="head_bottom-slider">
                <c:forEach items="<%=slides%>" var="slide">
                    <div class="slider_item">
                        <img src="${slide.banner}" alt="">
                        <div class="slider_item-content">
                            <div class="slider_item-title color-white">${slide.title}</div>
                            <div class="slider_item-head color-white monts">${slide.subtitle}</div>
                            <c:if test="${slide.action != null}">
                                <div class="slider_item-action">
                                    <a href="${slide.redirect}">
                                        <button class="btn-text bgr-white hover-bg-trans"><c:out
                                                value="${slide.action}"/></button>
                                    </a>
                                </div>
                            </c:if>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </header>
    <jsp:include page="partials/Home/cardShopHomeSm.jsp"/>
    <jsp:include page="partials/Home/productsHome.jsp"/>
    <jsp:include page="partials/Home/cardShopHomeLg.jsp"/>
    <jsp:include page="partials/Home/attachmentHome.jsp"/>
    <jsp:include page="common/subscribe.jsp"/>
    <c:if test="<%=success != null%>">
        <div class="alert-success alert alert-dismissible fade show fixed-top" role="alert">
            <strong>Thành công</strong> <%=success%>
            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
        </div>
    </c:if>
    <c:if test="<%=error != null%>">
        <div class="alert-warning alert alert-dismissible fade show fixed-top" role="alert">
            <strong>Failed</strong> <%=error%>
            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
        </div>
    </c:if>
    <jsp:include page="partials/Home/homeFooter.jsp"/>
</div>

<jsp:include page="common/tail.jsp"/>
<%--<c:if test="<%=token!=""%>">--%>
    <input type="hidden" name="token" value="<%=token%>">
<%--</c:if>--%>
</body>
</html>
<script type="module" src="../../assets/js/login.js"></script>
