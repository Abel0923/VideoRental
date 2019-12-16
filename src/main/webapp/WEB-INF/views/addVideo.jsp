<!DOCTYPE html>
<html>
<head>
    <title>Video Detail</title>
    <link rel="stylesheet" href="vendors/mdi/css/materialdesignicons.min.css">
    <link rel="stylesheet" href="css/style.css">
    <link href="css/font-awesome.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="css/other_style.css"/>
    <script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>

    <link rel="stylesheet" href="vendors/base/vendor.bundle.base.css">


    <link rel="stylesheet" href="vendors/mdi/css/materialdesignicons.min.css">
    <link rel="stylesheet" href="vendors/base/vendor.bundle.base.css">
    <link rel="stylesheet" href="css/style.css">

    <style type="text/css">
        .menu-film-list{
            margin-top: -24px;
        }
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

    <!-- side bar -->
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

            <!-- video list -->
            <div class="menu-film-list">
            <div class="card" align="center">
                    <div class="card-body">
                        <h2 align="center"><i class="mdi mdi-video"></i> Add Videos </h2>
                        <hr>
                        <div class="col-md-6 grid-margin stretch-card" >
                          <div class="card" >
                            <div class="card-body">
                              <p class="card-description">
                              <form class="forms-sample">
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text">&nbsp;Film Title</span>
                                    </div>
                                   <input type="text" class="form-control" aria-label="Amount (to the nearest dollar)" >
                                </div>

                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text">&nbsp;Type</span>
                                    </div>
                                    <select class="form-control">
                                        <option>Action</option>
                                        <option>Comedy</option>
                                        <option>Romance</option>
                                        <option>Film</option>
                                    </select>
                                </div>

                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text">Genre</span>
                                    </div>

                                    <select class="form-control">
                                        <option>Action</option>
                                        <option>Comedy</option>
                                        <option>Romance</option>
                                        <option>Film</option>
                                    </select>
                                </div>

                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text">No. Of Videos</span>
                                    </div>
                                   <input type="number" class="form-control" placeholder="0" aria-label="Amount (to the nearest dollar)" >
                                </div>

                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text">Price $</span>
                                    </div>
                                   <input type="number" class="form-control" placeholder="0.00" aria-label="Amount (to the nearest dollar)" >
                                </div>

                                <button type="submit" class="btn btn-primary mr-2">Add Video</button>
                                <button class="btn btn-light">Cancel</button>
                              </form>
                              </p>
                            </div>
                          </div>
                        </div>
                    </div>
            </div>
        </div>
    </div>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>

    <script src="vendors/base/vendor.bundle.base.js"></script>
    <script src="js/off-canvas.js"></script>
    <script src="js/hoverable-collapse.js"></script>
    <script src="js/template.js"></script>
</body>
</html>