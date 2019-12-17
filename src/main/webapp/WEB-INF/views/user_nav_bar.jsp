<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="stylesheet" href="vendors/mdi/css/materialdesignicons.min.css">
    <link rel="stylesheet" href="css/style.css">
    <link href="css/font-awesome.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="css/other_style.css"/>
    <script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>

    <link rel="stylesheet" href="vendors/base/vendor.bundle.base.css">

    <link rel="stylesheet" href="vendors/mdi/css/materialdesignicons.min.css">
    <link rel="stylesheet" href="css/style.css">
    <link href="css/font-awesome.css" rel="stylesheet">

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
<!-- side bar -->
<nav class="sidebar sidebar-offcanvas" style="position: fixed;" id="sidebar">
    <ul class="nav">
        <h3 align="center">Movie Types</h3>
        <li class="nav-item">
            <a class="nav-link" methods="post" href="/">
                <span class="menu-title">All</span>
            </a>
        </li>
        <c:forEach items="${genre}" var="genre">
            <li class="nav-item">
                <a class="nav-link" methods="post" href="/genre/${genre.id}">
                    <span class="menu-title">${genre.title}</span>
                </a>
            </li>
        </c:forEach>
    </ul>
</nav>
</body>
</html>