
<div>
    <%@ include file="admin_header.jsp" %>
</div>

<div class="container-fluid page-body-wrapper">

    <!-- side bar -->
    <div>
        <%@ include file="admin_nav_bar.jsp" %>
    </div>

    <!-- partial -->
    <div class="main-panel">
        <div class="content-wrapper">
            <div class="row">
                <div class="col-md-12 grid-margin stretch-card">
                    <div class="card">
                        <div class="card-body dashboard-tabs p-0">
                            <ul class="nav nav-tabs px-4" role="tablist">
                                <li class="nav-item">
                                    <a class="nav-link" id="overview-tab" href="#overview"
                                       aria-controls="overview" aria-selected="true">
                                        <h3>Overview</h3></a>
                                </li>
                            </ul>
                            <div class="tab-content py-0 px-0">
                                <div class="tab-pane fade show active" id="overview" role="tabpanel"
                                     aria-labelledby="overview-tab">
                                    <div class="d-flex flex-wrap justify-content-xl-between">
                                        <div class="d-none d-xl-flex border-md-right flex-grow-1 align-items-center justify-content-center p-3 item">
                                            <i class="fa fa-film icon-lg mr-3 text-primary"></i>
                                            <div class="d-flex flex-column justify-content-around">
                                                <small class="mb-1 text-muted">No Of Videos</small>
                                                <div class="dropdown">
                                                    <a class="btn btn-secondary p-0 bg-transparent border-0 text-dark shadow-none font-weight-medium"
                                                       href="#" role="button" id="dropdownMenuLinkA"
                                                       data-toggle="dropdown" aria-haspopup="true"
                                                       aria-expanded="false">
                                                        <h5 class="mb-0 d-inline-block">${noOfVideos}</h5>
                                                    </a>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="d-flex border-md-right flex-grow-1 align-items-center justify-content-center p-3 item">
                                            <i class="mdi mdi-currency-usd mr-3 icon-lg text-danger"></i>
                                            <div class="d-flex flex-column justify-content-around">
                                                <small class="mb-1 text-muted">No of Customers</small>
                                                <h5 class="mr-2 mb-0">20</h5>
                                            </div>
                                        </div>
                                        <div class="d-flex border-md-right flex-grow-1 align-items-center justify-content-center p-3 item">
                                            <i class="mdi mdi-eye mr-3 icon-lg text-success"></i>
                                            <div class="d-flex flex-column justify-content-around">
                                                <small class="mb-1 text-muted">No of Rented Videos</small>
                                                <h5 class="mr-2 mb-0">30</h5>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

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
                <!--//////////////////////////////// -->
            </div>
        </div>

    </div>
</div>
</div>
<script src="vendors/base/vendor.bundle.base.js"></script>
<script src="js/dashboard.js"></script>
<script src="js/jquery.dataTables.js"></script>
</body>
</html>