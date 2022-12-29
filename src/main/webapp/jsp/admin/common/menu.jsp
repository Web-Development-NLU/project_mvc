<%--
  Created by IntelliJ IDEA.
  User: Quang Tho
  Date: 29/12/2022
  Time: 10:49
  To change this template use File | Settings | File Templates.
--%>
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
            <a href="/dashboard" class="menu-link">
                <i class="menu-icon tf-icons bx bx-home-circle"></i>
                <div data-i18n="Analytics">Home</div>
            </a>
        </li>

        <!-- Account customner-->
        <li class="menu-item">
            <a href="javascript:void(0);" class="menu-link menu-toggle">
                <i class="menu-icon tf-icons bx bx-layout"></i>
                <div data-i18n="Layouts">Product</div>
            </a>

            <ul class="menu-sub">
                <li class="menu-item">
                    <a href="/dashboard" class="menu-link">
                        <div data-i18n="Without menu">CHAIR</div>
                    </a>
                </li>
                <li class="menu-item">
                    <a href="/dashboard/bedroom" class="menu-link">
                        <div data-i18n="Without navbar">BEDROOM</div>
                    </a>
                </li>
                <li class="menu-item">
                    <a href="/dashboard/desk" class="menu-link">
                        <div data-i18n="Container">DESK</div>
                    </a>
                </li>
                <li class="menu-item">
                    <a href="/dashboard/homewares" class="menu-link">
                        <div data-i18n="Fluid">HOMEWARES</div>
                    </a>
                </li>
                <li class="menu-item">
                    <a href="/dashboard/lighting" class="menu-link">
                        <div data-i18n="Blank">LIGHTING</div>
                    </a>
                </li>
                <li class="menu-item">
                    <a href="/dashboard/storage" class="menu-link">
                        <div data-i18n="Blank">STORAGE</div>
                    </a>
                </li>
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
                <div data-i18n="Authentications">Account</div>
            </a>
            <ul class="menu-sub">
                <li class="menu-item">
                    <a href="/dashboard/accountAdmin" class="menu-link" target="_blank">
                        <div data-i18n="Basic">Account Admin</div>
                    </a>
                </li>
                <li class="menu-item">
                    <a href="/dashboard/accountClient" class="menu-link" target="_blank">
                        <div data-i18n="Basic">Account Customer</div>
                    </a>
                </li>
            </ul>


    </ul>
</aside>
