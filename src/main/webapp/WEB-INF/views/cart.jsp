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

<div>
    <%@ include file="user_header.jsp"%>
</div>

<div class="container-fluid page-body-wrapper">

    <div>
        <%@ include file="user_nav_bar.jsp"%>
    </div>

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