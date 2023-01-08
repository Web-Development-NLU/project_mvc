<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="Model.Pattern" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.text.DecimalFormat" %><%--
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
  <link rel="stylesheet" href="/assets/css/components/search.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
        integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
        crossorigin="anonymous" referrerpolicy="no-referrer"/>
  <!-- Page CSS -->

  <!-- Helpers -->
  <script src="/assets/vendor/js/helpers.js"></script>

  <script src="/assets/js_admin/config.js"></script>

</head>

<body>
<%
  ArrayList<Pattern> patterns= (ArrayList<Pattern>) request.getAttribute("patterns");
  int pagination = (int) request.getAttribute("pagination");
  String numPage = DecimalFormat.getIntegerInstance().format(Double.parseDouble(request.getAttribute("numPage").toString()));
  int totalPage = Integer.parseInt(numPage);
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
          <h4 class="fw-bold py-3 mb-4"><span class="text-muted fw-light">QUẢN LÝ /</span> MẪU</h4>

          <a href="${pageContext.request.contextPath}/admin/createPattern">
            <button type="button" class="btn btn-outline-dark" style="float: right">Thêm mẫu mới</button>
          </a>
          <hr class="my-5" />

          <div class="row">
            <nav aria-label="breadcrumb" class="col-lg-6">
              <ol class="breadcrumb">
                <li class="breadcrumb-item">
                  <a href="javascript:void(0);"> Trang <%=pagination%></a>
                </li>
                <li class="breadcrumb-item">
                  <a href="javascript:void(0);"><%= numPage%></a>
                </li>
              </ol>
              <ol style="padding-left: 0">
                <form action="${pageContext.request.contextPath}/admin/pattern" class="form-search">
                  <input class="ip_search" type="search" name="pattern" placeholder="Tìm kiếm..." style="background: white; border-radius: 10px; width: 50%" >
                  <button class="btn-search" style="background: #696CFF; border-radius: 50%; border: 1px solid transparent; outline: none; width: 44px;height: 44px; transform: translate(10px,4px)">
                    <i class="fa-solid fa-magnifying-glass" style="color: #FFF3FF;transform: translate(1px,1px);"></i>
                  </button>
                </form>
              </ol>
            </nav>
            <nav aria-label="Page navigation" class="col-lg-6" style="display: <%=totalPage == 1 ? "none" : "block"%>">
              <ul class="pagination justify-content-end">
                <li class="page-item prev" style=" display: <%=( pagination ==1) ? "none" : "block"%>">
                  <a class="page-link" href="${pageContext.request.contextPath}/admin/pattern?page=<%=pagination - 1%>">
                    <i class="tf-icon bx bx-chevrons-left"></i
                    ></a>
                </li>
                <li class="page-item">
                  <a class="page-link" href="${pageContext.request.contextPath}/admin/pattern?page=<%=pagination%>"><%=pagination%></a>
                </li>
                <li class="page-item next" style="display:<%=(pagination == totalPage) ? "none" : "block"%>">
                  <a class="page-link" href="${pageContext.request.contextPath}/admin/pattern?page=<%=pagination + 1%>">
                  <i class="tf-icon bx bx-chevrons-right"></i
                  ></a>
                </li>
              </ul>
            </nav>
          </div>

          <!-- Bootstrap Dark Table -->
          <c:choose>
            <c:when test="<%=patterns.size() == 0%>">
              <div class="card">
                <h5 class="card-header" style="text-align: center">Không có mẫu nào</h5>
              </div>
            </c:when>
            <c:otherwise>
              <div class="card">
                <h5 class="card-header">THÔNG TIN VỀ QUẢN LÝ MẪU</h5>
                <div class="table-responsive text-nowrap">
                  <table class="table table-dark1">
                    <thead>
                    <tr>
                      <th>MÃ MẪU</th>
                      <th>TÊN MẪU</th>
                      <th>NGÀY TẠO</th>
                      <th>CHỈNH SỬA</th>
                    </tr>
                    </thead>
                    <tbody class="table-border-bottom-0">
                    <c:forEach items="<%= patterns %>" var="pattern">
                      <tr>
                        <td>${pattern.id}</td>
                        <td>${pattern.name}</td>
                        <td>${pattern.createdAt}</td>
                        <td>
                          <div class="dropdown">
                            <button type="button" class="btn p-0 dropdown-toggle hide-arrow" data-bs-toggle="dropdown">
                              <i class="bx bx-dots-vertical-rounded"></i>
                            </button>
                            <div class="dropdown-menu">
                              <a class="dropdown-item" href="${pageContext.request.contextPath}/admin/editPattern?id=${pattern.id}">
                                <i class="bx bx-edit-alt me-1"></i> Chỉnh sửa</a>
                              <a class="dropdown-item" href="${pageContext.request.contextPath}/admin/deletePattern?id=${pattern.id}" methods="post"
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
            </c:otherwise>
          </c:choose>
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