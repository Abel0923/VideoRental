<!DOCTYPE html>
<html>
<head>
	<title></title>
	  <link rel="stylesheet" href="../../../../resources/static/vendors/mdi/css/materialdesignicons.min.css">
	    <link rel="stylesheet" href="../../../../resources/static/css/style.css">
          <link href="../../../../resources/static/css/font-awesome.css" rel="stylesheet">

          <style type="text/css">
                .active-home{
                    background-color: #f3f3f3;
                 }
          </style>
</head>
<body>
  <div class="container-scroller">
  	<nav class="navbar col-lg-12 col-12 p-0 fixed-top d-flex flex-row">
      <div class="navbar-brand-wrapper d-flex justify-content-center">
        <div class="navbar-brand-inner-wrapper d-flex justify-content-between align-items-center w-100">  
          <a class="navbar-brand brand-logo" href="index.html">
              <img src="../../../../resources/static/images/logo.svg" alt="logo"/>
            </a>
        </div>  
      </div>
      <div class="navbar-menu-wrapper d-flex align-items-center justify-content-end">
        <ul class="navbar-nav navbar-nav-right">
          <li class="nav-item dropdown mr-1">
            <a class="nav-link count-indicator dropdown-toggle d-flex justify-content-center align-items-center" 
                href="../../index.html">
              <i class="mdi mdi-logout text-primary mx-0"></i>
              Log out
            </a>
          </li>
          <li class="nav-item nav-profile dropdown">
            <a class="nav-link count-indicator dropdown-toggle d-flex justify-content-center align-items-center"  href="#" data-toggle="dropdown">
              <i class="mdi mdi-account-circle"></i>
              <span class="nav-profile-name">Louis Barnett</span>
            </a>
          </li>
        </ul>
      </div></nav>
  </div>

      <div class="container-fluid page-body-wrapper">
      <!-- partial:partials/_sidebar.html -->
      <nav class="sidebar sidebar-offcanvas" id="sidebar">
        <ul class="nav">
          <li class="nav-item active-home">
            <a class="nav-link" href="#">
              <i class="mdi mdi-home menu-icon"></i>
              <span class="menu-title">Home</span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="add-video.html">
              <i class="fa fa-film menu-icon"></i>
              <span class="menu-title">Add Videos</span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="list-customers.html">
              <i class="mdi mdi-account-multiple menu-icon"></i>
              <span class="menu-title">List Of Customers</span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="list-rented.html">
              <i class="mdi mdi-film menu-icon"></i>
              <span class="menu-title">Rented Videos</span>
            </a>
          </li>
  
        </ul>
      </nav>
        
        
        
      <!-- partial -->
<div class="main-panel">
  <div class="content-wrapper">      
  <!--              overview card   -->
    <div class="row">
                <div class="col-md-12 grid-margin stretch-card">
                  <div class="card">
                    <div class="card-body dashboard-tabs p-0">
    <!--                    tooler tab  -->
      <ul class="nav nav-tabs px-4" role="tablist">
                                    <li class="nav-item">
                                      <a class="nav-link active" id="overview-tab" data-toggle="tab" href="#overview" role="tab" aria-controls="overview" aria-selected="true">Overview</a>
                                    </li>
      </ul>                    
    <!--             toogled tab             -->
      <div class="tab-content py-0 px-0">
                              <div class="tab-pane fade show active" id="overview" role="tabpanel" aria-labelledby="overview-tab">
                                  <div class="d-flex flex-wrap justify-content-xl-between">
                                      <div class="d-none d-xl-flex border-md-right flex-grow-1 align-items-center justify-content-center p-3 item">
                                          <i class="mdi mdi-video icon-lg mr-3 text-primary"></i>
                                          <div class="d-flex flex-column justify-content-around">
                                            <small class="mb-1 text-muted">No of Videos</small>
                                            <div class="dropdown">
                                              <a class="btn btn-secondary p-0 bg-transparent border-0 text-dark shadow-none font-weight-medium" href="#" role="button" id="dropdownMenuLinkA" aria-haspopup="true" aria-expanded="false">
                                                <h5 class="mb-0 d-inline-block">201</h5>
                                              </a>
                                            </div>
                                          </div>
                                      </div>
                                      <div class="d-flex border-md-right flex-grow-1 align-items-center justify-content-center p-3 item">
                                            <i class="mdi mdi-account-multiple mr-3 icon-lg text-success"></i>
                                        <div class="d-flex flex-column justify-content-around">
                                            <small class="mb-1 text-muted">No. of Customers</small>
                                            <h5 class="mr-2 mb-0">80</h5>
                                        </div>
                                      </div>

                                      <div class="d-flex border-md-right flex-grow-1 align-items-center justify-content-center p-3 item">
                                          <i class="mdi mdi-film mr-3 icon-lg text-warning"></i>
                                          <div class="d-flex flex-column justify-content-around">
                                            <small class="mb-1 text-muted">No. of Rented Videos</small>
                                            <h5 class="mr-2 mb-0">78</h5>
                                          </div>
                                      </div>

                                      <div class="d-flex border-md-right flex-grow-1 align-items-center justify-content-center p-3 item">
                                          <i class="mdi mdi-currency-usd mr-3 icon-lg text-danger"></i>
                                          <div class="d-flex flex-column justify-content-around">
                                            <small class="mb-1 text-muted">Total Rent</small>
                                            <h5 class="mr-2 mb-0">$ 2012.99</h5>
                                          </div>
                                      </div>
                                        <div class="d-flex py-3 border-md-right flex-grow-1 align-items-center justify-content-center p-3 item">
                                          <i class="mdi mdi-flag mr-3 icon-lg text-danger"></i>
                                          <div class="d-flex flex-column justify-content-around">
                                            <small class="mb-1 text-muted">Flagged</small>
                                            <h5 class="mr-2 mb-0">3497843</h5>
                                          </div>
                                        </div>
                                  </div>
                                </div>
                              </div>
      </div>
      </div>
      </div>
    </div>
<!--  ///////////////////// END OF ROW CARD /////////////////////-->
    
    <div class="card">
    <!--            table       -->
          <div class="row">
            <div class="col-md-12 stretch-card">
              <div class="card">
                <div class="card-body">
                  <p class="card-title">Recent Videos</p>
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
  <script src="../../../../resources/static/vendors/base/vendor.bundle.base.js"></script>
  <script src="../../../../resources/static/js/dashboard.js"></script>
  <script src="../../../../resources/static/js/jquery.dataTables.js"></script>
</body>
</html>