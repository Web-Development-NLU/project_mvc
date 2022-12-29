<%@ page import="Model.User" %><%--
  Created by IntelliJ IDEA.
  User: Quang Tho
  Date: 29/12/2022
  Time: 11:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <jsp:include page="common/head.jsp">
    <jsp:param name="title" value="MY ACCOUNT | TÀI KHOẢN CỦA TÔI"/>
  </jsp:include>
</head>
<%
  User user = (User) request.getAttribute("user");
  String firstName = (user.getFirstName() != null) ? user.getFirstName() : "";
  String lastName = (user.getLastName() != null) ? user.getLastName() : "";
  String country = (user.getCountry() != null) ? user.getCountry() : "";
  String city = (user.getCity() != null) ? user.getCity() : "";
  String district = (user.getDistrict() != null) ? user.getDistrict() : "";
  String address = (user.getAddress() != null) ? user.getAddress() : "";
  String phone = (user.getPhone() != null) ? user.getPhone() : "";
  String email = (user.getEmail() != null) ? user.getEmail() : "";
%>
<body>
  <div id="myAccount_container">
    <header>
      <jsp:include page="common/menu.jsp"/>
      <jsp:include page="common/searchBarMenu.jsp"/>
      <jsp:include page="common/head-bottom-page.jsp">
        <jsp:param name="title" value="TÀI KHOẢN CỦA TÔI"/>
        <jsp:param name="page" value="/myAccount"/>
      </jsp:include>
    </header>

    <section id="checkout-content" class="container-fluid mb-5 mt-5">
      <form action="">
        <div class="checkout-detail row mt-5">
          <div class="checkout-billing col">
            <div class="checkout-billing_title">My Infomation</div>

            <div class="billing-name row">
              <div class="input-secondary col">
                <label for="fname">Frist Name *</label>
                <input type="text" id="fname" value="<%= firstName %>">
              </div>
              <div class="input-secondary col">
                <label for="lname">Last Name *</label>
                <input type="text" id="lname" value="<%= lastName %>">
              </div>
            </div>
            <div class="input-secondary">
              <label for="country">Country *</label>
              <input type="text" id="country" value="<%= country %>">
            </div>
            <div class="input-secondary">
              <label for="city">City/Province *</label>
              <input type="text" id="city" value="<%= city %>">
            </div>
            <div class="input-secondary">
              <label for="district">District *</label>
              <input type="text" id="district" value="<%= district %>">
            </div>
            <div class="input-secondary">
              <label for="address">Address *</label>
              <input type="text" id="address" value="<%= address %>">
            </div>
            <div class="input-secondary">
              <label for="phone">Phone *</label>
              <input type="text" id="phone" value="<%= phone %>">
            </div>
            <div class="input-secondary">
              <label for="email">Email *</label>
              <input type="text" id="email" value="<%= email %>">
            </div>
          </div>
        </div>
        <button class="btn-text-lg bgr-black hover-bg-red">SAVE</button>
      </form>
    </section>

    <jsp:include page="common/footer.jsp"/>
  </div>

  <jsp:include page="common/tail.jsp"/>
</body>
</html>
