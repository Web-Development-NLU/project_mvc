<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ page import="java.util.ArrayList" %>
        <%@ page import="Model.Product" %>
<%@ page import="Model.Statistics" %>
<%@ page import="Services.StatisticsService" %>
<%@ page import="Model.Order" %>
<%@ page import="java.time.Year" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="java.util.Calendar" %><%-- Created by IntelliJ IDEA. User: Quang Tho Date: 29/12/2022 Time: 10:47 To
                change this template use File | Settings | File Templates. --%>
                <%@ page contentType="text/html;charset=UTF-8" language="java" %>
                    <%@ page isELIgnored="false" %>

                        <html lang="en" class="light-style layout-menu-fixed" dir="ltr" data-theme="theme-default"
                            data-assets-path="/assets/" data-template="vertical-menu-template-free">

                        <head>
                            <meta charset="utf-8" />
                            <meta name="viewport"
                                content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0" />

                            <title>home-page</title>

                            <meta name="description" content="" />

                            <!-- Fonts -->
                            <link rel="preconnect" href="https://fonts.googleapis.com" />
                            <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
                            <link
                                href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap"
                                rel="stylesheet" />

                            <!-- Icons. Uncomment required icon fonts -->
                            <link rel="stylesheet"
                                href="${pageContext.request.contextPath}/assets/vendor/fonts/boxicons.css" />

                            <!-- Core CSS -->
                            <link rel="stylesheet"
                                href="${pageContext.request.contextPath}/assets/vendor/css/style.css">
                            <!-- Vendors CSS -->
                            <link rel="stylesheet"
                                href="${pageContext.request.contextPath}/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.css" />

                            <link rel="stylesheet"
                                href="${pageContext.request.contextPath}/assets/vendor/libs/apex-charts/apex-charts.css" />

                            <!-- Page CSS -->

                            <!-- Helpers -->
                            <script src="${pageContext.request.contextPath}/assets/vendor/js/helpers.js"></script>
                            <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

                            <!--! Template customizer & Theme config files MUST be included after core stylesheets and helpers.js in the <head> section -->
                            <!--? Config:  Mandatory theme config file contain global vars & default theme options, Set your preferred theme option in this file.  -->
                            <script src="${pageContext.request.contextPath}/assets/js_admin/config.js"></script>
                        </head>

                        <body>
                            <% ArrayList<Product> products = (ArrayList<Product>) request.getAttribute("products");
                                    boolean activeCollapse = true;
//                                HttpSession session1=request.getSession(true);
//                                Statistics total= (Statistics) request.getAttribute("o");
//                                StatisticsService statisticsService=new StatisticsService();
//                                Statistics ss=statisticsService.getStatistics();
                             Statistics s = (Statistics) request.getAttribute("statistics");
