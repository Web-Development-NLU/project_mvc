<%--
  Created by IntelliJ IDEA.
  User: Quang Tho
  Date: 26/11/2022
  Time: 13:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="head-bottom-page">
    <div class="head-page-content">
        <h2 class="head-page-title monts color-white"><%= request.getParameter("title") %></h2>
        <div aria-label="breadcrumb">
            <ol class="breadcrumb color-white">
                <li class="breadcrumb-item monts" aria-current="page"><a href="#" class="color-white">Trang chủ</a></li>
                <li class="breadcrumb-item monts" aria-current="page"><%= request.getParameter("page") %></li>
            </ol>
        </div>
    </div>
</div>