<%@ page import="Model.User" %><%--
  Created by IntelliJ IDEA.
  User: Quang Tho
  Date: 29/12/2022
  Time: 11:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
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
    String success = (request.getAttribute("success") == null) ? null : request.getAttribute("success").toString();
%>
<body>
<div id="myAccount_container">
    <header>
        <jsp:include page="common/menu.jsp"/>
        <jsp:include page="common/searchBarMenu.jsp"/>
        <jsp:include page="common/head-bottom-page.jsp">
            <jsp:param name="title" value="TÀI KHOẢN CỦA TÔI"/>
            <jsp:param name="page" value="Tài khoản của tôi"/>
        </jsp:include>
    </header>

    <section id="checkout-content" class="container-fluid mb-5 mt-5">
        <form action="${pageContext.request.contextPath}/myAccount" method="post">
            <div class="checkout-detail row mt-5">
                <div class="checkout-billing col">
                    <div class="checkout-billing_title">Thông tin của tôi</div>

                    <div class="billing-name row">
                        <div class="input-secondary col">
                            <label for="firstName">Tên</label>
                            <input type="text" id="firstName" name="firstName" value="<%= firstName %>">
                        </div>
                        <div class="input-secondary col">
                            <label for="lastName">Họ</label>
                            <input type="text" id="lastName" name="lastName" value="<%= lastName %>">
                        </div>
                    </div>
                    <div class="input-secondary">
                        <label for="country">Quốc gia</label>
                        <input type="text" id="country" name="country" value="<%= country %>">
                    </div>
                    <div class="input-secondary">
                        <label for="city">Thành phố</label>
                        <select name="city" id="city">
                            <option value=" <%=city%>" name="city" selected>
                                <%=city%>
                            </option>
                            <option value="HCM" name="city">
                                HCM
                            </option>
                            <option value="Thu Duc" name="city">
                                Thu Duc
                            </option>
                        </select>
                    </div>
                    <div class="input-secondary">
                        <label for="district">Quận Huyện</label>
                        <select name="district" id="district">
                            <option value=" <%=district%>" name="district" selected>
                                <%=district%>
                            </option>
                            <option value="quan 10" name="district" label="Ho Chi Minh">
                                10
                            </option>
                        </select>
                    </div>
                    <div class="input-secondary">
                        <label for="address">Địa chỉ</label>
                        <select name="address" id="address">
                            <option value=" <%=address%>" name="address" selected>
                                <%=address%>
                            </option>
                            <option value="Tang nhon phu B" name="address" label="Ho Chi Minh">
                                Tang nhon phu B
                            </option>
                        </select>
                    </div>
                    <div class="input-secondary">
                        <label for="phone">Số điện thoại</label>
                        <input type="text" id="phone" name="phone" value="<%= phone %>">
                    </div>
                    <div class="input-secondary">
                        <label for="email">Email</label>
                        <input type="text" id="email" value="<%= email %>" disabled>
                    </div>
                </div>
            </div>
            <button class="btn-text-lg bgr-black hover-bg-red">Lưu</button>
        </form>
        <form action="${pageContext.request.contextPath}/changePasswordUser" method="post">
            <div class="checkout-detail row mt-5">
                <div class="checkout-billing col">
                    <div class="checkout-billing_title">Đổi mật khẩu</div>

                    <div class="input-secondary">
                        <label for="oldPassword">Mật khẩu cũ</label>
                        <input type="password" id="oldPassword" name="oldPassword">
                    </div>
                    <div class="input-secondary">
                        <label for="newPassword">Mật khẩu mới</label>
                        <input type="password" id="newPassword" name="newPassword">
                    </div>

                </div>
            </div>
            <button class="btn-text-lg bgr-black hover-bg-red">Đổi mật khẩu</button>
        </form>
    </section>
    <%
        String errorChangePass = (request.getAttribute("errorChangePass") == null) ? null : request.getAttribute("errorChangePass").toString();
    %>
    <c:if test="<%=errorChangePass != null%>">
        <div class="alert-danger alert alert-dismissible fade show fixed-top" role="alert">
            <strong>Không thành công</strong> <%=errorChangePass%>
            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
        </div>
    </c:if>
    <c:if test="<%=success != null%>">
        <div class="alert-success alert alert-dismissible fade show fixed-top" role="alert">
            <strong>Thành công</strong> <%=success%>
            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
        </div>
    </c:if>
    <jsp:include page="common/footer.jsp"/>
</div>

<jsp:include page="common/tail.jsp"/>
</body>
</html>
