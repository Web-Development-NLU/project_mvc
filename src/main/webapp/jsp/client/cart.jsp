<%--
  Created by IntelliJ IDEA.
  User: Quang Tho
  Date: 03/12/2022
  Time: 14:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="common/head.jsp">
      <jsp:param name="title" value="FURNITURE | GIỎ HÀNG"/>
    </jsp:include>
</head>
<body>

  <div id="cart-container">
    <header>
      <jsp:include page="common/menu.jsp"/>
      <jsp:include page="common/searchBarMenu.jsp"/>
      <jsp:include page="common/head-bottom-page.jsp">
        <jsp:param name="title" value="GIỎ HÀNG"/>
        <jsp:param name="page" value="cart"/>
      </jsp:include>
    </header>

    <section id="cart-content" class="container-fluid">
      <div class="cart-menu">
        <div class="cart-menu_item selected">GIỎ HÀNG</div>
        <div class="cart-menu_item">NHẬP THÔNG TIN </div>
        <div class="cart-menu_item">THANH TOÁN</div>
      </div>

      <div class="cart-place row">
        <div class="cart-table mt-5 col-12 col-md-8">
          <form action="">
            <table class="table table-bordered">
              <thead>
              <tr>
                <th class="smart-cell">SẢN PHẨM</th>
                <th></th>
                <th>GIÁ</th>
                <th>SỐ LƯỢNG</th>
                <th>TỔNG GIÁ</th>
              </tr>
              </thead>
              <tbody class="cart-list">
                <jsp:include page="partials/cart/cart-item.jsp"/>
                <jsp:include page="partials/cart/cart-item.jsp"/>
              </tbody>
              <tfoot>
              <tr>
                <td colspan="100">
                  <input class="input-primary" type="text" placeholder="Code">
                </td>
              </tr>
              </tfoot>
            </table>
          </form>
        </div>

        <div class="cart-info-sum mt-5 col-12 col-md-4">
          <form action="">
            <table class="table table-bordered">
              <tbody>
              <tr class="table-secondary">
                <th>CART TOTALS</th>
                <th></th>
              </tr >
              </tbody>

              <tfoot>
              <tr>
                <th class="cart-info-title">
                  TOTALS
                </th>
                <td class="cart-info-des">
                  <div class="card-price">
                    <span class="current-price">650.00$</span>
                  </div>
                </td>
              </tr>
              <tr>
                <td colspan="100">
                  <button class="btn-text-lg bgr-red hover-bg-black">ORDER</button>
                </td>
              </tr>
              </tfoot>
            </table>
          </form>
        </div>
      </div>

    </section>

    <jsp:include page="common/footer.jsp"/>
  </div>

  <jsp:include page="common/tail.jsp"/>
</body>
</html>
