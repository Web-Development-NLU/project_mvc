<%@ page import="java.text.DecimalFormat" %>
<%@ page import="Model.Order" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: zxc
  Date: 06/Jan/23
  Time: 4:29 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html
        lang="en"
        class="light-style layout-menu-fixed"
        dir="ltr"
        data-theme="theme-default"
        data-assets-path="../assets/"
        data-template="vertical-menu-template-free"
>
<head>
  <meta charset="utf-8"/>
  <meta
          name="viewport"
          content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0"/>

  <title>Thanh toán trước</title>

  <meta name="description" content=""/>

  <!-- Fonts -->
  <link rel="preconnect" href="https://fonts.googleapis.com"/>
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin/>
  <link
          href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap"
          rel="stylesheet"
  />

  <!-- Icons. Uncomment required icon fonts -->
  <link rel="stylesheet" href="../assets/vendor/fonts/boxicons.css"/>

  <!-- Core CSS -->
  <link rel="stylesheet" href="../assets/vendor/css/style.css">
  <!-- Vendors CSS -->
  <link rel="stylesheet" href="../assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.css"/>

  <!-- Page CSS -->

  <!-- Helpers -->
  <script src="../assets/vendor/js/helpers.js"></script>

  <script src="../assets/js_admin/config.js"></script>
</head>
<body>
<%
<%
  ArrayList<Order> orders = (ArrayList<Order>) request.getAttribute("orders");
  int pagination = (int) request.getAttribute("pagination");
  String numPage = DecimalFormat.getIntegerInstance().format(Double.parseDouble(request.getAttribute("numPage").toString()));
  int totalPage = Integer.parseInt(numPage);
%>
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
          <h4 class="fw-bold py-3 mb-4"><span class="text-muted fw-light">Đơn hàng</span>Thanh toán trước</h4>
          <%--                    <a href="${pageContext.request.contextPath}/admin/createCode">--%>
          <%--                        <button type="button" class="btn btn-outline-dark" style="float: right">Thêm mã giảm giá</button>--%>
          <%--                    </a>--%>
          <hr class="my-5"/>
          <div class="row">
            <nav aria-label="breadcrumb" class="col-lg-6">
              <ol class="breadcrumb">
                <li class="breadcrumb-item">
                  <a href="javascript:void(0);"> Trang <%=pagination%></a>
                </li>
                <li class="breadcrumb-item">
                  <a href="javascript:void(0);"><%=numPage%></a>
                </li>
              </ol>
            </nav>
            <!-- Basic Bootstrap Table -->
            <nav aria-label="Page navigation" class="col-lg-6">
              <ul class="pagination justify-content-end">
                <li class="page-item prev" style="display:<%=(pagination == 1) ? "none" : "block"%> ">
                  <a class="page-link" href="${pageContext.request.contextPath}/admin/order?page=<%= pagination - 1%>"
                  ><i class="tf-icon bx bx-chevrons-left"></i
                  ></a>
                </li>
                <li class="page-item">
                  <a class="page-link" href="${pageContext.request.contextPath}/admin/order?page=<%=pagination%>"><%=pagination%></a>
                </li>
                <li class="page-item">
                  <form action="${pageContext.request.contextPath}/admin/order" method="post">
                    <input
                            type="number"
                            class="form-control"
                            name="page"
                            autofocus
                            min="1"
                    />
                  </form>
                </li>
                <li class="page-item next" style="display:<%=(pagination == totalPage) ? "none" : "block"%> ">
                  <a class="page-link" href="${pageContext.request.contextPath}/admin/order?page=<%= pagination + 1%>"
                  ><i class="tf-icon bx bx-chevrons-right"></i
                  ></a>
                </li>
              </ul>
            </nav>
          </div>
          <div class="card">
            <h5 class="card-header">Table Basic</h5>
            <div class="table-responsive text-nowrap">
              <table class="table">
                <thead>
                <tr>
                  <th>ID</th>
                  <th>Thông tin chi tiết</th>
                  <th>Ngày tạo</th>
                </tr>
                </thead>
                <tbody class="table-border-bottom-0">
                <c:forEach items="<%= orders %>" var="order">
                  <tr>
                    <td><i class="fab fa-angular fa-lg text-danger me-3"></i> <strong>${order.id}</strong></td>
                    <td>${order.info}</td>
                    <td>${order.createdAt}</td>
                    <td>
                      <div class="dropdown">
                        <button type="button" class="btn p-0 dropdown-toggle hide-arrow"
                                data-bs-toggle="dropdown">
                          <i class="bx bx-dots-vertical-rounded"></i>
                        </button>
                        <div class="dropdown-menu">
                          <a class="dropdown-item" href="${pageContext.request.contextPath}/admin/deleteOrder?id=${order.id}"><i
                                  class="bx bx-trash me-1"></i> Delete</a>
                        </div>
                      </div>
                    </td>
                  </tr>
                </c:forEach>
                </tbody>
              </table>
            </div>
          </div>
        </div>
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
</body>
</html>