//                             StatisticsService statisticsService=new StatisticsService();
//                                ArrayList<Integer> oo=statisticsService.getTotalSalesByMonth();
                                ArrayList<String > getListMonth = (ArrayList<String>) request.getAttribute("o");
                                ArrayList<Integer> statisticsmonth= (ArrayList<Integer>) request.getAttribute("statisticsmonth");
                                ArrayList<Integer> orderByMonth= (ArrayList<Integer>) request.getAttribute("orderByMonth");
                                ArrayList<Integer> listYear= (ArrayList<Integer>) request.getAttribute("listYear");
                            %>
                                    <!-- Layout wrapper -->
                                    <div class="layout-wrapper layout-content-navbar">
                                        <div class="layout-container">
                                            <!-- Menu -->

                                            <jsp:include page="common/menu.jsp" />
                                            <!-- / Menu -->

                                            <!-- Layout container -->
                                            <div class="layout-page">
                                                <!-- Navbar -->

                                                <jsp:include page="common/navbar.jsp" />

                                                <!-- / Navbar -->

                                                <!-- Content wrapper -->
                                                <div class="content-wrapper">
                                                    <!-- Content -->


                                                        <div class="cart-table mt-5 col-12 col-md-8">
                                                        <table class="table table-bordered">
                                                            <thead>
                                                            <tr>
                                                                <th>ĐƠN HÀNG THEO NGÀY</th>
                                                                <th>TỔNG ĐƠN HÀNG </th>
                                                                <th>DOANH THU THEO NGÀY</th>
                                                                <th>TỔNG DOANH THU</th>
                                                            </tr>
                                                            </thead>
                                                            <tbody class="cart-list">
                                                            <tr>
                                                                <td><%=s.getTotalOrderByDate()%></td>
                                                                <td><%=s.getTotalOrder()%></td>
                                                                <td><%=s.getTotalSalesByDate()%></td>
                                                                <td><%=s.getTotalSales()%></td>
                                                            </tr>
                                                        </table>
                                                    </div>
                                                    <div id="select-revenue-year">
                                                    <div id="revenue"> THỐNG KÊ DOANH THU</div>
                                                    <div class="dropdownYear">
                                                        <button class="dropbtn">Năm <i class="menu-icon tf-icons bx bx-table"></i>
                                                        </button>
                                                        <div class="dropdown-content">
                                                                <% for (Integer value : listYear) { %>
                                                                <a href="/StatisticsController?year=<%= value %>"><%= "Năm " + value %></a>
                                                                <% } %>

                                                        </div>
                                                    </div>
                                                    </div>
                                                    <div class="wrapper-chart-stistics">
                                                    <div class="chart-container" >
                                                        <canvas id="myChart" style="width: 1150px"></canvas>
                                                    </div>
                                                    <div class="chart-container-order" >
                                                        <canvas id="myChartOrder" style="width: 1150px"></canvas>
                                                    </div>
                                                    </div>
                                                    <div class="container-xxl flex-grow-1 container-p-y">
                                                        <div class="row">
                                                            <div class="row">
                                                                <!-- Bootstrap carousel -->
                                                                <div class="col-md">
                                                                    <h5 class="my-4">Thông tin sản phẩm</h5>

                                                                    <div class="row">
                                                                        <div class="col-md mb-4 mb-md-0">
                                                                            <small
                                                                                class="text-light fw-semibold">Chi tiết sản phẩm </small>
                                                                            <div class="accordion mt-3"
                                                                                id="accordionExample">
                                                                                <c:forEach items="<%=products%>"
                                                                                    var="product">
                                                                                    <c:choose>
                                                                                        <c:when
                                                                                            test="<%=activeCollapse%>">
                                                                                            <div
                                                                                                class="card accordion-item active">
                                                                                                <h2
                                                                                                    class="accordion-header">
                                                                                                    <button
                                                                                                        type="button"
                                                                                                        class="accordion-button"
                                                                                                        data-bs-toggle="collapse"
                                                                                                        data-bs-target="#accordion${product.id}"
                                                                                                        aria-expanded="true"
                                                                                                        aria-controls="accordion${product.id}">
                                                                                                        ${product.name}
                                                                                                    </button>
                                                                                                </h2>
                                                                                                <div id="accordion${product.id}"
                                                                                                    class="accordion-collapse collapse show"
                                                                                                    data-bs-parent="#accordionExample">
                                                                                                    <div
                                                                                                        class="accordion-body">
                                                                                                        ${product.description}
                                                                                                        <br><br>
                                                                                                        Kích thước:
                                                                                                        ${product.dimensions}
                                                                                                        <br>
                                                                                                        Giá:&nbsp;
                                                                                                        ${product.price}
                                                                                                        <br>
                                                                                                        Vật liệu:&nbsp;
                                                                                                        ${product.material}


                                                                                                    </div>
                                                                                                </div>
                                                                                            </div>
                                                                                            <%activeCollapse=false;%>
                                                                                        </c:when>
                                                                                        <c:otherwise>
                                                                                            <div
                                                                                                class="card accordion-item">
                                                                                                <h2
                                                                                                    class="accordion-header">
                                                                                                    <button
                                                                                                        type="button"
                                                                                                        class="accordion-button"
                                                                                                        data-bs-toggle="collapse"
                                                                                                        data-bs-target="#accordion${product.id}"
                                                                                                        aria-expanded="true"
                                                                                                        aria-controls="accordion${product.id}">
                                                                                                        ${product.name}
                                                                                                    </button>
                                                                                                </h2>
                                                                                                <div id="accordion${product.id}"
                                                                                                    class="accordion-collapse collapse"
                                                                                                    data-bs-parent="#accordionExample">
                                                                                                    <div
                                                                                                        class="accordion-body">
                                                                                                        ${product.description}
                                                                                                        <br><br>
                                                                                                        Kích thước:
                                                                                                        ${product.dimensions}
                                                                                                        <br>
                                                                                                        Giá:&nbsp;
                                                                                                        ${product.price}
                                                                                                        <br>
                                                                                                        Vật liệu:&nbsp;
                                                                                                        ${product.material}


                                                                                                    </div>
                                                                                                </div>
                                                                                            </div>
                                                                                        </c:otherwise>
                                                                                    </c:choose>
                                                                                </c:forEach>

                                                                            </div>
                                                                        </div>

                                                                    </div>
                                                                </div>
                                                                <!-- Bootstrap crossfade carousel -->
                                                                <div class="col-md">
                                                                    <h5 class="my-4">Sản phẩm nổi bật</h5>

                                                                    <div id="carouselExample-cf"
                                                                        class="carousel carousel-dark slide carousel-fade"
                                                                        data-bs-ride="carousel">
                                                                        <ol class="carousel-indicators">
                                                                            <c:set var="iIndicator" value="0" />
                                                                            <c:forEach items="<%=products%>"
                                                                                var="product">
                                                                                <c:choose>
                                                                                    <c:when test="${iIndicator == 0}">
                                                                                        <li data-bs-target="#carouselExample-cf"
                                                                                            data-bs-slide-to="${iIndicator}"
                                                                                            class="active"></li>
                                                                                    </c:when>
                                                                                    <c:otherwise>
                                                                                        <li data-bs-target="#carouselExample-cf"
                                                                                            data-bs-slide-to="${iIndicator}">
                                                                                        </li>
                                                                                    </c:otherwise>
                                                                                </c:choose>

                                                                                <c:set var="iIndicator"
                                                                                    value="${iIndicator + 1}" />
                                                                            </c:forEach>
                                                                        </ol>

                                                                        <div class="carousel-inner">
                                                                            <c:set var="iCarousel" value="0" />
                                                                            <c:forEach items="<%=products%>"
                                                                                var="product">
                                                                                <c:choose>
                                                                                    <c:when test="${iCarousel == 0}">
                                                                                        <div
                                                                                            class="carousel-item active">
                                                                                            <img class="d-block w-100"
                                                                                                src="${product.thumbnail.split(",")[0]}"
                                                                                                alt="First slide" />
                                                                                            <div class="carousel-caption d-none d-md-block bg-gray p-2"
                                                                                                style="opacity: 0.9; bottom: 3.25rem">
                                                                                                <h3 class="text-white">
                                                                                                    ${product.name}</h3>
                                                                                                <p class="text-white">
                                                                                                    ${product.shortDescription}
                                                                                                </p>
                                                                                            </div>
                                                                                        </div>
                                                                                    </c:when>
                                                                                    <c:otherwise>
                                                                                        <div class="carousel-item">
                                                                                            <img class="d-block w-100"
                                                                                                src="${product.thumbnail.split(",")[0]}"
                                                                                                alt="First slide" />
                                                                                            <div class="carousel-caption d-none d-md-block bg-gray p-2"
                                                                                                style="opacity: 0.9; bottom: 3.25rem">
                                                                                                <h3 class="text-white">
                                                                                                    ${product.name}</h3>
                                                                                                <p class="text-white">
                                                                                                    ${product.shortDescription}
                                                                                                </p>
                                                                                            </div>
                                                                                        </div>
                                                                                    </c:otherwise>
                                                                                </c:choose>

                                                                                <c:set var="iCarousel"
                                                                                    value="${iCarousel + 1}" />
                                                                            </c:forEach>
                                                                        </div>
                                                                        <a class="carousel-control-prev"
                                                                            href="#carouselExample-cf" role="button"
                                                                            data-bs-slide="prev">
                                                                            <span class="carousel-control-prev-icon"
                                                                                aria-hidden="true"></span>
                                                                            <span
                                                                                class="visually-hidden">Previous</span>
                                                                        </a>
                                                                        <a class="carousel-control-next"
                                                                            href="#carouselExample-cf" role="button"
                                                                            data-bs-slide="next">
                                                                            <span class="carousel-control-next-icon"
                                                                                aria-hidden="true"></span>
                                                                            <span class="visually-hidden">Next</span>
                                                                        </a>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <style>
                                                            .mb-4 {
                                                                width: 98%;
                                                                margin-top: 2rem;
                                                            }
                                                            .cart-table {
                                                                margin-left: 50px;
                                                                width: 1150px;
                                                            }
                                                            thead{
                                                                background-color: #5bc0de;
                                                                text-align: center;
                                                            }
                                                            tr {
                                                                COLOR: RED;
                                                            }
                                                            td {
                                                                text-align: center;
                                                            }
                                                            table tr:nth-child(even) {
                                                                background-color: #f9f9f9;
                                                            }
                                                            table td:hover {
                                                                background-color: #e5e5e5;
                                                            }
                                                            .chart-container {
                                                                height: 300px;
                                                                border: 1px solid #ccc;
                                                                padding: 10px;
                                                                /*margin-left: 50px;*/
                                                                width: 555px;
                                                            }
                                                            .chart-container-order {
                                                                height: 300px;
                                                                border: 1px solid #ccc;
                                                                padding: 10px;
                                                                /*margin-left: 50px;*/
                                                                width: 555px;
                                                            }

                                                            .wrapper-chart-stistics{
                                                                display: grid;
                                                                grid-template-columns: 1fr 1fr;
                                                                grid-gap: 10px;
                                                                width: 1170px;
                                                                margin-left: 50px;
                                                            }
                                                            .dropdownYear {
                                                                position: relative;
                                                                display: inline-block;
                                                                margin-bottom: 40px;
                                                                margin-left: 10px;
                                                                height: 10px;
                                                            }
                                                            .dropbtn {
                                                                background-color: #4CAF50;
                                                                color: white;
                                                                padding: 10px ;
                                                                font-size: 16px;
                                                                border: none;
                                                                cursor: pointer;
                                                                /*padding-bottom: 20px;*/
                                                            }
                                                            .dropdown-content {
                                                                display: none;
                                                                position: absolute;
                                                                background-color: #f9f9f9;
                                                                min-width: 160px;
                                                                box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
                                                                z-index: 1;
                                                            }

                                                            .dropdown-content a {
                                                                color: black;
                                                                padding: 12px 16px;
                                                                text-decoration: none;
                                                                display: block;
                                                            }

                                                            .dropdown-content a:hover {background-color: #f1f1f1}

                                                            .dropdownYear:hover .dropdown-content {
                                                                display: block;
                                                            }

                                                            .dropdownYear:hover .dropbtn {
                                                                background-color: #3e8e41;
                                                            }

                                                            .dropdownYear:hover .dropdown-content {
                                                                display: block;
                                                            }

                                                            div#revenue {
                                                                margin-left: 500px;
                                                                font-size: 1rem;
                                                                color: black;

                                                            }
                                                            #select-revenue-year {
                                                                display: flex;
                                                                align-items: center;
                                                            }
                                                        </style>
                                                        <div>
