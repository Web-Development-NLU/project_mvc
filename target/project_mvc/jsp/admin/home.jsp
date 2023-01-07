<%--
  Created by IntelliJ IDEA.
  User: Quang Tho
  Date: 29/12/2022
  Time: 10:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>

<html
        lang="en"
        class="light-style layout-menu-fixed"
        dir="ltr"
        data-theme="theme-default"
        data-assets-path="/assets/"
        data-template="vertical-menu-template-free"
>
<head>
    <meta charset="utf-8"/>
    <meta
            name="viewport"
            content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0"
    />

    <title>home-page</title>

    <meta name="description" content=""/>

    <!-- Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com"/>
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin/>
    <link
            href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap"
            rel="stylesheet"
    />

    <!-- Icons. Uncomment required icon fonts -->
    <link rel="stylesheet" href="/assets/vendor/fonts/boxicons.css"/>

    <!-- Core CSS -->
    <link rel="stylesheet" href="/assets/vendor/css/style.css">
    <!-- Vendors CSS -->
    <link rel="stylesheet" href="/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.css"/>

    <link rel="stylesheet" href="/assets/vendor/libs/apex-charts/apex-charts.css"/>

    <!-- Page CSS -->

    <!-- Helpers -->
    <script src="/assets/vendor/js/helpers.js"></script>

    <!--! Template customizer & Theme config files MUST be included after core stylesheets and helpers.js in the <head> section -->
    <!--? Config:  Mandatory theme config file contain global vars & default theme options, Set your preferred theme option in this file.  -->
    <script src="/assets/js_admin/config.js"></script>
</head>

