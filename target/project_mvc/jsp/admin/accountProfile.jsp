<%@ page import="Model.User" %><%--
  Created by IntelliJ IDEA.
  User: Quang Tho
  Date: 04/01/2023
  Time: 15:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>

<html
        lang="en"
        class="light-style layout-menu-fixed"
        dir="ltr"
        data-theme="theme-default"
        data-assets-path="../assets/"
        data-template="vertical-menu-template-free"
>
<head>
  <meta charset="utf-8" />
  <meta
          name="viewport"
          content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0"
  />

  <title>Profile </title>

  <meta name="description" content="" />

  <!-- Favicon -->
  <link rel="icon" type="image/x-icon" href="../../../assets/img_admin/favicon/favicon.ico" />

  <!-- Fonts -->
  <link rel="preconnect" href="https://fonts.googleapis.com" />
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
  <link
          href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap"
          rel="stylesheet"
  />

  <!-- Icons. Uncomment required icon fonts -->
  <link rel="stylesheet" href="../assets/vendor/fonts/boxicons.css" />

  <!-- Core CSS -->
  <link rel="stylesheet" href="../assets/vendor/css/core.css" class="template-customizer-core-css" />
  <link rel="stylesheet" href="../assets/vendor/css/theme-default.css" class="template-customizer-theme-css" />
  <link rel="stylesheet" href="../assets/vendor/css/demo.css" />

  <!-- Vendors CSS -->
  <link rel="stylesheet" href="../assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.css" />
  <!--myprofile-->
  <!--  <link rel="shortcut icon" href="assets/images/fav.jpg">-->
  <link rel="stylesheet" href="../assets/vendor/css/bootstrap.min.css">
  <link rel="stylesheet" href="../assets/vendor/css/fontawsom-all.min.css">
  <link rel="stylesheet" type="text/css" href="../assets/vendor/css/style.css" />
  <!-- Page CSS -->

  <!-- Helpers -->
  <script src="../assets/vendor/js/helpers.js"></script>

  <!--! Template customizer & Theme config files MUST be included after core stylesheets and helpers.js in the <head> section -->
  <!--? Config:  Mandatory theme config file contain global vars & default theme options, Set your preferred theme option in this file.  -->
  <script src="../assets/js_admin/config.js"></script>
</head>

<body>
<%
  User user = (User) request.getAttribute("user");
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
          <h4 class="fw-bold py-3 mb-4"><span class="text-muted fw-light">Thông tin tài khoản</h4>
          <hr class="my-5" />
          <div class="container-fluid overcover">
            <div class="container profile-box">
              <div class="row">
                <div class="col-lg-4 col-md-5 leftgh">
                  <div class="name-info">
                    <h1>
                      Tên: <%= ((user.getFirstName() == null) ? "" : user.getFirstName()) + " " + (((user.getLastName() == null) ? "" : user.getLastName()))%>
                    </h1>

                    <div class="row no-margin">
                      <div class="col-4 no-padding">
                        Số điện thoại
                      </div>
                      <div class="col-8">
                        <%=(user.getPhone() == null) ? "" : user.getPhone()%>
                      </div>
                    </div>
                    <div class="row no-margin">
                      <div class="col-4 no-padding">
                        Email
                      </div>
                      <div class="col-8">
                        <%=user.getEmail()%>
                      </div>
                    </div>
                    <div class="row no-margin">
                      <div class="col-4 no-padding">
                        Quốc gia
                      </div>
                      <div class="col-8">
                        <%=(user.getCountry() == null) ? "" : user.getCountry()%>
                      </div>
                    </div>
                    <div class="row no-margin">
                      <div class="col-4 no-padding">
                        Thành phố
                      </div>
                      <div class="col-8">
                        <%=(user.getCity() == null) ? "" : user.getCity()%>
                      </div>
                    </div>
                    <div class="row no-margin">
                      <div class="col-4 no-padding">
                        Quận/Huyện
                      </div>
                      <div class="col-8">
                        <%=(user.getDistrict() == null) ? "" : user.getDistrict()%>
                      </div>
                    </div>
                    <div class="row no-margin">
                      <div class="col-4 no-padding">
                        Địa chỉ
                      </div>
                      <div class="col-8">
                        <%=(user.getAddress() == null) ? "" : user.getAddress()%>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
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
<!-- / Layout wrapper -->



<!-- Core JS -->
<!-- build:js assets/vendor/js/core.js -->
<script src="../assets/vendor/js/jquery/jquery.js"></script>
<script src="../assets/vendor/js/popper/popper.js"></script>
<script src="../assets/vendor/js/bootstrap.js"></script>
<script src="../assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>

<script src="../assets/vendor/js/menu.js"></script>
<!-- endbuild -->
<!--myprofile-->
<script src="../assets/js_admin/jquery-3.2.1.min.js"></script>
<script src="../assets/js_admin/popper.min.js"></script>
<script src="../assets/js_admin/bootstrap.min.js"></script>
<script src="../assets/js_admin/script.js"></script>
<!-- Vendors JS -->

<!-- Main JS -->
<script src="../assets/js_admin/main.js"></script>

<!-- Page JS -->

<!-- Place this tag in your head or just before your close body tag. -->
<script async defer src="https://buttons.github.io/buttons.js"></script>
</body>
</html>