<%--                                                            Số lượng--%>
<%--                                                            <%= s.getTotalOrder()%>--%>
<%--                                                        </div>--%>
                                                        <!-- Total Revenue -->

                                                    </div>

                                                </div>
                                                <!-- / Content -->

                                                <!-- Footer -->
                                                <footer class="content-footer footer bg-footer-theme">
                                                    <div
                                                        class="container-xxl d-flex flex-wrap justify-content-between py-2 flex-md-row flex-column">
                                                        <div class="mb-2 mb-md-0">
                                                            ©
                                                            <script>
                                                                document.write(new Date().getFullYear());
                                                            </script>
                                                        </div>

                                                    </div>
                                                </footer>
<%--                                                <!-- / Footer -->--%>
                                                <div class="content-backdrop fade"></div>
                                            </div>
                                            <!-- Content wrapper -->
                                        </div>
<%--                                        <!-- / Layout page -->--%>
                                    </div>

                                    <!-- Overlay -->
                                    <div class="layout-overlay layout-menu-toggle"></div>
                                    </div>

                                    <!-- Core JS -->
                                    <!-- build:js assets/vendor/js/core.js -->
                                    <script src="/assets/vendor/libs/jquery/jquery.js"></script>
                                    <script src="/assets/vendor/libs/popper/popper.js"></script>
                                    <script src="/assets/vendor/js/bootstrap.js"></script>
                                    <script src="/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>

                                    <script src="/assets/vendor/js/menu.js"></script>
                                    <!-- endbuild -->

                                    <!-- Vendors JS -->