<body>
<!-- Layout wrapper -->
<div class="layout-wrapper layout-content-navbar">
    <div class="layout-container">
        <!-- Menu -->

        <jsp:include page="common/menu.jsp"/>
        <!-- / Menu -->

        <!-- Layout container -->
        <div class="layout-page">
            <!-- Navbar -->

            <jsp:include page="common/navbar.jsp"/>

            <!-- / Navbar -->

            <!-- Content wrapper -->
            <div class="content-wrapper">
                <!-- Content -->

                <div class="container-xxl flex-grow-1 container-p-y">
                    <div class="row">
                        <div class="row">
                            <!-- Bootstrap carousel -->
                            <div class="col-md">
                                <h5 class="my-4">Thông tin sản phẩm</h5>

                                <div class="row">
                                    <div class="col-md mb-4 mb-md-0">
                                        <small class="text-light fw-semibold">Product Detail </small>
                                        <div class="accordion mt-3" id="accordionExample">
                                            <div class="card accordion-item active">
                                                <h2 class="accordion-header" id="headingOne">
                                                    <button
                                                            type="button"
                                                            class="accordion-button"
                                                            data-bs-toggle="collapse"
                                                            data-bs-target="#accordionOne"
                                                            aria-expanded="true"
                                                            aria-controls="accordionOne"
                                                    >
                                                        GHẾ BÀNH BỌC NỆM FEMI
                                                    </button>
                                                </h2>

                                                <div
                                                        id="accordionOne"
                                                        class="accordion-collapse collapse show"
                                                        data-bs-parent="#accordionExample"
                                                >
                                                    <div class="accordion-body">
                                                        Với nhiều tùy chọn màu bọc theo xu hướng, chiếc ghế bành này là sự bổ sung lý tưởng cho các phòng có hình dạng,
                                                        kiểu dáng và bảng màu khác nhau. Được chế tác từ một khung làm bằng gỗ dán chắc chắn và gỗ kỹ thuật,
                                                        nó cung cấp bốn chân gỗ đen thon, hơi loe,
                                                        tương phản tuyệt đẹp với loại vải có màu sắc rắn chắc ở phía trên.
                                                        <br><br>
                                                        Kích thước:&nbsp;W865 x D(905-1260) x H(1280-1335) mm
                                                        <br>
                                                        Màu sắc:&nbsp; Màu xám
                                                        <br>
                                                        Vật liệu:&nbsp; Gỗ cao su, bọc nệm
                                                        <br>
                                                        Loại sản phẩm:&nbsp;Ghế
                                                        <br>
                                                        Kiểu dáng:&nbsp;Hiện đại
                                                        <br>
                                                        Kích thước: Lớn
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="card accordion-item">
                                                <h2 class="accordion-header" id="headingTwo">
                                                    <button
                                                            type="button"
                                                            class="accordion-button collapsed"
                                                            data-bs-toggle="collapse"
                                                            data-bs-target="#accordionTwo"
                                                            aria-expanded="false"
                                                            aria-controls="accordionTwo"
                                                    >
                                                        ĐÈN BỌC LƯỚI THÉP
                                                    </button>
                                                </h2>
                                                <div
                                                        id="accordionTwo"
                                                        class="accordion-collapse collapse"
                                                        aria-labelledby="headingTwo"
                                                        data-bs-parent="#accordionExample"
                                                >
                                                    <div class="accordion-body">
                                                        Đèn này có một cái nhìn táo bạo ngay lập tức thu hút mắt, vì vậy nó rất lý tưởng cho bất kỳ người trang trí
                                                        sành điệu nào đang tìm cách đưa ra tuyên bố. Khung được làm từ kim loại và có hình bóng giống như lồng với lớp kim loại bóng mượt.
                                                        Nó được hỗ trợ bởi một tấm đệm tròn và một cánh tay mỏng với chi tiết giống như chuỗi. Bên trong bóng râm mờ bên trong,
                                                        bộ đồ cứng này có đèn LED tích hợp. Điều đó có nghĩa là bạn có thể thêm nó vào không gian của mình ngay khi nó đến,
                                                        mà không phải lo lắng về việc tìm một bóng đèn.
                                                        <br><br>
                                                        Kích thước:&nbsp;6.25'' H X 7'' W X 8'' D
                                                        <br>
                                                        Màu sắc:&nbsp;Trắng
                                                        <br>
                                                        Vật liệu:&nbsp;Hỗn hợp vải lanh, kim loại, thủy tinh
                                                        <br>
                                                        Kiểu dáng:&nbsp;Phương tây


                                                    </div>
                                                </div>
                                            </div>
                                            <div class="card accordion-item">
                                                <h2 class="accordion-header" id="headingThree">
                                                    <button
                                                            type="button"
                                                            class="accordion-button collapsed"
                                                            data-bs-toggle="collapse"
                                                            data-bs-target="#accordionThree"
                                                            aria-expanded="false"
                                                            aria-controls="accordionThree"
                                                    >
                                                        GIƯỜNG KITKA
                                                    </button>
                                                </h2>
                                                <div
                                                        id="accordionThree"
                                                        class="accordion-collapse collapse"
                                                        aria-labelledby="headingThree"
                                                        data-bs-parent="#accordionExample"
                                                >
                                                    <div class="accordion-body">
                                                        Giường ngủ KITKA có thiết kế vững chãi,
                                                        chất liệu gỗ cao su và màu sắc ấm áp,
                                                        đem đến vẻ đẹp sang trọng cho căn phòng.
                                                        <br>
                                                        Kích thước:&nbsp;180 x 200cm
                                                        <br>
                                                        Màu sắc:&nbsp;Màu gỗ
                                                        <br>
                                                        Kiểu dáng:&nbsp; Hiện đại
                                                        <br>
                                                        Vật liệu:&nbsp; Gỗ cao su, ván ép
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </div>
                            <!-- Bootstrap crossfade carousel -->
                            <div class="col-md">
                                <h5 class="my-4">Sản phẩm nổi bật</h5>

                                <div
                                        id="carouselExample-cf"
                                        class="carousel carousel-dark slide carousel-fade"
                                        data-bs-ride="carousel"
                                >
                                    <ol class="carousel-indicators">
                                        <li data-bs-target="#carouselExample-cf" data-bs-slide-to="0"
                                            class="active"></li>
                                        <li data-bs-target="#carouselExample-cf" data-bs-slide-to="1"></li>
                                        <li data-bs-target="#carouselExample-cf" data-bs-slide-to="2"></li>
                                    </ol>
                                    <div class="carousel-inner">
                                        <div class="carousel-item active">
                                            <img class="d-block w-100" src="https://secure.img1-cg.wfcdn.com/im/7798995/resize-h500-w500%5Ecompr-r85/1882/188295243/Femi+Upholstered+Armchair.jpg"
                                                 alt="First slide"/>
                                            <div class="carousel-caption d-none d-md-block">
                                                <h3>GHẾ BÀNH BỌC NỆM FEMI</h3>
                                                <p>Được chế tác từ một khung làm bằng gỗ dán chắc chắn và gỗ kỹ thuật, nó cung cấp bốn chân gỗ đen thon,
                                                    hơi loe, tương phản tuyệt đẹp với loại vải có màu sắc rắn chắc ở phía trên.</p>
                                            </div>
                                        </div>
                                        <div class="carousel-item">
                                            <img class="d-block w-100"
                                                 src="https://secure.img1-cg.wfcdn.com/im/81498417/resize-h800-w800%5Ecompr-r85/2091/209146275/Northampt+2+-+Light+Bath+Bar.jpg"
                                                 alt="Second slide"/>
                                            <div class="carousel-caption d-none d-md-block">
                                                <h3>ĐÈN BỌC LƯỚI THÉP</h3>
                                                <p>Khung được làm từ kim loại và có hình bóng giống như lồng với lớp kim loại bóng mượt.
                                                    </p>
                                            </div>
                                        </div>
                                        <div class="carousel-item">
                                            <img class="d-block w-100" src="https://baya.vn/media/catalog/product/cache/26ca5c7013acde829a5e76d2852b1d14/k/i/kitka_bed_baya_5043_inspiration.jpg"
                                                 alt="Third slide"/>
                                            <div class="carousel-caption d-none d-md-block">
                                                <h3>GIƯỜNG KITKA</h3>
                                                <p>Giường ngủ KITKA có thiết kế vững chãi, chất liệu gỗ cao su và màu sắc ấm áp, đem đến vẻ đẹp sang trọng cho căn phòng.</p>
                                            </div>
                                        </div>
                                    </div>
                                    <a class="carousel-control-prev" href="#carouselExample-cf" role="button"
                                       data-bs-slide="prev">
                                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                        <span class="visually-hidden">Previous</span>
                                    </a>
                                    <a class="carousel-control-next" href="#carouselExample-cf" role="button"
                                       data-bs-slide="next">
                                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                        <span class="visually-hidden">Next</span>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Total Revenue -->
                    

                    <style>
                        .mb-4 {
                            width: 98%;
                            margin-top: 2rem;
                        }

                    </style>
                </div>

            </div>
            <!-- / Content -->

            <!-- Footer -->
            <footer class="content-footer footer bg-footer-theme">
                <div class="container-xxl d-flex flex-wrap justify-content-between py-2 flex-md-row flex-column">
                    <div class="mb-2 mb-md-0">
                        ©
                        <script>
                            document.write(new Date().getFullYear());
                        </script>
                    </div>

                </div>
            </footer>
            <!-- / Footer -->
            <div class="content-backdrop fade"></div>
        </div>
        <!-- Content wrapper -->
    </div>
    <!-- / Layout page -->
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
<script src="/assets/vendor/libs/apex-charts/apexcharts.js"></script>

<!-- Main JS -->
<script src="/assets/js_admin/main.js"></script>

<!-- Page JS -->
<script src="/assets/js_admin/dashboards-analytics.js"></script>

<!-- Place this tag in your head or just before your close body tag. -->
<script async defer src="https://buttons.github.io/buttons.js"></script>
</body>
</html>

