<%--
  Created by IntelliJ IDEA.
  User: Quang Tho
<<<<<<< Updated upstream
  Date: 03/12/2022
  Time: 14:48
=======
  Date: 08/12/2022
  Time: 13:32
>>>>>>> Stashed changes
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
            <div class="cart-menu_item">NHẬP THÔNG TIN</div>
            <div class="cart-menu_item">THANH TOÁN</div>
        </div>

        <div class="cart-place row">
            <div class="cart-table mt-5 col-12 col-md-8">
                    <table class="table table-bordered">
                        <thead>
                        <tr>
                            <th class="smart-cell">PRODUCT</th>
                            <th></th>
                            <th>PRICE</th>
                            <th>QUANTITY</th>
                            <th>SUBTOTAL</th>
                        </tr>
                        </thead>
                        <tbody class="cart-list">
                        <form action="">
                            <tr class="cart-item">
                                <td class="cart-item_img"><img
                                        src="https://caston.familab.net/wp-content/uploads/2021/09/product_pilke-18-natural-birch-with-light-hr_2-420x420.jpg">
                                </td>
                                <td><a href="#">Pilke 18 pendant</a></td>
                                <td class="cart-price">
                                    <div class="card-price">
                                        <span class="current-price">650.00$</span>
                                    </div>
                                </td>
                                <td>
                                    <div class="product_number">
                                        <input name="id" value="id" class="d-none">
                                        <input type="number" class="input-number" name="amount" value="1"
                                               onchange="this.form.submit()">
                                    </div>
                                </td>
                                <td class="cart_sum-price">
                                    <div class="card-price">
                                        <span class="current-price"><span class="hidden-item">Total</span>650.00$</span>
                                    </div>
                                    <button class="btn-text color-red"><i class="fa-sharp fa-solid fa-trash"></i>
                                    </button>
                                </td>
                            </tr>
                        </form>
                        <form action="">
                            <tr class="cart-item">
                                <td class="cart-item_img"><img
                                        src="https://caston.familab.net/wp-content/uploads/2021/09/product_pilke-18-natural-birch-with-light-hr_2-420x420.jpg">
                                </td>
                                <td><a href="#">Pilke 18 pendant</a></td>
                                <td class="cart-price">
                                    <div class="card-price">
                                        <span class="current-price">650.00$</span>
                                    </div>
                                </td>
                                <td>
                                    <div class="product_number">
                                        <input name="id" value="id" class="d-none">
                                        <input type="number" class="input-number" name="amount" value="1"
                                               onchange="this.form.submit()">
                                    </div>
                                </td>
                                <td class="cart_sum-price">
                                    <div class="card-price">
                                        <span class="current-price"><span class="hidden-item">Total</span>650.00$</span>
                                    </div>
                                    <button class="btn-text color-red"><i class="fa-sharp fa-solid fa-trash"></i>
                                    </button>
                                </td>
                            </tr>
                        </form>
                        </tbody>
                        <tfoot>
                        <tr>
                            <td colspan="100">
                                <input class="input-primary" type="text" name="code" placeholder="Code">
                            </td>
                        </tr>
                        </tfoot>
                    </table>
            </div>

            <div class="cart-info-sum mt-5 col-12 col-md-4">
                <form action="">
                    <table class="table table-bordered">
                        <tbody>
                        <tr class="table-secondary">
                            <th>CART TOTALS</th>
                            <th></th>
                        </tr>
                        <tr>
                            <th class="cart-info-title">
                                Subtotal
                            </th>
                            <td class="cart-info-des">
                                <div class="card-price">
                                    <span class="current-price">650.00$</span>
                                </div>
                            </td>
                        </tr>
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
