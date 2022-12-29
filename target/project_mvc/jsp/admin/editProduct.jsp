<%--
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
                <form action="${pageContext.request.contextPath}/createProduct" method="post">
                  <div class="row mb-3">
                    <label class="col-sm-2 col-form-label" for="name">Name
                      Product</label>
                    <div class="col-sm-10">
                      <input type="text" class="form-control" id="name" name="name"
                             placeholder="name"/>
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
                      />
                    </div>
                  </div>
                  <div class="row mb-3">
                    <label class="col-sm-2 col-form-label"
                           for="category">Category:</label>
                    <div class="col-sm-10">
                      <select name="category" id="category"
                              class="chosen-select form-control form-control-chosen">
                        <option>Choose...</option>
                        <option>jQuery</option>
                      </select>
                    </div>
                  </div>
                  <div class="row mb-3">
                    <label class="col-sm-2 col-form-label"
                           for="size">Size:</label>
                    <div class="col-sm-10">
                      <select name="size" id="size"
                              class="chosen-select form-control form-control-chosen">
                        <option>Choose...</option>
                        <option>jQuery</option>
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
                      />
                    </div>
                  </div>
                  <div class="row mb-3">
                    <label class="col-sm-2 col-form-label" for="color">Color</label>
                    <div class="col-sm-10">
                      <select name="color" id="color" multiple
                              class="chosen-select form-control form-control-chosen">
                        <option>Choose...</option>
                        <option>jQuery</option>
                      </select>
                    </div>
                  </div>
                  <div class="row mb-3">
                    <label class="col-sm-2 col-form-label" for="pattern">Pattern</label>
                    <div class="col-sm-10">
                      <select name="pattern" id="pattern" multiple
                              class="chosen-select form-control form-control-chosen">
                        <option>Choose...</option>
                        <option>jQuery</option>
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
                      />
                    </div>
                  </div>
                  <div class="row mb-3">
                    <label class="col-sm-2 col-form-label" for="product-thumbnails">Images</label>
                    <div class="col-sm-10">
                      <div class="input-group input-group-merge">
                        <img src="/assets/img_admin/product/table.png" style="width: 10rem" />
                        <img src="/assets/img_admin/product/img.png" style="width: 10rem" />
                      </div>
                      <input type="text" class="form-control" id="product-thumbnails"
                             name="thumbnail" placeholder="Link of image, separated by comma">
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
                            ></textarea>
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
                            ></textarea>
                    </div>
                  </div>
                  <div class="row justify-content-end">
                    <div class="col-sm-10">
                      <button type="button" class="btn btn-primary">Create</button>
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
</body>
</html>