<%--                                    <script src="/assets/vendor/libs/apex-charts/apexcharts.js"></script>--%>

                                    <!-- Main JS -->
                                    <script src="/assets/js_admin/main.js"></script>

                                    <!-- Page JS -->
                                    <script src="/assets/js_admin/dashboards-analytics.js"></script>

                                    <!-- Place this tag in your head or just before your close body tag. -->
                                    <script async defer src="https://buttons.github.io/buttons.js"></script>
                            <script>
                                // Lấy dữ liệu từ cơ sở dữ liệu (ví dụ: bảng statistics)
                                // Giả sử dữ liệu đã được lấy và lưu trong mảng data

                                var sales = <%=statisticsmonth%>; // Dữ liệu mẫu
                                var order= <%=orderByMonth%>; // Dữ liệu mẫu
                                // Tạo biểu đồ
                                var ctx = document.getElementById("myChart").getContext("2d");
                                var myChart = new Chart(ctx, {
                                    type: "bar",
                                    data: {
                                        labels: <%=getListMonth%>,
                                        datasets: [
                                            {
                                                label: "Doanh thu tháng " ,
                                                data: sales,
                                                backgroundColor: "rgba(0, 128, 255, 0.5)",
                                            },
                                        ],
                                    },
                                    options: {
                                        responsive: true,
                                        scales: {
                                            y: {
                                                beginAtZero: true,
                                            },
                                        },
                                    },
                                });
                                var ctxOrder = document.getElementById("myChartOrder").getContext("2d");
                                var myChartOrder = new Chart(ctxOrder, {
                                    type: "bar",
                                    data: {
                                        labels: <%=getListMonth%>,
                                        datasets: [
                                            {
                                                label: "Đơn hàng tháng " ,
                                                data: order,
                                                backgroundColor: "rgba(0, 128, 255, 0.5)",
                                            },
                                        ],
                                    },
                                    options: {
                                        responsive: true,
                                        scales: {
                                            y: {
                                                beginAtZero: true,
                                            },
                                        },
                                    },
                                });
                            </script>
                        </body>

                        </html>