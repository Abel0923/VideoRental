<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="stylesheet" href="/vendors/mdi/css/materialdesignicons.min.css">
    <link rel="stylesheet" href="/css/style.css">
    <link href="/css/font-awesome.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="/css/other_style.css"/>
    <script type="text/javascript" src="/js/jquery-2.1.4.min.js"></script>

    <link rel="stylesheet" href="/vendors/base/vendor.bundle.base.css">

    <link rel="stylesheet" href="/vendors/mdi/css/materialdesignicons.min.css">
    <link rel="stylesheet" href="/css/style.css">
    <link href="/css/font-awesome.css" rel="stylesheet">

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
        <li class="nav-item">
            <a class="nav-link" methods="post" href="/user/">
                <span class="menu-title">All</span>
            </a>
        </li>
        <h5 align="center"><u>Movie Category / Type</u></h5>
        <c:forEach items="${type}" var="type">
            <li class="nav-item">
                <a class="nav-link" methods="post" href="/user/type/${type.id}">
                    <span class="menu-title">${type.type_title}</span>
                </a>
            </li>
        </c:forEach>
        <h5 align="center"><u>Movie Genre</u></h5>
        <c:forEach items="${genre}" var="genre">
            <li class="nav-item">
                <a class="nav-link" methods="post" href="/user/genre/${genre.id}">
                    <span class="menu-title">${genre.title}</span>
                </a>
            </li>
        </c:forEach>
    </ul>
</nav>
</body>
</html>