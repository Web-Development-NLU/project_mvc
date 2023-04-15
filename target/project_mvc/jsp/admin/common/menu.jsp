<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="Model.Category" %>
<%@ page import="DTO.AuthorizationData" %>
<%@ page import="Model.TypeAccount" %>
<%@ page import="Model.TypeShop" %><%--
=======
<%@ page import="Model.Order" %><%--
>>>>>>> ff310e064b8d97b3b6c496f43f874ba65fc27590
  Created by IntelliJ IDEA.
  User: Quang Tho
  Date: 29/12/2022
  Time: 10:49
  To change this template use File | Settings | File Templates.
--%>

<%
    ArrayList<Category> categories = (ArrayList<Category>) request.getAttribute("categoriesMenu");
    AuthorizationData data = (AuthorizationData) session.getAttribute("adminLogin");
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<aside id="layout-menu" class="layout-menu menu-vertical menu bg-menu-theme">
    <div class="app-brand demo">
        <a href="${pageContext.request.contextPath}/admin" class="app-brand-link">
            <span class="app-brand-text demo menu-text fw-bolder ms-2">Furniture</span>
        </a>

        <a href="javascript:void(0);" class="layout-menu-toggle menu-link text-large ms-auto d-block d-xl-none">
            <i class="bx bx-chevron-left bx-sm align-middle"></i>
        </a>
    </div>

    <div class="menu-inner-shadow"></div>

    <ul class="menu-inner py-1">
        <!-- home -->
        <li class="menu-item">
            <a href="${pageContext.request.contextPath}/admin" class="menu-link">
                <i class="menu-icon tf-icons bx bx-home-circle"></i>
                <div data-i18n="Analytics">Trang chủ</div>
            </a>
        </li>

        <li class="menu-item">
            <a href="${pageContext.request.contextPath}/admin/category" class="menu-link">
                <i class="menu-icon tf-icons bx bx-detail"></i>
                <div data-i18n="Analytics">Danh mục</div>
            </a>
        </li>
        <li class="menu-item">
            <a href="${pageContext.request.contextPath}/admin/pattern" class="menu-link">
                <i class="menu-icon tf-icons bx bx-crown"></i>
                <div data-i18n="Analytics">Kiểu dáng</div>
            </a>
        </li>
        <li class="menu-item">
            <a href="${pageContext.request.contextPath}/admin/color" class="menu-link">
                <i class="menu-icon tf-icons bx bx-support"></i>
                <div data-i18n="Analytics">Màu sắc</div>
            </a>
        </li>
        <li class="menu-item">
            <a href="${pageContext.request.contextPath}/admin/contact" class="menu-link">
                <i class="menu-icon tf-icons bx bx-detail"></i>
                <div data-i18n="Analytics">Thông tin liên hệ</div>
            </a>
        </li>
        <li class="menu-item">
            <a href="${pageContext.request.contextPath}/admin/about" class="menu-link">
                <i class="menu-icon tf-icons bx bx-detail"></i>
                <div data-i18n="Analytics">Về chúng tôi</div>
            </a>
        </li>
        <li class="menu-item">
            <a href="${pageContext.request.contextPath}/admin/slide" class="menu-link">
                <i class="menu-icon tf-icons bx bx-home-circle"></i>
                <div data-i18n="Analytics">Slide</div>
            </a>
        </li>
        <li class="menu-item">
            <a href="${pageContext.request.contextPath}/admin/products" class="menu-link menu-toggle">
                <i class="menu-icon tf-icons bx bx-layout"></i>
                <div data-i18n="Layouts">Sản phẩm</div>
            </a>

            <ul class="menu-sub">
                <li class="menu-item">
                    <a href="${pageContext.request.contextPath}/admin/products" class="menu-link">
                        <div data-i18n="Without menu">Tất cả</div>
                    </a>
                </li>
                <c:forEach items="<%=categories%>" var="category">
                    <li class="menu-item">
                        <a href="${pageContext.request.contextPath}/admin/products?id=${category.id}" class="menu-link">
                            <div data-i18n="Without menu">${category.name}</div>
                        </a>
                    </li>
                </c:forEach>
            </ul>
        </li>
        <li class="menu-item">
            <a href="javascript:void(0);" class="menu-link menu-toggle">
                <i class="menu-icon tf-icons bx bx-table"></i>
                <div data-i18n="Authentications">Banner Cửa hàng</div>
            </a>
            <ul class="menu-sub">
                <c:if test="<%=data.getType() == TypeAccount.ROOT_ADMIN.ordinal()%>">
                    <li class="menu-item">
                        <a href="${pageContext.request.contextPath}/admin/shop?type=<%=TypeShop.SMALL.ordinal()%>" class="menu-link">
                            <div data-i18n="Basic">Banner nhỏ</div>
                        </a>
                    </li>
                </c:if>
                <li class="menu-item">
                    <a href="${pageContext.request.contextPath}/admin/shop?type=<%=TypeShop.LARGE.ordinal()%>" class="menu-link">
                        <div data-i18n="Basic">Banner lớn</div>
                    </a>
                </li>
            </ul>
        </li>
        <li class="menu-item">
            <a href="javascript:void(0);" class="menu-link menu-toggle">
                <i class="menu-icon tf-icons bx bx-collection"></i>
                <div data-i18n="Account Settings">Các nút tạo khác</div>
            </a>
            <ul class="menu-sub">
                <li class="menu-item">
                    <a href="${pageContext.request.contextPath}/admin/createProduct" class="menu-link">
                        <div data-i18n="Account">Tạo sản phẩm</div>
                    </a>
                </li>
                <li class="menu-item">
                    <a href="${pageContext.request.contextPath}/admin/createColor" class="menu-link">
                        <div data-i18n="Notifications">Tạo màu</div>
                    </a>
                </li>
                <li class="menu-item">
                    <a href="${pageContext.request.contextPath}/admin/createPattern" class="menu-link">
                        <div data-i18n="Connections">Tạo kiểu dáng</div>
                    </a>
                </li>
            </ul>
        </li>
        <li class="menu-item">
            <a href="/admin/order" class="menu-link menu-toggle">
                <i class="menu-icon tf-icons bx bx-dock-top"></i>
                <div data-i18n="Account Settings">Quản lý đơn hàng</div>
            </a>
            <ul class="menu-sub">
                <li class="menu-item">
                    <a href="${pageContext.request.contextPath}/admin/order" class="menu-link">
                        <div data-i18n="Without menu">Tất cả</div>
                    </a>
                </li>
                <li class="menu-item">
                    <a href="${pageContext.request.contextPath}/admin/orderPrePayment" class="menu-link">
                        <div data-i18n="Without menu">Thanh toán trước</div>
                    </a>
                </li>
                <li class="menu-item">
                    <a href="${pageContext.request.contextPath}/admin/orderPostpaid" class="menu-link">
                        <div data-i18n="Without menu">Thanh toán khi nhận hàng</div>
                    </a>
                </li>
            </ul>
        </li>


        <!-- account customer -->
        <li class="menu-item">
            <a href="javascript:void(0);" class="menu-link menu-toggle">
                <i class="menu-icon tf-icons bx bx-table"></i>
                <div data-i18n="Authentications">Quản lý tài khoản</div>
            </a>
            <ul class="menu-sub">
                <c:if test="<%=data.getType() == TypeAccount.ROOT_ADMIN.ordinal()%>">
                    <li class="menu-item">
                        <a href="${pageContext.request.contextPath}/admin/account?type=admin" class="menu-link">
                            <div data-i18n="Basic">Tài khoản Admin</div>
                        </a>
                    </li>
                </c:if>
                <li class="menu-item">
                    <a href="${pageContext.request.contextPath}/admin/account?type=user" class="menu-link">
                        <div data-i18n="Basic">Tài khoản người dùng</div>
                    </a>
                </li>
            </ul>
        </li>

    </ul>
</aside>
