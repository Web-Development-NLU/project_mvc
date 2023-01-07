<%--
  Created by IntelliJ IDEA.
  User: Quang Tho
  Date: 26/11/2022
  Time: 13:54
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    Boolean logged = (Boolean) request.getAttribute("logged");
    int cartNumber = Integer.parseInt(request.getAttribute("cartNumber").toString());
%>
<menu class="head_top ${param.classes}">
    <div class="container-fluid container_menu">
        <div class="row">
            <div id="menu_btn-responsive" class="menu_btn-responsive col"><i class="fa-solid fa-bars"></i></div>
            <ul class="menu_list col">
                <li class="menu_list_item menu_list-search hidden_item">
                    <form action="">
                        <div class="input-line">
                            <input type="email" placeholder="Search your keywords">
                            <button type="submit">
                                <i class="fa-solid fa-magnifying-glass"></i>
                            </button>
                        </div>
                    </form>
                </li>
                <li class="menu_list_item"><a href="${pageContext.request.contextPath}/">Trang chủ</a></li>
                <li class="menu_list_item"><a href="${pageContext.request.contextPath}/products">Sản phẩm</a></li>
                <li class="menu_list_item"><a href="${pageContext.request.contextPath}/about">Về chúng tôi</a></li>
                <li class="menu_list_item"><a href="${pageContext.request.contextPath}/contact">Liên hệ</a></li>
                <c:choose>
                    <c:when test="<%= logged%>">
                        <li class="menu_list_item hidden_item"><a href="${pageContext.request.contextPath}/myAccount">
                            <i class="fa-regular fa-user action-icon color-red"></i>
                            <span class="btn-content monts">Tài khoản của tôi</span>
                        </a>
                        <li class="menu_list_item hidden_item"><a href="${pageContext.request.contextPath}/orderList">
                            <i class="fa-solid fa-list action-icon color-red"></i>
                            <span class="btn-content monts">Đơn hàng của tôi</span>
                        </a>
                        </li>
                        <li class="menu_list_item hidden_item"><a href="${pageContext.request.contextPath}/logout">
                            <i class="fa-solid fa-right-from-bracket action-icon color-red"></i>
                            <span class="btn-content monts">Đăng xuất</span>
                        </a>
                        </li>
                    </c:when>
                    <c:otherwise>
                        <li class="menu_list_item hidden_item"><a href="${pageContext.request.contextPath}/login">
                            <i class="fa-regular fa-user action-icon color-red"></i>
                            <span class="btn-content monts">Login</span>
                        </a></li>
                    </c:otherwise>
                </c:choose>
            </ul>
            <div class="menu_logo col">
                <h2><a class="monts" href="#">FURNITURE</a></h2>
            </div>
            <ul class="menu_action col">
                <li class="menu_search menu_action_item">
                    <a href="#">
                        <button class="btn-icon bgr-red br-50 color-white" id="triggerSearchBar"><i
                                class="fa-solid fa-magnifying-glass"></i></button>
                    </a>
                </li>

                <li class="menu_login menu_action_item">
                    <c:choose>
                        <c:when test="<%= logged%>">
                            <div class="dropdown-person">
                                <button class="btn-icon br-50 bgr-blue" data-toggle="dropdown" aria-expanded="false">
                                    <i class="bi bi-person"></i>
                                </button>
                                <div class="dropdown-menu">
                                    <a class="dropdown-item" href="${pageContext.request.contextPath}/myAccount">Tài khoản của tôi</a>
                                    <a class="dropdown-item" href="${pageContext.request.contextPath}/orderList">Đơn hàng của tôi
                                        <span><i class="fa-solid fa-list"></i></span></a>
                                    <a class="dropdown-item" href="${pageContext.request.contextPath}/logout">Đăng xuất
                                        <span><i class="fa-solid fa-right-from-bracket"></i></span></a>
                                </div>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <button class="btn-icon-cb-text bd-white-02 rounded-pill">
                                <a href="${pageContext.request.contextPath}/login" class="color-white">
                                    <i class="fa-regular fa-user action-icon"></i>
                                    <span class="btn-content monts">Đăng nhập</span>
                                </a>
                            </button>
                        </c:otherwise>
                    </c:choose>
                </li>

                <li class="menu_cart menu_action_item">
                    <button class="btn-badge">
                        <a href="${pageContext.request.contextPath}/cart" class="color-white">
                            <i class="bi bi-bag"></i>
                            <span class="badge"><%=cartNumber%></span>
                        </a>
                    </button>
                </li>
            </ul>
        </div>
    </div>
</menu>
