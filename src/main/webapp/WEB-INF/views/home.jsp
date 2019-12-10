<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 %>
<c:url var="loginUrl" value="/login"/>
<c:url var="video" value="/video"/>
<!DOCTYPE html>
<html>
<head>
	<title>Home</title>
	  <link rel="stylesheet" href="vendors/mdi/css/materialdesignicons.min.css">
	  <link rel="stylesheet" href="css/style.css">
	  <link href="css/font-awesome.css" rel="stylesheet"> 
  	  <link rel="stylesheet" type="text/css" href="css/other_style.css"/>
  	  <script type="text/javascript" src="js/jquery.min.js"></script>

  	  <style type="text/css">
  	  	.carousel-inner .carousel-item img{
  	  		height: 16rem;
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
            	href="${loginUrl}">
              <i class="mdi mdi-login text-primary mx-0"></i>
              Log In
            </a>
          </li>
          <li class="nav-item dropdown mr-1">
            <a class="nav-link count-indicator dropdown-toggle d-flex justify-content-center align-items-center" 
            	href="cart.html">
              <i class="mdi mdi-cart text-primary mx-0"></i>
              Cart
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
    <nav class="sidebar sidebar-offcanvas" style="position: fixed;" id="sidebar">
        <ul class="nav">
      <h3 align="center">Movie Types</h3>
          <li class="nav-item">
            <a class="nav-link" href="/video/action">
              <span class="menu-title">Action</span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#ui-basic" aria-expanded="false" aria-controls="ui-basic">
              <span class="menu-title">Romance</span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="pages/forms/basic_elements.html">
              <span class="menu-title">Comedy</span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="pages/charts/chartjs.html">
              <span class="menu-title">Horror</span>
            </a>
          </li>
  
        </ul>
    </nav>
        
      <!-- partial -->
<div class="main-panel" style="margin-left: 18%; ">
	<div class="content-wrapper">

		<!-- carousel -->
		<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel" style="margin-top: -30px;">
		  <ol class="carousel-indicators">
		    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
		    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
		    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
		  </ol>
		  <div class="carousel-inner">
		    <div class="carousel-item active">
		      <img class="d-block w-100" src="images/film8.png" alt="First slide">
		    </div>
		    <div class="carousel-item">
		      <img class="d-block w-100" src="images/film4.png" alt="Second slide">
		    </div>
		    <div class="carousel-item">
		      <img class="d-block w-100" src="images/film5.png" alt="Third slide">
		    </div>
		  </div>
		  <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
		    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
		    <span class="sr-only">Previous</span>
		  </a>
		  <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
		    <span class="carousel-control-next-icon" aria-hidden="true"></span>
		    <span class="sr-only">Next</span>
		  </a>
		</div>

		<!-- video list -->
		<div class="menu-film-list">
			<ul style="list-style: none;">
				<li style="float: left;">
					<a href="video-detail.html">
					<div class="card" style="width: 18rem;">
						<img class="card-img-top" src="images/film3.png" alt="Card image cap">
						<div class="card-body">
							<b class="card-title">The Punshier</b>
							<p class="card-text card-small">asldjflkajsdlfjlasjdlkfj</p>
						</div>
						<div class="card-footer">
							<small class="text-muted">Last updated 3 mins ago</small>
							<i class="mdi mdi-cart text-primary mx-0 float-right"></i>
						</div>
					</div>
					</a>
			    </li>
			</ul>
		</div>          
	</div>
</div>
 	<script type="text/javascript" src="js/bootstrap.min.js"></script>
</body>
</html>