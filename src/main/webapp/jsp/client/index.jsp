<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="Model.Slide" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <jsp:include page="common/head.jsp">
        <jsp:param name="title" value="FURNITURE | TRANG CHỦ"/>
    </jsp:include>
</head>
<% ArrayList<Slide> slides = (ArrayList<Slide>) request.getAttribute("slides"); %>
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
                                        <a href="${slide.redirect}"><button class="btn-text bgr-white hover-bg-trans"><c:out value="${slide.action}"/></button></a>
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
        <jsp:include page="partials/Home/homeFooter.jsp"/>
    </div>

    <jsp:include page="common/tail.jsp"/>
</body>
</html>
