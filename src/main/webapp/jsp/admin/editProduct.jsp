<%@ page import="Model.Color" %>
<%@ page import="Model.Category" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="Model.Pattern" %>
<%@ page import="Model.Product" %>
<%@ page import="java.text.DecimalFormat" %>
<%@ page import="java.math.BigDecimal" %>
<%@ page import="java.util.Locale" %>
<%@ page import="org.apache.commons.lang3.LocaleUtils" %><%--
  Created by IntelliJ IDEA.
  User: Quang Tho
  Date: 29/12/2022
  Time: 11:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>

<html
        lang="en"
        class="light-style layout-menu-fixed"
        dir="ltr"
        data-theme="theme-default"
        data-assets-path="/assets/"
        data-template="vertical-menu-template-free"
>
<head>
  <meta charset="utf-8"/>
  <meta
          name="viewport"
          content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0"/>

  <title>Order Tables </title>

  <meta name="description" content=""/>

  <!-- Fonts -->
  <link rel="preconnect" href="https://fonts.googleapis.com"/>
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin/>
  <link
          href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap"
          rel="stylesheet"
  />

  <!-- Icons. Uncomment required icon fonts -->
  <link rel="stylesheet" href="/assets/vendor/fonts/boxicons.css"/>

  <!-- Core CSS -->
  <link rel="stylesheet" href="/assets/vendor/css/style.css">
  <!-- Vendors CSS -->
  <link rel="stylesheet" href="/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.css"/>
  <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/chosen/1.8.7/chosen.min.css">
  <link rel="stylesheet" href="/assets/vendor/css/component-chosen.min.css">

  <!-- Page CSS -->

  <!-- Helpers -->
  <script src="/assets/vendor/js/helpers.js"></script>

  <script src="/assets/js_admin/config.js"></script>

</head>

<body>
<%
  ArrayList<Color> colors = (ArrayList<Color>) request.getAttribute("colors");
  ArrayList<Category> categories = (ArrayList<Category>) request.getAttribute("categories");
  ArrayList<Pattern> patterns = (ArrayList<Pattern>) request.getAttribute("patterns");
  ArrayList<Pattern> patternOfProduct = (ArrayList<Pattern>) request.getAttribute("patternOfProduct");
  ArrayList<Color> colorOfProduct = (ArrayList<Color>) request.getAttribute("colorOfProduct");
  Product product = (Product) request.getAttribute("product");
%>
<!-- Layout wrapper -->
<div class="layout-wrapper layout-content-navbar">
  <div class="layout-container">
    <!-- Menu -->

    <jsp:include page="common/menu.jsp"/>
    <!-- / Menu -->

    <!-- Layout container -->
    <div class="layout-page">
      <!-- Navbar -->

      <jsp:include page="common/navbar.jsp"/>

      <!-- / Navbar -->

      <!-- Content wrapper -->
      <div class="content-wrapper">
        <!-- Content -->

        <div class="container-xxl flex-grow-1 container-p-y">
          <h4 class="fw-bold py-3 mb-4"><span class="text-muted fw-light">Edit product/</span> Create Product</h4>
          <hr class="my-5"/>
          <div class="col-xxl">
            <div class="card mb-4">
              <div class="card-header d-flex align-items-center justify-content-between">
                <h5 class="mb-0">Product Information</h5>
              </div>
              <div class="card-body">
                <form action="${pageContext.request.contextPath}/admin/editProduct?id=<%=product.getId()%>" method="post">
                  <div class="row mb-3">
                    <label class="col-sm-2 col-form-label" for="name">Tên sản phẩm
                      Product</label>
                    <div class="col-sm-10">
                      <input type="text" class="form-control" id="name" name="name"
                             placeholder="name" required value="<%=product.getName()%>"/>
                    </div>
                  </div>
                  <div class="row mb-3">
                    <label class="col-sm-2 col-form-label" for="price">Price</label>
                    <div class="col-sm-10">
                      <input
                              type="number"
                              class="form-control"
                              id="price"
                              placeholder="VNĐ"
                              name="price"
                              required
                              value="<%=(int) product.getPrice()%>"
                      />
                    </div>
                  </div>
                  <div class="row mb-3">
                    <label class="col-sm-2 col-form-label"
                           for="category">Danh mục:</label>
                    <div class="col-sm-10">
                      <select name="category" id="category"
                              class="chosen-select form-control form-control-chosen">
                        <c:forEach items="<%=categories%>" var="category">
                          <c:set var="id" value="<%=product.getCategoryId()%>"/>
                          <c:choose>
                            <c:when test="${category.id == id}">
                                <option value="${category.id}" selected>${category.name}</option>
                            </c:when>
                            <c:otherwise>
                                <option value="${category.id}">${category.name}</option>
                            </c:otherwise>
                          </c:choose>
                        </c:forEach>
                      </select>
                    </div>
                  </div>
                  <div class="row mb-3">
                    <label class="col-sm-2 col-form-label"
                           for="size">Size:</label>
                    <div class="col-sm-10">
                      <select name="size" id="size"
                              class="chosen-select form-control form-control-chosen" required>
                        <option value="<%=product.getSize()%>">Chọn kích cỡ</option>
                        <option value="1">Lớn</option>
                        <option value="2">Trung Bình</option>
                        <option value="3">Nhỏ</option>
                      </select>
                    </div>
                  </div>
                  <div class="row mb-3">
                    <label class="col-sm-2 col-form-label"
                           for="dimension">Dimensions:</label>
                    <div class="col-sm-10">
                      <input
                              type="text"
                              class="form-control"
                              id="dimension"
                              placeholder="2140 × 140 × 70 cm"
                              name="dimension"
                              value="<%= (product.getDimensions() == null) ? "" : product.getDimensions() %>"
                      />
                    </div>
                  </div>
                  <div class="row mb-3">
                    <label class="col-sm-2 col-form-label" for="color">Chọn màu sắc</label>
                    <div class="col-sm-10">
                      <select name="color" id="color" multiple
                              class="chosen-select form-control form-control-chosen">
