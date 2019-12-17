<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
        .menu-film-list {
            margin-top: -24px;
        }

    </style>

</head>
<body>
<div>
    <%@ include file="admin_header.jsp"%>
</div>

<div class="container-fluid page-body-wrapper">

    <!-- side bar -->
    <div>
        <%@ include file="admin_nav_bar.jsp"%>
    </div>

    <!-- partial -->
    <div class="main-panel">
        <div class="content-wrapper">

            <!-- video list -->
            <div class="menu-film-list">
                <div class="card" align="center">
                    <div class="card-body">
                        <h2 align="center"><i class="mdi mdi-video"></i> Add Genre </h2>
                        <hr>
                        <div class="col-md-6 grid-margin stretch-card">
                            <div class="card">
                                <div class="card-body">
                                    <p class="card-description">
                                        <form:form class="forms-sample" method="post" action="/admin_add_genre"
                                                   modelAttribute="genre">
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text">&nbsp;Film Title</span>
                                        </div>
                                        <form:input path="title" id="title" type="text" class="form-control"
                                                    required="required"/>
                                    <form:errors path="title" cssClass="text-warning" />

                                </div>

                                    <form:button value="Add Video" type="submit"
                                                 class="btn btn-primary mr-2">
                                        <i class="fa fa-list-alt"></i>&nbsp;Add Genre</form:button>
                                    <button class="btn btn-light">Cancel</button>
                                    </form:form>
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