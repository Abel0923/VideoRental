<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <title></title>
    <link rel="stylesheet" href="vendors/mdi/css/materialdesignicons.min.css">
    <link rel="stylesheet" href="css/style.css">
    <link href="css/font-awesome.css" rel="stylesheet">

</head>
<body>
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
            <!--              overview card   -->

            <div class="card">
                <!--            table       -->
                <div class="row">
                    <div class="col-md-12 stretch-card">
                        <div class="card">
                            <div class="card-body">
                                <p class="card-title">Customer</p>
                                <div class="table-responsive">
                                    <table id="recent-purchases-listing" class="table">
                                        <thead>
                                        <tr>
                                            <th>Title</th>
                                            <th>Category</th>
                                            <th>Genre</th>
                                            <th>Price</th>
                                            <th>Action</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${videos}" var="video">
                                            <tr>
                                                <td>${video.videoTitle}</td>
                                                <td>${video.videoType.type_title}</td>
                                                <td>${video.videoGenre.title}</td>
                                                <td>${video.price}</td>
                                                <td>
                                                    <a href="/delete_video/${video.videoId}" class="btn btn-outline-danger">
                                                        <i class="mdi mdi-delete"></i>
                                                        Delete
                                                    </a>
                                                </td>
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
    <script src="vendors/base/vendor.bundle.base.js"></script>
    <script src="js/dashboard.js"></script>
    <script src="js/jquery.dataTables.js"></script>
</body>
</html>