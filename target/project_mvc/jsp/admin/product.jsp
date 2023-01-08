<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="Model.Product" %>
<%@ page import="Model.Category" %>
<%@ page import="java.text.DecimalFormat" %>
<%@ page import="Model.StatusProduct" %>
<%@ page import="java.util.Objects" %>
<%@ page import="Controller.MyAccount" %><%--
  Created by IntelliJ IDEA.
  User: Quang Tho
  Date: 29/12/2022
  Time: 10:57
  To change this template use File | Settings | File Templates.
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
            content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0"
    />

    <title>Chair-page </title>

    <meta name="description" content=""/>

    <!-- Favicon -->
    <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/assets/img_admin/favicon/favicon.ico"/>

    <!-- Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com"/>
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin/>
    <link
            href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap"
            rel="stylesheet"
    />

    <!-- Icons. Uncomment required icon fonts -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/fonts/boxicons.css"/>

    <!-- Core CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/css/style.css">
    <!-- Vendors CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.css"/>

    <!-- Page CSS -->

    <!-- Helpers -->
    <script src="${pageContext.request.contextPath}/assets/vendor/js/helpers.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js_admin/config.js"></script>
</head>

<body>
<%
    ArrayList<Product> products = (ArrayList<Product>) request.getAttribute("products");
    Category category = (Category) request.getAttribute("category");
    int pagination = (int) request.getAttribute("pagination");
    int numPage = (int) request.getAttribute("numPage");
    String idParam = (category == null) ? "" : "id="+category.getId()+"&";
    String search = (request.getParameter("search") == null) ? "" : "search=" + request.getParameter("search") + "&";
    int end = pagination + 4 > numPage ? numPage : pagination + 4;
    int startOgirin = pagination - 4 > 0 ? (pagination -4) : 1;
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
                    <h4 class="fw-bold py-3 mb-4"><span class="text-muted fw-light">Sản phẩm /</span> <%=(category == null) ? "Tất cả sản phẩm" : category.getName()%></h4>
                    <a href="${pageContext.request.contextPath}/admin/createProduct">
                        <button type="button" class="btn btn-outline-dark" style="float: right">Thêm sản phẩm</button>
                    </a>

                    <hr class="my-5"/>
                    <div class="row mb-4">
                        <form action="${pageContext.request.contextPath}/admin/products?<%=idParam%>">
                            <div class="input-group">
                                <input type="text" class="form-control" name="search" placeholder="tên sản phẩm">
                                <button class="btn btn-outline-primary" type="submit" id="button-addon2">Tìm kiếm</button>
                            </div>
                        </form>
                    </div>

                    <div class="row">
                        <nav aria-label="breadcrumb" class="col-lg-6">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item">
                                    <a href="javascript:void(0);">Trang <%=pagination%></a>
                                </li>
                                <li class="breadcrumb-item">
                                    <a href="javascript:void(0);"><%=numPage%></a>
                                </li>
                            </ol>
                        </nav>
                        <!-- Basic Bootstrap Table -->
                        <nav aria-label="Page navigation" class="col-lg-6">
                            <ul class="pagination justify-content-end">
                                <li class="page-item prev">
                                    <a class="page-link" href="${pageContext.request.contextPath}/admin/products?<%=idParam + search%>page=<%=pagination - 1%>"
                                    ><i class="tf-icon bx bx-chevrons-left"></i
                                    ></a>
                                </li>
                                <c:forEach begin="<%=startOgirin%>" end="<%=pagination-1%>" var="i">
                                    <li class="page-item">
                                        <a class="page-link" href="${pageContext.request.contextPath}/admin/products?<%=idParam + search%>page=${i}">${i}</a>
                                    </li>
                                </c:forEach>
                                <c:forEach begin="<%=pagination%>" end="<%=end%>" var="i">
                                    <li class="page-item ${i == pagination ? "active" : ""}">
                                        <a class="page-link" href="${pageContext.request.contextPath}/admin/products?<%=idParam + search%>page=${i}">${i}</a>
                                    </li>
                                </c:forEach>

