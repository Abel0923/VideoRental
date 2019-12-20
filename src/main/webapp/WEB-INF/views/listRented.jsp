<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div>
    <%@ include file="admin_header.jsp" %>
</div>

<div class="container-fluid page-body-wrapper">
    <!-- partial:partials/_sidebar.html -->
    <!-- side bar -->
    <div>
        <%@ include file="admin_nav_bar.jsp" %>
    </div>


    <!-- partial -->
    <div class="main-panel">
        <div class="content-wrapper">

            <div class="card">
                <!--            table       -->
                <div class="row">
                    <div class="col-md-12 stretch-card">
                        <div class="card">
                            <div class="card-body">
                                <p class="card-title">Rented Videos</p>
                                <div class="table-responsive">
                                    <table id="recent-purchases-listing" class="table">
                                        <thead>
                                        <tr>
                                            <th>Title</th>
                                            <th>Category</th>
                                            <th>Genre</th>
                                            <th>Price</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${rented}" var="rented">
                                        <tr>
                                            <td>${rented.videoTitle}</td>
                                            <td>${rented.videoType.type_title}</td>
                                            <td>${rented.videoGenre.title}</td>
                                            <td>${rented.price}</td>
                                        </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!--            //////////////////////////////// -->
            </div>
        </div>
    </div>
    <script src="/vendors/base/vendor.bundle.base.js"></script>
    <script src="/js/dashboard.js"></script>
    <script src="/js/jquery.dataTables.js"></script>
</div>
</body>
</html>