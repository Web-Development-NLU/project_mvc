<%--
  Created by IntelliJ IDEA.
  User: Quang Tho
  Date: 01/12/2022
  Time: 13:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="common/head.jsp">
        <jsp:param name="title" value="FURNITURE | VỀ CHÚNG TÔI"/>
    </jsp:include>
</head>
<body>
    <div id="about-container">
        <header>
            <jsp:include page="common/menu.jsp"/>
            <jsp:include page="common/searchBarMenu.jsp"/>
            <jsp:include page="common/head-bottom-page.jsp">
                <jsp:param name="title" value="VỀ CHÚNG TÔI"/>
                <jsp:param name="page" value="about"/>
            </jsp:include>
        </header>
        <jsp:include page="partials/about/info-card-lg.jsp"/>
        <jsp:include page="partials/about/info-card-sm.jsp">
            <jsp:param name="type" value="1"/>
        </jsp:include>
        <jsp:include page="partials/about/info-card-sm.jsp">
            <jsp:param name="type" value="2"/>
        </jsp:include>

        <div class="about-benefit container-fluid">
            <div class="row">
                <jsp:include page="partials/about/benefit-item.jsp">
                    <jsp:param name="img" value="../assets/imgs/icons/icon-benefit.svg"/>
                    <jsp:param name="title" value="FREE SHIPPING"/>
                    <jsp:param name="des" value="Free worldwide shipping on all Area order above $100"/>
                </jsp:include>
                <jsp:include page="partials/about/benefit-item.jsp">
                    <jsp:param name="img" value="../assets/imgs/icons/icon-benefit.svg"/>
                    <jsp:param name="title" value="FREE SHIPPING"/>
                    <jsp:param name="des" value="Free worldwide shipping on all Area order above $100"/>
                </jsp:include>
                <jsp:include page="partials/about/benefit-item.jsp">
                    <jsp:param name="img" value="../assets/imgs/icons/icon-benefit.svg"/>
                    <jsp:param name="title" value="FREE SHIPPING"/>
                    <jsp:param name="des" value="Free worldwide shipping on all Area order above $100"/>
                </jsp:include>
            </div>
        </div>

        <jsp:include page="common/subscribe.jsp"/>
        <jsp:include page="common/footer.jsp"/>
    </div>

    <jsp:include page="common/tail.jsp"/>
</body>
</html>