<%--                                <c:forEach begin="<%=start%>" end="<%=end%>" var="index">--%>
<%--                                    <c:set var="i" scope="request" value="${index}"/>--%>
<%--                                    <% int index = (int) request.getAttribute("i"); %>--%>
<%--                                    <c:choose>--%>
<%--                                        <c:when test="<%=index == pagination%>">--%>
<%--                                            <li class="page-item active">--%>
<%--                                                <a class="page-link" href="${pageContext.request.contextPath}/admin/products?<%=idParam + search%>page=<%=Integer.parseInt(request.getAttribute("i").toString())%>">--%>
<%--                                                    <%=Integer.parseInt(request.getAttribute("i").toString())%>--%>
<%--                                                </a>--%>
<%--                                            </li>--%>
<%--                                        </c:when>--%>
<%--                                        <c:otherwise>--%>
<%--                                            <li class="page-item">--%>
<%--                                                <a class="page-link" href="${pageContext.request.contextPath}/admin/products?<%=idParam + search%>page=<%=Integer.parseInt(request.getAttribute("i").toString())%>">--%>
<%--                                                    <%=Integer.parseInt(request.getAttribute("i").toString())%>--%>
<%--                                                </a>--%>
<%--                                            </li>--%>
<%--                                        </c:otherwise>--%>
<%--                                    </c:choose>--%>
<%--                                </c:forEach>--%>
                                <li class="page-item next">
                                    <a class="page-link" href="${pageContext.request.contextPath}/admin/products?<%=idParam + search%>page=<%=pagination + 1%>"
                                    ><i class="tf-icon bx bx-chevrons-right"></i
                                    ></a>
                                </li>
                            </ul>
                        </nav>
                    </div>

                    <div class="card">
                        <h5 class="card-header">CHI TIẾT</h5>
                        <div class="table-responsive text-nowrap">
                            <table class="table">
                                <thead>
                                <tr>
                                    <th>Tên</th>
                                    <th>Giá</th>
                                    <th>Ngày thêm</th>
                                    <th>Trạng thái</th>
                                    <th>Thao tác</th>
                                </tr>
                                </thead>
                                <tbody class="table-border-bottom-0">
                                <c:forEach items="<%=products%>" var="product">
                                    <c:set var="status" value="${product.status}" scope="request"/>
                                    <c:set var="price" value="${product.price}" scope="request"/>
                                    <%
                                        String price = DecimalFormat.getIntegerInstance().format(Double.parseDouble(request.getAttribute("price").toString()));
                                        String status;
                                        int oppositeStatus;
                                        String nameOppositeStatus;
                                        if (Integer.parseInt(request.getAttribute("status").toString()) == StatusProduct.AVAILABLE.ordinal()) {
                                            status = "còn hàng";
                                            oppositeStatus = StatusProduct.UNAVAILABLE.ordinal();
                                            nameOppositeStatus = "hết hàng";
                                        } else {
                                            status = "hết hàng";
                                            oppositeStatus = StatusProduct.AVAILABLE.ordinal();
                                            nameOppositeStatus = "còn hàng";
                                        }
                                    %>
                                    <tr>
                                        <td><a href="${pageContext.request.contextPath}/admin/editProduct?id=${product.id}"> <i
                                                class="fab fa-angular fa-lg text-danger me-3"></i> <strong><c:out value="${product.name}"/></strong></a></td>
                                        <td><%=price%> VNĐ</td>
                                        <td><c:out value="${product.createdAt}"/></td>
                                        <td><span class="badge bg-label-primary me-1"><%=status%></span></td>
                                        <td>
                                            <div class="dropdown">
                                                <button type="button" class="btn p-0 dropdown-toggle hide-arrow"
                                                        data-bs-toggle="dropdown">
                                                    <i class="bx bx-dots-vertical-rounded"></i>
                                                </button>
                                                <div class="dropdown-menu">
                                                    <a class="dropdown-item" href="${pageContext.request.contextPath}/admin/editProduct?id=${product.id}"
                                                    ><i class="bx bx-edit-alt me-1"></i> Chỉnh sửa</a
                                                    >
                                                    <a class="dropdown-item" href="${pageContext.request.contextPath}/admin/setStatusProduct?id=${product.id}&<%=(category == null) ? "" : "category="+category.getId()+"&"%>value=<%=oppositeStatus%>"
                                                    ><i class="bx bx-edit-alt me-1"></i>Đánh dấu là <%=nameOppositeStatus%></a
                                                    >
                                                    <a class="dropdown-item" href="${pageContext.request.contextPath}/admin/deleteProduct?id=${product.id}<%=(category == null) ? "" : "&id="+category.getId()%>"
                                                    ><i class="bx bx-trash me-1"></i>xóa</a
                                                    >
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
