<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
    <title>Home</title>
    <link rel="stylesheet" href="vendors/mdi/css/materialdesignicons.min.css">
    <link rel="stylesheet" href="css/style.css">
    <link href="css/font-awesome.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="css/other_style.css"/>
    <script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>

    <style type="text/css">
        .carousel-inner .carousel-item img {
            height: 16rem;
        }
        .noOfDays{
            border: none;
            text-align: center;
        }
    </style>


</head>
<body>

<div class="container-scroller">
    <nav class="navbar col-lg-12 col-12 p-0 fixed-top d-flex flex-row">
        <div class="navbar-brand-wrapper d-flex justify-content-center">
            <div class="navbar-brand-inner-wrapper d-flex justify-content-between align-items-center w-100">
                <a class="navbar-brand brand-logo" href="index.html">
                    <img src="images/logo.svg" alt="logo"/>
                </a>
            </div>
        </div>
        <div class="navbar-menu-wrapper d-flex align-items-center justify-content-end">
            <ul class="navbar-nav navbar-nav-right">
                <li class="nav-item dropdown mr-1">
                    <a class="nav-link count-indicator dropdown-toggle d-flex justify-content-center align-items-center"
                       href="${loginUrl}">
                        <i class="mdi mdi-login text-primary mx-0"></i>
                        Log In
                    </a>
                </li>
                <li class="nav-item dropdown mr-1">
                    <a class="nav-link count-indicator dropdown-toggle d-flex justify-content-center align-items-center"
                       href="/cart">
                        <i class="mdi mdi-cart text-primary mx-0"></i>
                        Cart
                    </a>
                </li>
                <li class="nav-item nav-profile dropdown">
                    <a class="nav-link count-indicator dropdown-toggle d-flex justify-content-center align-items-center"
                       href="#" data-toggle="dropdown">
                        <i class="mdi mdi-account-circle"></i>
                        <span class="nav-profile-name">Louis Barnett</span>
                    </a>
                </li>
            </ul>
        </div>
    </nav>
</div>

<div class="container-fluid page-body-wrapper">

    <!-- side bar -->
    <nav class="sidebar sidebar-offcanvas" style="position: fixed;" id="sidebar">
        <ul class="nav">
            <h3 align="center">Movie Types</h3>
            <li class="nav-item">
                <a class="nav-link" methods="post" href="/">
                    <span class="menu-title">All</span>
                </a>
            </li>
            <c:forEach items="${genre}" var="genre">
                <li class="nav-item">
                    <a class="nav-link" methods="post" href="/genre/${genre.id}">
                        <span class="menu-title">${genre.title}</span>
                    </a>
                </li>
            </c:forEach>
        </ul>
    </nav>

    <!-- partial -->
    <div class="main-panel" style="margin-left: 18%; ">
        <div class="content-wrapper">

            <!-- video list -->
            <div class="menu-film-list">
                <div class="col-md-12 stretch-card">
                    <div class="card">
                        <div class="card-body">
                            <c:if test="${not empty MY_CART}">
                            <p class="card-title"><i class="mdi mdi-cart"></i>&nbsp;On Cart</p>
                            <div class="table-responsive">
                                <table id="recent-purchases-listing" class="table">
                                    <thead>
                                    <tr>
                                        <th>Title</th>
                                        <th>Genre</th>
                                        <th>Type</th>
                                        <th>Age</th>
                                        <th>Year</th>
                                        <th>Price</th>
                                        <th>No. of Day</th>
                                        <th>Action</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${MY_CART}" var="cart">
                                    <tr>
                                        <td>${cart.videoTitle}</td>
                                        <td>${cart.videoGenre.title}</td>
                                        <td>${cart.videoType.type_title}</td>
                                        <td>${cart.age}</td>
                                        <td>${cart.year}</td>
                                        <td>${cart.price}</td>
                                        <td align="center">
                                            <i class="mdi mdi-minus-circle sub" id="sub"></i>
                                            <input type="number" id="1" value="${cart.onOfDays}" min="1" max="3" class="noOfDays" disabled/>
                                            <i class="mdi mdi-plus-circle add" id="add"></i>
                                        </td>
                                        <td>
                                            <a href="/cart/delete/${cart.videoId}"><i class="mdi mdi-cart-remove" ></i></a>
                                        </td>
                                    </tr>
                                    </c:forEach>
                                    <tr>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td style="float: right">Total Price : </td>
                                        <td align="center">${total_price}&nbsp;ETB</td>
                                    </tr>

                                    </tbody>
                                </table>
                            </div>
                            </c:if>
                            <c:if test="${empty MY_CART}">
                                <h1><i class="mdi mdi-cart-off"></i>&nbsp;Empty Cart!</h1>
                            </c:if>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script>
    $('.add').click(function () {
        if ($(this).prev().val() < 3) {
            $(this).prev().val(+$(this).prev().val() + 1);
        }
    });
    $('.sub').click(function () {
        if ($(this).next().val() > 1) {
            if ($(this).next().val() > 1) $(this).next().val(+$(this).next().val() - 1);
        }
    });
</script>
</body>
</html>