<<<<<<< HEAD
                        <c:forEach items="<%=colorOfProduct%>" var="color">
                          <option value="${color.id}" selected>${color.name}</option>
                        </c:forEach>
=======
>>>>>>> dd3a0fbe692837a605eb4a4fbf4adeef8a21a2b5
                        <c:forEach items="<%=colors%>" var="color">
                          <option value="${color.id}" style="color: ${color.value}">${color.name}</option>
                        </c:forEach>
                      </select>
                    </div>
                  </div>
                  <div class="row mb-3">
                    <label class="col-sm-2 col-form-label" for="pattern">Kiểu dáng</label>
                    <div class="col-sm-10">
                      <select name="pattern" id="pattern" multiple
                              class="chosen-select form-control form-control-chosen">
<<<<<<< HEAD
                        <c:forEach items="<%=patternOfProduct%>" var="pattern">
                          <option value="${pattern.id}" selected>${pattern.name}</option>
                        </c:forEach>
=======
>>>>>>> dd3a0fbe692837a605eb4a4fbf4adeef8a21a2b5
                        <c:forEach items="<%=patterns%>" var="pattern">
                          <option value="${pattern.id}">${pattern.name}</option>
                        </c:forEach>
                      </select>
                    </div>
                  </div>
                  <div class="row mb-3">
                    <label class="col-sm-2 col-form-label" for="material">Main
                      Material</label>
                    <div class="col-sm-10">
                      <input
                              type="text"
                              class="form-control"
                              id="material"
                              placeholder="wooden"
                              name="material"
                              value="<%=(product.getMaterial() == null) ? "" : product.getMaterial()%>"
                      />
                    </div>
                  </div>
                  <div class="row mb-3">
                    <label class="col-sm-2 col-form-label" for="product-thumbnails">Images</label>
                    <div class="col-sm-10 upload-image">
                      <div class="input-group input-group-merge mb-3 upload-preview">
                      </div>
                      <textarea type="file" class="form-control" id="product-thumbnails"
                                name="thumbnail" placeholder="Link of image, separated by comma" multiple required><%=product.getThumbnail()%></textarea>
                    </div>
                  </div>
                  <div class="row mb-3">
                    <label class="col-sm-2 col-form-label"
                           for="basic-default-message">Short Description</label>
                    <div class="col-sm-10">
                            <textarea
                                    id="basic-default-message"
                                    class="form-control"
                                    placeholder="Product detail - Size - Color - Pattern"
                                    aria-label="Hi, Do you have a moment to talk Joe?"
                                    aria-describedby="basic-icon-default-message2"
                                    name="shortDescription"
                                    maxlength="255"
                            ><%=(product.getShortDescription() == null) ? "" : product.getShortDescription()%></textarea>
                    </div>
                  </div>
                  <div class="row mb-3">
                    <label class="col-sm-2 col-form-label"
                           for="basic-default-message">Description</label>
                    <div class="col-sm-10">
                            <textarea style="height: 10rem"
                                      id="basic-default-message2"
                                      class="form-control"
                                      placeholder="description about product"
                                      aria-describedby="basic-icon-default-message2"
                                      name="description"
                            ><%=(product.getDescription() == null) ? "" : product.getDescription()%></textarea>
                    </div>
                  </div>
                  <div class="row justify-content-end">
                    <div class="col-sm-10">
                      <button type="submit" class="btn btn-primary">Update</button>
                    </div>
                  </div>
                </form>
              </div>
            </div>
          </div>
          <!-- Basic with Icons -->

        </div>
        <!-- / Content -->

        <!-- Footer -->
        <footer class="content-footer footer bg-footer-theme">
          <div class="container-xxl d-flex flex-wrap justify-content-between py-2 flex-md-row flex-column">
            <div class="mb-2 mb-md-0">
              ©
              <script>
                document.write(new Date().getFullYear());
              </script>
              <a href="https://themeselection.com" target="_blank" class="footer-link fw-bolder"></a>
            </div>

          </div>
        </footer>
        <!-- / Footer -->

        <div class="content-backdrop fade"></div>
      </div>
      <!-- Content wrapper -->
    </div>
    <!-- / Layout page -->
  </div>

  <!-- Overlay -->
  <div class="layout-overlay layout-menu-toggle"></div>
</div>


<!-- Core JS -->
<!-- build:js assets/vendor/js/core.js -->
<script src="/assets/vendor/libs/jquery/jquery.js"></script>
<script src="/assets/vendor/libs/popper/popper.js"></script>
<script src="/assets/vendor/js/bootstrap.js"></script>
<script src="/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/chosen/1.8.7/chosen.jquery.min.js"></script>
<script src="/assets/vendor/js/menu.js"></script>
<script src="/assets/js/upload.js"></script>
<!-- endbuild -->

<!-- Vendors JS -->

<!-- Main JS -->
<script>
  $(".chosen-select").chosen({
    allow_single_deselect: true,
    width: '50%',
    no_results_text: "Không tìm thấy kết quả :"
  })
</script>
<!-- Page JS -->

<!-- Place this tag in your head or just before your close body tag. -->
<script async defer src="https://buttons.github.io/buttons.js"></script>
</body>
</html>

