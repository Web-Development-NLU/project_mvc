<%@ page import="DTO.AuthorizationData" %>
<%@ page import="Services.UserService" %>
<%@ page import="Model.User" %>
<%@ page import="Model.TypeAccount" %><%--
  Created by IntelliJ IDEA.
  User: Quang Tho
  Date: 29/12/2022
  Time: 10:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<%
    AuthorizationData data = (AuthorizationData) session.getAttribute("adminLogin");
    UserService userService = new UserService("users");
    User user = userService.findById(data.getId(), User.class);
    String nameAdmin = user.getFirstName() +" "+ user.getLastName();
%>
<nav
        class="layout-navbar container-xxl navbar navbar-expand-xl navbar-detached align-items-center bg-navbar-theme"
        id="layout-navbar"
>
    <div class="layout-menu-toggle navbar-nav align-items-xl-center me-3 me-xl-0 d-xl-none">
        <a class="nav-item nav-link px-0 me-xl-4" href="javascript:void(0)">
            <i class="bx bx-menu bx-sm"></i>
        </a>
    </div>

    <div class="navbar-nav-right d-flex align-items-center" id="navbar-collapse">
        <!-- Search -->
        <div class="navbar-nav align-items-center">
            <div class="nav-item d-flex align-items-center">
                <h3 style="margin-bottom: 0">Xin chào <%=data.getType() == TypeAccount.ROOT_ADMIN.ordinal() ? "Root" : "Admin"%></h3>
            </div>
        </div>
        <!-- /Search -->

        <ul class="navbar-nav flex-row align-items-center ms-auto">
            <!-- Place this tag where you want the button to render. -->


            <!-- User -->
            <li class="nav-item navbar-dropdown dropdown-user dropdown">
                <a class="nav-link dropdown-toggle hide-arrow" href="javascript:void(0);"
                   data-bs-toggle="dropdown">
                    <div class="avatar avatar-online">
                        <img src="https://scontent.fsgn5-11.fna.fbcdn.net/v/t39.30808-6/318025381_1798229290534958_7635655280474646079_n.jpg?_nc_cat=110&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=pJYPwpzcSw8AX-qPL3o&_nc_ht=scontent.fsgn5-11.fna&oh=00_AfALRuvRztwOoRqDcl9ycEAY7u9CeRXvB4cbXl1DroNW3A&oe=63BF056A" alt
                             class="w-px-40 h-auto rounded-circle"/>
                    </div>
                </a>
                <ul class="dropdown-menu dropdown-menu-end">
                    <li>
                        <a class="dropdown-item" href="#">
                            <div class="d-flex">
                                <div class="flex-shrink-0 me-3">
                                    <div class="avatar avatar-online">
                                        <img src="https://scontent.fsgn5-11.fna.fbcdn.net/v/t39.30808-6/318025381_1798229290534958_7635655280474646079_n.jpg?_nc_cat=110&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=pJYPwpzcSw8AX-qPL3o&_nc_ht=scontent.fsgn5-11.fna&oh=00_AfALRuvRztwOoRqDcl9ycEAY7u9CeRXvB4cbXl1DroNW3A&oe=63BF056A" alt
                                             class="w-px-40 h-auto rounded-circle"/>
                                    </div>
                                </div>
                                <div class="flex-grow-1">
                                    <span class="fw-semibold d-block"><%=nameAdmin%></span>
                                    <small class="text-muted"><%=data.getType() == TypeAccount.ROOT_ADMIN.ordinal() ? "Root" : "Admin"%></small>
                                </div>
                            </div>
                        </a>
                    </li>
                    <li>
                        <div class="dropdown-divider"></div>
                    </li>
                    <li>
                        <a class="dropdown-item" href="${pageContext.request.contextPath}/admin/setting">
                            <i class="bx bx-cog me-2"></i>
                            <span class="align-middle">Cài đặt</span>
                        </a>
                    </li>

                    <li>
                        <div class="dropdown-divider"></div>
                    </li>
                    <li>
                        <a class="dropdown-item" href="${pageContext.request.contextPath}/dashboard/logout">
                            <i class="bx bx-power-off me-2"></i>
                            <span class="align-middle">Đăng xuất</span>
                        </a>
                    </li>
                </ul>
            </li>
            <!--/ User -->
        </ul>
    </div>
</nav>
