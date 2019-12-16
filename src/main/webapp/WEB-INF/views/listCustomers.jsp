<!DOCTYPE html>
<html>
<head>
	<title></title>
	  <link rel="stylesheet" href="vendors/mdi/css/materialdesignicons.min.css">
	    <link rel="stylesheet" href="css/style.css">
          <link href="css/font-awesome.css" rel="stylesheet">
                    <style type="text/css">
                .active{
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
              <img src="images/logo.svg" alt="logo"/>
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
                  <li class="nav-item">
                      <a class="nav-link" href="/admin">
                          <i class="mdi mdi-home menu-icon"></i>
                          <span class="menu-title">Home</span>
                      </a>
                  </li>
                  <li class="nav-item active">
                      <a class="nav-link" data-toggle="collapse" href="/admin_add_videos" aria-expanded="false" aria-controls="ui-basic">
                          <i class="fa fa-film menu-icon"></i>
                          <span class="menu-title">Add Videos</span>
                      </a>
                  </li>
                  <li class="nav-item">
                      <a class="nav-link" href="/admin_list_customers">
                          <i class="mdi mdi-account-multiple menu-icon"></i>
                          <span class="menu-title">List Of Customers</span>
                      </a>
                  </li>
                  <li class="nav-item">
                      <a class="nav-link" href="/admin_list_rented">
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
<!--            //////////////////////////////// -->
    </div>
  </div>
</div>
  <script src="vendors/base/vendor.bundle.base.js"></script>
  <script src="js/dashboard.js"></script>
  <script src="js/jquery.dataTables.js"></script>
</body>
</html>