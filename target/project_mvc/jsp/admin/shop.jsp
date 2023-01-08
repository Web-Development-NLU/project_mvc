<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="Model.Pattern" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="Model.Shop" %>
<%@ page import="Model.TypeShop" %><%--
  Created by IntelliJ IDEA.
  User: lyha8
  Date: 12/30/2022
  Time: 4:31 PM
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

  <title>Pattern </title>

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
  ArrayList<Shop> shops= (ArrayList<Shop>) request.getAttribute("shops");
  int type = Integer.parseInt(request.getAttribute("type").toString());
  boolean isDisableCreate;
  if(type == TypeShop.SMALL.ordinal()) {
    isDisableCreate = shops.size() >= 3;
  }else {
    isDisableCreate = shops.size() >= 2;
  }
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
          <h4 class="fw-bold py-3 mb-4"><span class="text-muted fw-light">QUẢN LÝ /</span> CỬA HÀNG</h4>
          <c:choose>
            <c:when test="<%=isDisableCreate%>">
              <a href="${pageContext.request.contextPath}/admin/createShop?type=<%=type%>">
                <button type="button" class="btn btn-outline-dark" style="float: right" disabled>Tạo mới</button>
              </a>
            </c:when>
            <c:otherwise>
              <a href="${pageContext.request.contextPath}/admin/createShop?type=<%=type%>">
                <button type="button" class="btn btn-outline-dark" style="float: right">Tạo mới</button>
              </a>
            </c:otherwise>
          </c:choose>

          <hr class="my-5" />

          <!-- Bootstrap Dark Table -->
          <div class="card">
            <h5 class="card-header">THÔNG TIN VỀ QUẢN LÝ CỬA HÀNG</h5>
            <div class="table-responsive text-nowrap">
              <table class="table table-dark1">
                <thead>
                <tr>
                  <th>ID</th>
                  <th>TÊN CỬA HÀNG</th>
                  <th>NGÀY TẠO</th>
                  <th>CHỈNH SỬA</th>
                </tr>
                </thead>
                <tbody class="table-border-bottom-0">
                <c:forEach items="<%= shops %>" var="shop">
                  <tr>
                    <td>${shop.id}</td>
                    <td>${shop.name}</td>
                    <td>${shop.createdAt}</td>
                    <td>
                      <div class="dropdown">
                        <button type="button" class="btn p-0 dropdown-toggle hide-arrow" data-bs-toggle="dropdown">
                          <i class="bx bx-dots-vertical-rounded"></i>
                        </button>
                        <div class="dropdown-menu">
                          <a class="dropdown-item" href="${pageContext.request.contextPath}/admin/editShop?id=${shop.id}&type=<%=type%>">
                            <i class="bx bx-edit-alt me-1"></i> Chỉnh sửa</a>
                          <a class="dropdown-item" href="${pageContext.request.contextPath}/admin/deleteShop?id=${shop.id}&type=<%=type%>"
                          ><i class="bx bx-trash me-1"></i> Xóa</a>
                        </div>
                      </div>
                    </td>
                  </tr>
                </c:forEach>
                </tbody>
              </table>
            </div>
          </div>
          <!--/ Bootstrap Dark Table -->
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
<!-- Page JS -->

<!-- Place this tag in your head or just before your close body tag. -->
<script async defer src="https://buttons.github.io/buttons.js"></script>
</body>
</html>