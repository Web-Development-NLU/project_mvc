<%@ page import="java.util.ArrayList" %>
<%@ page import="Model.User" %>
<%@ page import="Model.TypeAccount" %>
<%@ page import="Model.StatusAccount" %>
<%@ page import="DTO.AuthorizationData" %>
<%@ page import="java.util.Objects" %><%--
  Created by IntelliJ IDEA.
  User: Quang Tho
  Date: 04/01/2023
  Time: 10:22
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
        data-assets-path="../assets/"
        data-template="vertical-menu-template-free"
>
<head>
  <meta charset="utf-8" />
  <meta
          name="viewport"
          content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0"/>

  <title>Account admin </title>
  <meta name="description" content="" />

  <link rel="preconnect" href="https://fonts.googleapis.com" />
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
  <link
          href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap"
          rel="stylesheet"/>
  <link rel="stylesheet" href="../../assets/vendor/fonts/boxicons.css" />
  <link rel="stylesheet" href="../../assets/vendor/css/style.css">
  <link rel="stylesheet" href="../../assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.css" />
  <script src="../../assets/vendor/js/helpers.js"></script>
  <script src="../../assets/js_admin/config.js"></script>

</head>

<body>
<%
  ArrayList<User> users = (ArrayList<User>) request.getAttribute("users");
  boolean param = (boolean) request.getAttribute("admin");
  AuthorizationData data = (AuthorizationData) session.getAttribute("adminLogin");
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
          <h4 class="fw-bold py-3 mb-4"><span class="text-muted fw-light">Tài khoản /</span> Tài khoản admin</h4>
          <c:if test="<%=param%>">
            <a href="${pageContext.request.contextPath}/admin/account/createAdmin"> <button type="button" class="btn btn-outline-dark" style="float: right">Tạo một admin</button></a>
          </c:if>

          <hr class="my-5" />
          <!-- Basic Bootstrap Table -->
          <div class="card">
            <h5 class="card-header">Thông tin</h5>
            <div class="table-responsive text-nowrap">
              <table class="table">
                <thead>
                <tr>
                  <th>Tên admin</th>
                  <th>Email</th>
                  <th>Loại</th>
                  <th>Trạng thái</th>
                  <th>Thao tác</th>
                </tr>
                </thead>
                <tbody class="table-border-bottom-0">
                <c:forEach items="<%=users%>" var="user">
                  <c:set var="type" value="${user.type}" scope="request"/>
                  <c:set var="status" value="${user.status}" scope="request"/>
                  <c:set var="fname" value="${user.firstName}" scope="request"/>
                  <c:set var="lname" value="${user.lastName}" scope="request"/>
                  <%
                    String name;
                    if((request.getAttribute("lname") == null) || (request.getAttribute("fname") == null)){
                      name = "Admin User Anonymous";
                    }else {
                      name = request.getAttribute("fname").toString() + " " + request.getAttribute("lname").toString();
                    }

                    String type;

                    if(Integer.parseInt(String.valueOf(request.getAttribute("type"))) == TypeAccount.ADMIN.ordinal()) {
                      type = "ADMIN";
                    }else if(Integer.parseInt(String.valueOf(request.getAttribute("type"))) == TypeAccount.ROOT_ADMIN.ordinal()){
                      type = "ROOT";
                    }else {
                      type = "USER";
                    }

                    String status;
                    String action;
                    if(Integer.parseInt(String.valueOf(request.getAttribute("status"))) == StatusAccount.ACTIVE.ordinal()) {
                      status = "Đã kích hoạt";
                      action = "Hạn chế tài khoản";
                    }else {
                      status = "Chưa kích hoạt";
                      action = "Gỡ hạn chế tài khoản";
                    }
                  %>
                  <tr>
                    <td><i class="fab fa-angular fa-lg text-danger me-3"></i> <strong><%=name%></strong></td>
                    <td><c:out value="${user.email}"/></td>
                    <td><span class="badge bg-label-primary me-1"><%=type%></span></td>
                    <td><span class="badge bg-label-primary me-1"><%=status%></span></td>
                    <td>
                      <div class="dropdown">
                        <button type="button" class="btn p-0 dropdown-toggle hide-arrow" data-bs-toggle="dropdown">
                          <i class="bx bx-dots-vertical-rounded"></i>
                        </button>
                        <div class="dropdown-menu">
                          <a class="dropdown-item" href="${pageContext.request.contextPath}/admin/profileAccount?user=${user.id}"
                          ><i class="bx bx-edit-alt me-1"></i> Chi tiết</a
                          >
                          <c:if test="<%=param%>">
                            <a class="dropdown-item" href="${pageContext.request.contextPath}/admin/account/resetPass?user=${user.id}"
                            ><i class="bx bx-edit-alt me-1"></i> Đặt lại mật khẩu</a
                            >
                            <a class="dropdown-item" href="${pageContext.request.contextPath}/admin/changeStatus?user=${user.id}"
                            ><i class="bx bx-trash me-1"></i>
                              <%=action%>
                            </a
                            >
                          </c:if>
                          <c:if test="<%=data.getType() == TypeAccount.ROOT_ADMIN.ordinal()%>">
                            <a class="dropdown-item" href="${pageContext.request.contextPath}/admin/deleteAccount?type=<%=param ? "admin" : "user"%>&user=${user.id}"
                            ><i class="bx bx-trash me-1"></i> Xóa</a
                            >
                          </c:if>
                        </div>
                      </div>
                    </td>
                  </tr>
                </c:forEach>
                </tbody>
              </table>
            </div>
          </div>
          <!--/ Basic Bootstrap Table -->

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
<script src="../../assets/vendor/libs/jquery/jquery.js"></script>
<script src="../../assets/vendor/libs/popper/popper.js"></script>
<script src="../../assets/vendor/js/bootstrap.js"></script>
<script src="../../assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>

<script src="../../assets/vendor/js/menu.js"></script>
<!-- endbuild -->

<!-- Vendors JS -->

<!-- Main JS -->
<script src="../../assets/js_admin/main.js"></script>

<!-- Page JS -->

<!-- Place this tag in your head or just before your close body tag. -->
<script async defer src="https://buttons.github.io/buttons.js"></script>
</body>
</html>
