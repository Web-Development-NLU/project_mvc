<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="Model.Category" %>
<%@ page import="DTO.AuthorizationData" %>
<%@ page import="Model.TypeAccount" %><%--
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
        <a href="index.html" class="app-brand-link">

            <span class="app-brand-text demo menu-text fw-bolder ms-2">Furniture</span>
        </a>

        <a href="javascript:void(0);" class="layout-menu-toggle menu-link text-large ms-auto d-block d-xl-none">
            <i class="bx bx-chevron-left bx-sm align-middle"></i>
        </a>
    </div>

    <div class="menu-inner-shadow"></div>

    <ul class="menu-inner py-1">
        <!-- home -->
        <li class="menu-item active">
            <a href="${pageContext.request.contextPath}/admin" class="menu-link">
                <i class="menu-icon tf-icons bx bx-home-circle"></i>
                <div data-i18n="Analytics">Trang chủ</div>
            </a>
        </li>

        <!-- Account customner-->
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
            <a href="/dashboard/order" class="menu-link ">
                <i class="menu-icon tf-icons bx bx-dock-top"></i>
                <div data-i18n="Account Settings">Order Management</div>
            </a>

        </li>


        <!-- account customer -->
        <li class="menu-item">
            <a href="javascript:void(0);" class="menu-link menu-toggle">
                <i class="menu-icon tf-icons bx bx-table"></i>
                <div data-i18n="Authentications">Tài khoản người dùng</div>
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


    </ul>
</aside>
