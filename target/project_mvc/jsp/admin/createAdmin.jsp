<%--
  Created by IntelliJ IDEA.
  User: Quang Tho
  Date: 04/01/2023
  Time: 12:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
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
          content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0"/>

  <title>Order Tables </title>

  <meta name="description" content="" />

  <!-- Favicon -->
  <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/assets/img_admin/favicon/favicon.ico" />

  <!-- Fonts -->
  <link rel="preconnect" href="https://fonts.googleapis.com" />
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
  <link
          href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap"
          rel="stylesheet"
  />

  <!-- Icons. Uncomment required icon fonts -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/fonts/boxicons.css" />

  <!-- Core CSS -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/css/style.css">
  <!-- Vendors CSS -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.css" />

  <!-- Page CSS -->

  <!-- Helpers -->
  <script src="${pageContext.request.contextPath}/assets/vendor/js/helpers.js"></script>

  <script src="${pageContext.request.contextPath}/assets/js_admin/config.js"></script>
</head>

<body>
<%
  String error = (request.getAttribute("error") == null) ? null : request.getAttribute("error").toString();
  String email = (request.getAttribute("email") == null) ? null : request.getAttribute("email").toString();
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
          <h4 class="fw-bold py-3 mb-4"><span class="text-muted fw-light">Tạo/</span> Tài khoản admin</h4>
          <hr class="my-5" />
          <!-- Basic with Icons -->
          <div class="col-xxl">
            <div class="card mb-4">
              <div class="card-header d-flex align-items-center justify-content-between">
                <h5 class="mb-0">Thông tin account</h5>
              </div>
              <c:if test="<%=error != null%>">
                <div class="alert alert-danger" role="alert"><%=error%></div>
              </c:if>
              <div class="card-body">
                <form action="${pageContext.request.contextPath}/admin/account/createAdmin" method="post">
                  <div class="row mb-3">
                    <label class="col-sm-2 col-form-label" for="basic-icon-default-email">Email</label>
                    <div class="col-sm-10">
                      <div class="input-group input-group-merge">
                        <span class="input-group-text"><i class="bx bx-envelope"></i></span>
                        <input
                                type="email"
                                id="basic-icon-default-email"
                                class="form-control"
                                placeholder="john.doe"
                                aria-label="john.doe"
                                aria-describedby="basic-icon-default-email2"
                                name="email"
                                value="<%=(email == null) ? "" : email%>"
                                required
                        />
                      </div>
                    </div>
                  </div>

                  <div class="row justify-content-end">
                    <div class="col-sm-10">
                      <button type="submit" class="btn btn-primary">Tạo</button>
                    </div>
                  </div>
                </form>
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


<!-- Core JS -->
<!-- build:js assets/vendor/js/core.js -->
<script src="${pageContext.request.contextPath}/assets/vendor/libs/jquery/jquery.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/libs/popper/popper.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/js/bootstrap.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>

<script src="${pageContext.request.contextPath}/assets/vendor/js/menu.js"></script>
<!-- endbuild -->

<!-- Vendors JS -->

<!-- Main JS -->
<script src="${pageContext.request.contextPath}/assets/js_admin/main.js"></script>

<!-- Page JS -->

<!-- Place this tag in your head or just before your close body tag. -->
<script async defer src="https://buttons.github.io/buttons.js"></script>
</body>
</html>
