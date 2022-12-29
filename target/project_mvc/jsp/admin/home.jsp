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
                                <h5 class="my-4">Product information</h5>

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
                                                        Cost storages
                                                    </button>
                                                </h2>

                                                <div
                                                        id="accordionOne"
                                                        class="accordion-collapse collapse show"
                                                        data-bs-parent="#accordionExample"
                                                >
                                                    <div class="accordion-body">
                                                        Lemon drops chocolate cake gummies carrot cake chupa chups
                                                        muffin topping. Sesame snaps icing
                                                        marzipan gummi bears macaroon dragée danish caramels powder.
                                                        Bear claw dragée pastry topping
                                                        soufflé. Wafer gummi bears marshmallow pastry pie.
                                                        <br><br>
                                                        Dimensions:&nbsp;30 × 69.9 × 24 cm
                                                        <br>
                                                        Color :&nbsp; Beige, Burgundy, Green, White
                                                        <br>
                                                        Hanging Rail:&nbsp; Stainless steel
                                                        <br>
                                                        Product Type:&nbsp;Wall shelf with clothes rack
                                                        <br>
                                                        Pattern:&nbsp; Fabic, Leather, Plastic, Plywood, Wood
                                                        <br>
                                                        Size:&nbsp;Medium, Small
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
                                                        Baniversary Chair
                                                    </button>
                                                </h2>
                                                <div
                                                        id="accordionTwo"
                                                        class="accordion-collapse collapse"
                                                        aria-labelledby="headingTwo"
                                                        data-bs-parent="#accordionExample"
                                                >
                                                    <div class="accordion-body">
                                                        Pellentesque habitant morbi tristique senectus et netus et
                                                        malesuada fames ac turpis egestas. Vestibulum tortor quam,
                                                        feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu
                                                        libero sit amet quam egestas semper. Aenean ultricies mi vitae
                                                        est. Mauris placerat eleifend leo.

                                                        Lorem ipsum was conceived as filler text, formatted in a certain
                                                        way to enable the presentation of graphic elements in documents,
                                                        without the need for formal copy. Using Lorem Ipsum allows
                                                        designers to put together layouts and the form of the content
                                                        before the content has been created, giving the design and
                                                        production process more freedom.
                                                        <br><br>
                                                        Dimensions:&nbsp;50 × 83 cm
                                                        <br>
                                                        Color:&nbsp;Beige
                                                        <br>
                                                        Material:&nbsp;Wood
                                                        <br>
                                                        Pattern:&nbsp; Fabic


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
                                                        Le klnit
                                                    </button>
                                                </h2>
                                                <div
                                                        id="accordionThree"
                                                        class="accordion-collapse collapse"
                                                        aria-labelledby="headingThree"
                                                        data-bs-parent="#accordionExample"
                                                >
                                                    <div class="accordion-body">
                                                        Pellentesque habitant morbi tristique senectus et netus et
                                                        malesuada fames ac turpis egestas. Vestibulum tortor quam,
                                                        feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu
                                                        libero sit amet quam egestas semper. Aenean ultricies mi vitae
                                                        est. Mauris placerat eleifend leo.

                                                        Lorem ipsum was conceived as filler text, formatted in a certain
                                                        way to enable the presentation of graphic elements in documents,
                                                        without the need for formal copy. Using Lorem Ipsum allows
                                                        designers to put together layouts and the form of the content
                                                        before the content has been created, giving the design and
                                                        production process more freedom.
                                                        <br><br>
                                                        Weight 2.5 kg
                                                        <br>
                                                        Dimensions:&nbsp;55 × 25 cm
                                                        <br>
                                                        Color:&nbsp; Black
                                                        <br>
                                                        Lamp Type:&nbsp; No
                                                        <br>
                                                        Lamping:&nbsp; No
                                                        <br>
                                                        Material:&nbsp; birch veneer
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </div>
                            <!-- Bootstrap crossfade carousel -->
                            <div class="col-md">
                                <h5 class="my-4">Hot Products</h5>

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
                                            <img class="d-block w-100" src="/assets/img_admin/product/Cost_storages.png"
                                                 alt="First slide"/>
                                            <div class="carousel-caption d-none d-md-block">
                                                <h3>Cost storages</h3>
                                                <p>Eos mutat malis maluisset et, agam ancillae quo te, in vim congue
                                                    pertinacia.</p>
                                            </div>
                                        </div>
                                        <div class="carousel-item">
                                            <img class="d-block w-100"
                                                 src="/assets/img_admin/product/baniversary_Chair.png"
                                                 alt="Second slide"/>
                                            <div class="carousel-caption d-none d-md-block">
                                                <h3>Baniversary Chair</h3>
                                                <p>In numquam omittam sea.</p>
                                            </div>
                                        </div>
                                        <div class="carousel-item">
                                            <img class="d-block w-100" src="/assets/img_admin/product/le_klnit.png"
                                                 alt="Third slide"/>
                                            <div class="carousel-caption d-none d-md-block">
                                                <h3>Le klnit</h3>
                                                <p>Lorem ipsum dolor sit amet, virtute consequat ea qui, minim graeco
                                                    mel no.</p>
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
                    <div class="col-12 col-lg-8 order-2 order-md-3 order-lg-2 mb-4">
                        <div class="card">
                            <div class="row row-bordered g-0">
                                <div class="col-md-8">
                                    <h5 class="card-header m-0 me-2 pb-3">Total Revenue</h5>
                                    <div id="totalRevenueChart" class="px-2"></div>
                                </div>
                                <div class="col-md-4">
                                    <div class="card-body">
                                        <div class="text-center">
                                            <div class="dropdown">
                                                <button
                                                        class="btn btn-sm btn-outline-primary dropdown-toggle"
                                                        type="button"
                                                        id="growthReportId"
                                                        data-bs-toggle="dropdown"
                                                        aria-haspopup="true"
                                                        aria-expanded="false"
                                                >
                                                    2022
                                                </button>
                                                <div class="dropdown-menu dropdown-menu-end"
                                                     aria-labelledby="growthReportId">
                                                    <a class="dropdown-item" href="javascript:void(0);">2021</a>
                                                    <a class="dropdown-item" href="javascript:void(0);">2020</a>
                                                    <a class="dropdown-item" href="javascript:void(0);">2019</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div id="growthChart"></div>
                                    <div class="text-center fw-semibold pt-3 mb-2">62% Company Growth</div>

                                    <div class="d-flex px-xxl-4 px-lg-2 p-4 gap-xxl-3 gap-lg-1 gap-3 justify-content-between">
                                        <div class="d-flex">
                                            <div class="me-2">
                                                <span class="badge bg-label-primary p-2"><i
                                                        class="bx bx-dollar text-primary"></i></span>
                                            </div>
                                            <div class="d-flex flex-column">
                                                <small>2022</small>
                                                <h6 class="mb-0">$32.5k</h6>
                                            </div>
                                        </div>
                                        <div class="d-flex">
                                            <div class="me-2">
                                                <span class="badge bg-label-info p-2"><i
                                                        class="bx bx-wallet text-info"></i></span>
                                            </div>
                                            <div class="d-flex flex-column">
                                                <small>2021</small>
                                                <h6 class="mb-0">$41.2k</h6>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    / Total Revenue
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
                        <a href="https://themeselection.com" target="_blank" class="footer-link fw-bolder">Furniture</a>
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

