<%--
  Created by IntelliJ IDEA.
  User: Quang Tho
  Date: 01/12/2022
  Time: 10:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="products-container bgr-white-02">
  <div class="products">
    <div class="product_title poppins">New arrivvals</div>
    <div class="container-fluid">
      <div class="product-list row mb-5 ">
        <jsp:include page="../../common/card.jsp">
          <jsp:param name="type" value="2"/>
        </jsp:include>
        <jsp:include page="../../common/card.jsp">
          <jsp:param name="type" value="2"/>
        </jsp:include>
        <jsp:include page="../../common/card.jsp">
          <jsp:param name="type" value="2"/>
        </jsp:include>
        <jsp:include page="../../common/card.jsp">
          <jsp:param name="type" value="2"/>
        </jsp:include>
        <jsp:include page="../../common/card.jsp">
          <jsp:param name="type" value="2"/>
        </jsp:include>
        <jsp:include page="../../common/card.jsp">
          <jsp:param name="type" value="2"/>
        </jsp:include>
        <jsp:include page="../../common/card.jsp">
          <jsp:param name="type" value="2"/>
        </jsp:include>
        <jsp:include page="../../common/card.jsp">
          <jsp:param name="type" value="2"/>
        </jsp:include>
      </div>
    </div>
  </div>
</div>
