<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Majestic Admin</title>
    <!-- plugins:css -->
    <link rel="stylesheet" href="/vendors/mdi/css/materialdesignicons.min.css">
    <link rel="stylesheet" href="/vendors/base/vendor.bundle.base.css">
    <!-- endinject -->
    <!-- plugin css for this page -->
    <!-- End plugin css for this page -->
    <!-- inject:css -->
    <link rel="stylesheet" href="/css/style.css">
    <link rel="stylesheet" type="text/css" href="/css/other_style.css">
    <link href="/css/font-awesome.css" rel="stylesheet">
    <!-- endinject -->
    <link rel="shortcut icon" href="/images/favicon.png"/>
</head>

<body>
<div class="container-scroller">
    <div class="container-fluid page-body-wrapper full-page-wrapper">
        <div class="content-wrapper d-flex align-items-center auth px-0">

            <div class="row w-100 mx-0">
                <div class="col-lg-4 mx-auto">
                    <c:if test="${param.error != null}">
                        <div class="alert alert-warning" role="alert">
                            Username and password is not correct!<br>
                            Try Again!
                        </div>
                    </c:if>
                    <div class="auth-form-light text-left py-5 px-4 px-sm-5">
                        <h4>Log-In</h4>
                        <h6 class="font-weight-light">Video Rental Admin.</h6>

                        <c:url var="loginUrl" value="/login"/>
                        <form:form action="${loginUrl}" method="post" class="pt-3">
                            <div class="form-group">
                                <input type="text" class="form-control form-control-lg"
                                       id="username" name="username" placeholder="Username"
                                       required="required"/>
                            </div>
                            <div class="form-group">
                                <input type="password" class="form-control form-control-lg"
                                       id="password" name="password" placeholder="Password"
                                       required="required"/>
                            </div>

                            <button type="submit" class="btn btn-lg float-right hvr-icon-forward"> Sign In
                            </button>
                        </form:form>

                    </div>
                </div>
            </div>

            <div class="row w-100 mx-0">
                <a href="/googlesignin">
                    <img src="/images/google-sign-in.png">

                </a>
            </div>
        </div>
    </div>
</div>
</body>

</html>
