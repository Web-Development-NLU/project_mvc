<%--
  Created by IntelliJ IDEA.
  User: Quang Tho
  Date: 02/12/2022
  Time: 12:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="about-info-card_head container-fluid mt-5">
    <div class="about-info-card_thumbnail">
        <img src="https://caston.familab.net/wp-content/uploads/2022/03/about_image_4.jpg">
    </div>
    <div class="about-info-card_content mt-5">
        <div class="info_title monts">ĐÔI NÉT VỀ THƯƠNG HIỆU CỦA CHÚNG TÔI</div>
        <div class="info_break-line"></div>
        <div class="info_description monts"><%=request.getParameter("value")%></div>
    </div>
</div>