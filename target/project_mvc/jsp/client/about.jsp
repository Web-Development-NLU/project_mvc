<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="Model.Contact" %>
<%@ page import="Model.About" %><%--
  Created by IntelliJ IDEA.
  User: Quang Tho
  Date: 01/12/2022
  Time: 13:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    About about = (About) request.getAttribute("about");
    String success = (request.getAttribute("success") == null) ? null : request.getAttribute("success").toString();
%>
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
                <jsp:param name="page" value="Về chúng tôi"/>
            </jsp:include>
        </header>
        <jsp:include page="partials/about/info-card-lg.jsp">
            <jsp:param name="value" value="<%=about.getIntro()%>"/>
        </jsp:include>
        <jsp:include page="partials/about/info-card-sm.jsp">
            <jsp:param name="value" value="<%=about.getMission()%>"/>
            <jsp:param name="title" value="NHIỆM VỤ CỦA CHÚNG TÔI"/>
            <jsp:param name="type" value="1"/>
        </jsp:include>
        <jsp:include page="partials/about/info-card-sm.jsp">
            <jsp:param name="value" value="<%=about.getOurValue()%>"/>
            <jsp:param name="title" value="GIÁ TRỊ CỐT LÕI"/>
            <jsp:param name="type" value="2"/>
        </jsp:include>

        <div class="about-benefit container-fluid">
            <div class="row">
                <jsp:include page="partials/about/benefit-item.jsp">
                    <jsp:param name="img" value="../assets/imgs/icons/icon-benefit.svg"/>
                    <jsp:param name="title" value="Miễn phí giao hàng"/>
                    <jsp:param name="des" value="Miễn phí giao hàng cho những đơn có giá trị trên 5 triệu đồng"/>
                </jsp:include>
                <jsp:include page="partials/about/benefit-item.jsp">
                    <jsp:param name="img" value="../assets/imgs/icons/icon-benefit.svg"/>
                    <jsp:param name="title" value="Sản phẩm chất lượng cao"/>
                    <jsp:param name="des" value="Được sử dụng từ những nguyên vật liệu cao cấp"/>
                </jsp:include>
                <jsp:include page="partials/about/benefit-item.jsp">
                    <jsp:param name="img" value="../assets/imgs/icons/icon-benefit.svg"/>
                    <jsp:param name="title" value="Được chứng nhận"/>
                    <jsp:param name="des" value="Được quốc tế công nhận là các sản phẩm có chất lượng cao và đảm bảo độ bền lâu trong quá trình sử dụng"/>
                </jsp:include>
            </div>
        </div>

        <jsp:include page="common/subscribe.jsp">
            <jsp:param name="page" value="about"/>
        </jsp:include>
        <c:if test="<%=success != null%>">
            <div class="alert-success alert alert-dismissible fade show fixed-top" role="alert">
                <strong>Thành công</strong> <%=success%>
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
        </c:if>
        <jsp:include page="common/footer.jsp"/>
    </div>

    <jsp:include page="common/tail.jsp"/>
</body>
</html>
