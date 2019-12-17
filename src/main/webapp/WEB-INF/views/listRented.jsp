<!DOCTYPE html>
<html>
<head>
    <title></title>
    <link rel="stylesheet" href="vendors/mdi/css/materialdesignicons.min.css">
    <link rel="stylesheet" href="css/style.css">
    <link href="css/font-awesome.css" rel="stylesheet">

    <style type="text/css">
        .active li {
            background-color: #f3f3f3;
        }
    </style>
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
                                            <th>Uploaded Date</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <tr>
                                            <td>Jeremy Ortega</td>
                                            <td>Levelled up</td>
                                            <td>Catalinaborough</td>
                                            <td>$790</td>
                                            <td>06 Jan 2018</td>
                                        </tr>
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
</div>
</body>
</html>