<%@ page import="Model.Code" %><%--
  Created by IntelliJ IDEA.
  User: zxc
  Date: 02/Jan/23
  Time: 4:16 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
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

  <title>Create code</title>

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
  Code code = (Code) request.getAttribute("code");
  boolean errorInput = (Boolean) request.getAttribute("errorInput");
  boolean errorCategoryId = (boolean) request.getAttribute("errorCategoryId");
  boolean errorProductId = (boolean) request.getAttribute("errorProductId");
  boolean errorValueCode = (boolean) request.getAttribute("errorValueCode");
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
          <h4 class="fw-bold py-3 mb-4"><span class="text-muted fw-light">Create/</span> Create Code</h4>
          <hr class="my-5"/>
          <div class="col-xxl">
            <div class="card mb-4">
              <div class="card-header d-flex align-items-center justify-content-between">
                <h5 class="mb-0">Code Information</h5>
              </div>
              <div class="card-body">
                <form action="${pageContext.request.contextPath}/admin/createCode" method="post">
                  <div class="row mb-3" style="margin-bottom: 0 !important;">
                    <label class="col-sm-2 col-form-label" for="value">Giá trị</label>
                    <div class="col-sm-10" style="width: 72.7%">
                      <input type="text" class="form-control" id="value" name="value"
                              placeholder="Giá trị" required value="${code.value}"/>
                    </div>
                    <div class="col-sm-10" style="display: inline-block;width: 10.6%; padding-right: 0">
                      <button type="button" class="btn btn-primary" id="btnGetCode">Lấy mã</button>
                    </div>
                    <div class="" id="error_code" style="color: red; padding: 8px 0;margin-left: 17.8%; min-height: 16px">${errorValueCode == true ? "Giá trị này đã tồn tại":""}</div>
                  </div>
                  <div class="row mb-3" style="margin-bottom: 0 !important;">
                    <label class="col-sm-2 col-form-label" for="categoryId">Mã danh mục</label>
                    <div class="col-sm-10">
                      <input type="text" class="form-control" id="categoryId" name="categoryId"
                            style="${errorCategoryId == true ? "border: 1px solid red" : "border: 1px solid #d9dee3"}" placeholder="Mã danh mục" value="${code.categoryId > 0 ? code.categoryId : ""}"/>
                    </div>
                    <div class="" id="error_categoryId" style="color: red; padding: 8px 0;margin-left: 17.8%; min-height: 16px">${errorCategoryId == true ? "Mã sản phẩm không tồn tại" : ""}</div>
                  </div>
                  <div class="row mb-3" style="margin-bottom: 0 !important;">
                    <label class="col-sm-2 col-form-label" for="productId">Mã sản phẩm</label>
                    <div class="col-sm-10">
                      <input type="text" class="form-control" id="productId" name="productId"
                            style="${errorProductId == true ? "border: 1px solid red" : "border: 1px solid #d9dee3"}" placeholder="Mã sản phẩm" value="${code.productId != "null" ? code.productId : ""}"/>
                    </div>
                    <div class="" id="error_input" style="color: red; padding: 8px 0;margin-left: 17.8%; min-height: 16px">${errorInput == true ? "Chỉ nhập 1 trong 2 trường mã danh mục hoặc mã sản phẩm và cả 2 trường không đồng thời rỗng": ""}${errorInput == true && errorProductId == true ? "<br>" :""}${errorProductId == true ? "Mã sản phẩm không tồn tại" : ""}</div>
                  </div>
                  <div class="row justify-content-end">
                    <div class="col-sm-10">
                      <button type="submit" class="btn btn-primary" id="creatCode">Tạo</button>
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
<script src="/assets/js_admin/main.js"></script>
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
<script src="/assets/js_admin/createCode.js"></script>
</body>
</html>
