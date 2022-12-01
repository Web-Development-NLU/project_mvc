<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="common/head.jsp">
        <jsp:param name="title" value="FURNITURE | TRANG CHỦ"/>
    </jsp:include>
</head>
<body>
    <div id="home-container">
        <header>
            <jsp:include page="common/menu.jsp">
                <jsp:param name="logged" value="<%= false %>"/>
            </jsp:include>
            <jsp:include page="common/searchBarMenu.jsp"/>
            <div class="head_bottom">
                <div id="slider" class="head_bottom-slider">
                    <div class="slider_item">
                        <img src="https://caston.familab.net/wp-content/uploads/2021/11/h1_slide_1.jpg" alt="">
                        <div class="slider_item-content">
                            <div class="slider_item-title color-white">NEW ARRIVALS</div>
                            <div class="slider_item-head color-white poppins">Design your home</div>
                            <div class="slider_item-action">
                                <a href="#"><button class="btn-text bgr-white hover-bg-trans">Shop now</button></a>
                            </div>
                        </div>
                    </div>
                    <div class="slider_item">
                        <img src="https://caston.familab.net/wp-content/uploads/2021/12/h3_slide_2.jpg" alt="">
                        <div class="slider_item-content">
                            <div class="slider_item-title color-white">NEW ARRIVALS</div>
                            <div class="slider_item-head color-white poppins">Design your home</div>
                            <div class="slider_item-action">
                                <a href="#"><button class="btn-text bgr-white hover-bg-trans">Shop now</button></a>
                            </div>
                        </div>
                    </div>
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
