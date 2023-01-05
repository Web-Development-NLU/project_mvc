<%@ page import="Model.User" %><%--
  Created by IntelliJ IDEA.
  User: Quang Tho
  Date: 04/01/2023
  Time: 12:56
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

  <title>Account settings</title>

  <meta name="description" content="" />

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
  <link rel="stylesheet" href="../assets/vendor/css/style.css">
  <!-- Vendors CSS -->
  <link rel="stylesheet" href="../assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.css" />

  <!-- Page CSS -->

  <!-- Helpers -->
  <script src="../assets/vendor/js/helpers.js"></script>

  <!--! Template customizer & Theme config files MUST be included after core stylesheets and helpers.js in the <head> section -->
  <!--? Config:  Mandatory theme config file contain global vars & default theme options, Set your preferred theme option in this file.  -->
  <script src="../assets/js_admin/config.js"></script>
</head>

<body>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>

<%
  User user = (User) request.getAttribute("user");
  String errorChangePass = (request.getAttribute("errorChangePass") == null) ? null : request.getAttribute("errorChangePass").toString();
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
          <h4 class="fw-bold py-3 mb-4"><span class="text-muted fw-light">Cài đặt /</span>Tài khoản</h4>

          <div class="row">
            <div class="col-md-12">

              <div class="card mb-4">
                <h5 class="card-header">Thông tin chi tiết</h5>
                <!-- Account -->
                <hr class="my-0" />
                <div class="card-body">
                  <form id="formAccountSettings" method="POST" onsubmit="return false">
                    <div class="row">
                      <div class="mb-3 col-md-6">
                        <label for="firstName" class="form-label">Tên</label>
                        <input
                                class="form-control"
                                type="text"
                                id="firstName"
                                name="firstName"
                                value="<%=(user.getFirstName() == null) ? "" : user.getFirstName()%>"
                                autofocus
                        />
                      </div>
                      <div class="mb-3 col-md-6">
                        <label for="lastName" class="form-label">Last Name</label>
                        <input class="form-control" type="text" name="lastName" id="lastName" value="<%=(user.getLastName() == null) ? "" : user.getLastName()%>" />
                      </div>
                      <div class="mb-3 col-md-6">
                        <label for="email" class="form-label">E-mail</label>
                        <input
                                class="form-control"
                                type="text"
                                id="email"
                                name="email"
                                value="<%=user.getEmail()%>"
                                placeholder="john.doe@example.com"
                                disabled
                        />
                      </div>
                      <div class="mb-3 col-md-6">
                        <label class="form-label" for="phoneNumber">Phone Number</label>
                        <div class="input-group input-group-merge">
                          <input
                                  type="text"
                                  id="phoneNumber"
                                  name="phoneNumber"
                                  class="form-control"
                                  placeholder="202 555 0111"
                                  value="<%=(user.getPhone() == null) ? "" : user.getPhone()%>"
                          />
                        </div>
                      </div>
                      <div class="mb-3 col-md-6">
                        <label for="country" class="form-label">Quốc gia</label>
                        <input class="form-control" type="text" id="country" name="country" placeholder="California" />
                      </div>
                      <div class="mb-3 col-md-6">
                        <label for="city" class="form-label">Thành phố</label>
                        <input class="form-control" type="text" id="city" name="city" placeholder="California" />
                      </div>
                      <div class="mb-3 col-md-6">
                        <label for="district" class="form-label">Quận/Huyện</label>
                        <input class="form-control" type="text" id="district" name="district" placeholder="California" />
                      </div>

                      <div class="mb-3 col-md-6">
                        <label for="address" class="form-label">Address</label>
                        <input type="text" class="form-control" id="address" name="address" placeholder="Address" />
                      </div>
                    </div>
                    <div class="mt-2">
                      <button type="submit" class="btn btn-primary me-2">Save changes</button>
                      <button type="reset" class="btn btn-outline-secondary">Cancel</button>
                    </div>
                  </form>
                </div>
                <!-- /Account -->
              </div>
              <div class="card">
                <h5 class="card-header">Đổi mật khẩu</h5>
                <c:if test="<%=errorChangePass != null%>">
                  <div class="alert alert-danger" role="alert"><%=errorChangePass%></div>
                </c:if>
                <div class="card-body">
                  <form id="formAccountDeactivation" action="${pageContext.request.contextPath}/admin/changePassword" method="post">
                    <div class="mb-3">
                      <div class="mb-3 col-md-6">
                        <label for="oldPassword" class="form-label">Mật khẩu cũ</label>
                        <input type="password" class="form-control" id="oldPassword" name="oldPassword" />
                      </div>
                      <div class="mb-3 col-md-6">
                        <label for="newPassword" class="form-label">Mật khẩu mới</label>
                        <input type="password" class="form-control" id="newPassword" name="newPassword" />
                      </div>
                    </div>
                    <button type="submit" class="btn btn-danger deactivate-account">Đặt lại mật khẩu</button>
                  </form>
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

<!-- Core JS -->
<!-- build:js assets/vendor/js/core.js -->
<script src="../assets/vendor/libs/jquery/jquery.js"></script>
<script src="../assets/vendor/libs/popper/popper.js"></script>
<script src="../assets/vendor/js/bootstrap.js"></script>
<script src="../assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>

<script src="../assets/vendor/js/menu.js"></script>
<!-- endbuild -->

<!-- Vendors JS -->

<!-- Main JS -->
<script src="../assets/js_admin/main.js"></script>

<!-- Page JS -->
<script src="../assets/js_admin/pages-account-settings-account.js"></script>

<!-- Place this tag in your head or just before your close body tag. -->
<script async defer src="https://buttons.github.io/buttons.js"></script>
</body>
</html>

