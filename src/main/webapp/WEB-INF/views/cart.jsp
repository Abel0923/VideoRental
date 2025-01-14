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
                                    <c:forEach items="${MY_CART}" var="cart" varStatus="loop">
                                    <tr>
                                        <td>${cart.title}</td>
                                        <td>${cart.genre.title}</td>
                                        <td>${cart.type.type_title}</td>
                                        <td>${cart.age}</td>
                                        <td>${cart.year}</td>
                                        <td>${cart.type.price}</td>
                                        <td align="center">
                                                ${cart.noOfDays}
                                        </td>
                                        <td>
                                            <a href="/user/cart/delete/${loop.index}"><i class="mdi mdi-cart-remove" ></i></a>
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
                                        <td align="center" class="total_price">${total_price}&nbsp;ETB</td>
                                        <td>
                                            <form action="/user/cart/pay" method="post">
                                            <button class="btn btn-outline-success btn-sm">
                                                <i class="mdi mdi-paypal"></i>&nbsp;Pay</button>
                                            </form>
                                        </td>
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

</body>
</html>