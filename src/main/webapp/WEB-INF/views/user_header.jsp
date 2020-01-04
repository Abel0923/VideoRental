<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta id="google_signin_client_id" content="807051135293-9n2lon7vtkkchigh4roie3901jc678us.apps.googleusercontent.com"/>
    <link rel="stylesheet" href="/vendors/mdi/css/materialdesignicons.min.css">
    <link rel="stylesheet" href="/css/style.css">
    <link href="/css/font-awesome.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="/css/other_style.css"/>
    <script type="text/javascript" src="/js/jquery-2.1.4.min.js"></script>

    <link rel="stylesheet" href="vendors/base/vendor.bundle.base.css">

    <link rel="stylesheet" href="/vendors/mdi/css/materialdesignicons.min.css">
    <link rel="stylesheet" href="/css/style.css">
    <link href="/css/font-awesome.css" rel="stylesheet">

    <style type="text/css">
        .menu-film-list {
            margin-top: -24px;
        }

        .active {
            background-color: #f3f3f3;
        }

        .carousel-inner .carousel-item img {
            height: 16rem;
        }
        #ex4 .p1[data-count]:after{
            position:absolute;
            right:10%;
            top:8%;
            content: attr(data-count);
            font-size:40%;
            padding:.2em;
            border-radius:50%;
            line-height:1em;
            color: white;
            background:rgba(255,0,0,.85);
            text-align:center;
            min-width: 1em;
        //font-weight:bold;
        }
    </style>

</head>
<body>
<div class="container-scroller">
    <nav class="navbar col-lg-12 col-12 p-0 fixed-top d-flex flex-row">
        <div class="navbar-brand-wrapper d-flex justify-content-center">
            <div class="navbar-brand-inner-wrapper d-flex justify-content-between align-items-center w-100">
                <a class="navbar-brand brand-logo" href="index.html">
                    <img src="/images/movie.svg" alt="logo"/>
                </a>
            </div>
        </div>
        <div class="navbar-menu-wrapper d-flex align-items-center justify-content-end">
            <ul class="navbar-nav navbar-nav-right">
                <li class="nav-item dropdown mr-1">
                    <a class="nav-link count-indicator dropdown-toggle d-flex justify-content-center align-items-center"
                       href="/login">
                        <i class="mdi mdi-login text-primary mx-0"></i>
                        Log In
                    </a>
                </li>
                <li class="nav-item dropdown mr-1">
                    <c:if test="${not empty cart}">
                        <div id="ex4" class="nav-link">
                          <span class="p1 fa-stack fa-2x has-badge" data-count="${cart.size()}">
                            <!--<i class="p2 fa fa-circle fa-stack-2x"></i>-->
                            <i class="mdi mdi-cart fa-stack-1x  text-primary mx-0" data-count="4b"></i>
                          </span> <a href="/user/cart">Cart</a>
                        </div>
                    </c:if>
                    <c:if test="${empty cart}">
                        <a class="nav-link count-indicator dropdown-toggle d-flex justify-content-center align-items-center"
                           href="/user/cart">
                            <i class="mdi mdi-cart text-primary mx-0"></i>
                            Cart
                        </a>
                    </c:if>

                </li>
                <li class="nav-item nav-profile dropdown">
                    <a class="nav-link count-indicator dropdown-toggle d-flex justify-content-center align-items-center"
                       href="#" data-toggle="dropdown">
                        <i class="mdi mdi-account-circle"></i>
                        <span class="nav-profile-name">USER</span>
                    </a>
                </li>
            </ul>
        </div>
    </nav>
</div>
</body>
</html>