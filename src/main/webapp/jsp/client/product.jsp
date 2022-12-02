<%--
  Created by IntelliJ IDEA.
  User: Quang Tho
  Date: 02/12/2022
  Time: 13:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <jsp:include page="common/head.jsp">
    <jsp:param name="title" value="FURNITURE | SẢN PHẨM"/>
  </jsp:include>
</head>
<body>
  <div id="container">
    <jsp:include page="common/menu.jsp">
      <jsp:param name="logged" value="<%= false %>"/>
      <jsp:param name="classes" value="menu-white sticky-menu"/>
    </jsp:include>
    <jsp:include page="common/searchBarMenu.jsp"/>
    <div class="head-bottom-breadcrumb">
      <div aria-label="breadcrumb">
        <ol class="breadcrumb color-black">
          <li class="breadcrumb-item monts" aria-current="page"><a href="#" class="color-black">Home</a></li>
          <li class="breadcrumb-item monts" aria-current="page">Product</li>
        </ol>
      </div>
    </div>

    <div class="product-container container-fluid">
      <div class="product row">
        <div class="product-images col-md-12 col-lg-7">
          <div class="product-gallery">
            <jsp:include page="partials/product/product-gallery-item.jsp">
              <jsp:param name="img" value="https://caston.familab.net/wp-content/uploads/2021/09/product_montana_collection_read_burma_plinthh3_front_ns_2.jpg"/>
              <jsp:param name="num" value="1/2"/>
            </jsp:include>
            <jsp:include page="partials/product/product-gallery-item.jsp">
              <jsp:param name="img" value="https://caston.familab.net/wp-content/uploads/2021/09/product_montana_read_yellow.jpg"/>
              <jsp:param name="num" value="2/2"/>
            </jsp:include>
          </div>
          <div class="gallery-action">
            <jsp:include page="partials/product/gallery-action-item.jsp">
              <jsp:param name="img" value="https://caston.familab.net/wp-content/uploads/2021/09/product_montana_collection_read_burma_plinthh3_front_ns_2.jpg"/>
            </jsp:include>
            <jsp:include page="partials/product/gallery-action-item.jsp">
              <jsp:param name="img" value="https://caston.familab.net/wp-content/uploads/2021/09/product_montana_read_yellow.jpg"/>
            </jsp:include>
          </div>
        </div>

        <jsp:include page="partials/product/product-detail.jsp"/>

        <div class="tabs-container">
          <div class="tabs-info-product container-fluid" id="tab-parent">
            <div class="tab-info-product_list nav nav-tabs" role="tablist">
              <div class="nav-item tab-item active" id="tab-description" role="tab" data-toggle="tab"
                   data-target="#content-des" aria-controls="content-des" aria-selected="true">DESCRIPTON</div>
              <div class="nav-item tab-item" id="tab-info" role="tab" data-toggle="tab" data-target="#content-info"
                   aria-controls="content-info" aria-selected="false">ADDITIONAL INFORMATION</div>
              <div class="nav-item tab-item" id="tab-reviews" role="tab" data-toggle="tab" data-target="#content-reviews"
                   aria-controls="content-reviews" aria-selected="false">REVIEWS <span class="reviews-number">(4)</span></div>
            </div>

            <div class="content-list tab-content">
              <jsp:include page="partials/product/tab-content-des.jsp"/>
              <jsp:include page="partials/product/tab-content-info.jsp"/>
              <jsp:include page="partials/product/tab-review.jsp"/>
            </div>

            <div class="products-container">
              <div class="products">
                <div class="product_title monts">You may so like</div>
                <div class="container-fluid">
                  <div class="product-list row mb-5 ">
                    <jsp:include page="common/card.jsp">
                      <jsp:param name="type" value="1"/>
                    </jsp:include>
                    <jsp:include page="common/card.jsp">
                      <jsp:param name="type" value="1"/>
                    </jsp:include>
                    <jsp:include page="common/card.jsp">
                      <jsp:param name="type" value="1"/>
                    </jsp:include>
                    <jsp:include page="common/card.jsp">
                      <jsp:param name="type" value="1"/>
                    </jsp:include>
                  </div>
                </div>
              </div>
            </div>

            <div class="products-container">
              <div class="products">
                <div class="product_title monts">Related products</div>
                <div class="container-fluid">
                  <div class="product-list row mb-5 ">
                    <jsp:include page="common/card.jsp">
                      <jsp:param name="type" value="1"/>
                    </jsp:include>
                    <jsp:include page="common/card.jsp">
                      <jsp:param name="type" value="1"/>
                    </jsp:include>
                    <jsp:include page="common/card.jsp">
                      <jsp:param name="type" value="1"/>
                    </jsp:include>
                    <jsp:include page="common/card.jsp">
                      <jsp:param name="type" value="1"/>
                    </jsp:include>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <jsp:include page="common/footer.jsp"/>
  </div>

  <jsp:include page="common/tail.jsp"/>
</body>
</html>
