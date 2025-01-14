<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <style type="text/css">
        .menu-film-list {
            margin-top: -24px;
        }

        .custom-select {
            position: relative;
            font-family: Arial;
        }

        .custom-select select {
            display: none; /*hide original SELECT element: */
        }

        .select-selected {
            background-color: DodgerBlue;
        }

        /* Style the arrow inside the select element: */
        .select-selected:after {
            position: absolute;
            content: "";
            top: 14px;
            right: 10px;
            width: 0;
            height: 0;
            border: 6px solid transparent;
            border-color: #fff transparent transparent transparent;
        }

        /* Point the arrow upwards when the select box is open (active): */
        .select-selected.select-arrow-active:after {
            border-color: transparent transparent #fff transparent;
            top: 7px;
        }

        /* style the items (options), including the selected item: */
        .select-items div, .select-selected {
            color: #ffffff;
            padding: 8px 16px;
            border: 1px solid transparent;
            border-color: transparent transparent rgba(0, 0, 0, 0.1) transparent;
            cursor: pointer;
        }

        /* Style items (options): */
        .select-items {
            position: absolute;
            background-color: DodgerBlue;
            top: 100%;
            left: 0;
            right: 0;
            z-index: 99;
        }

        /* Hide the items when the select box is closed: */
        .select-hide {
            display: none;
        }

        .select-items div:hover, .same-as-selected {
            background-color: rgba(0, 0, 0, 0.1);
        }

    </style>

</head>
<body>
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

            <!-- video list -->
            <div class="menu-film-list">
                <div class="card" align="center">
                    <div class="card-body">
                        <h2 align="center"><i class="mdi mdi-video"></i> Add Videos </h2>
                        <hr>
                        <div class="col-md-6 grid-margin stretch-card">
                            <div class="card">
                                <div class="card-body">
                                    <p class="card-description">
                 <form:form class="forms-sample" method="post" action="/admin/add_video"
                                                   enctype="multipart/form-data"
                                                   modelAttribute="video">
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text">&nbsp;Film Title</span>
                                        </div>
                                        <form:input path="title" id="title" type="text" class="form-control"
                                                    required="required"/>
                                        <form:errors path="title" cssClass="text-warning"/>
                                    </div>
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text">&nbsp;Film Image</span>
                                        </div>
                                        <input id="file" name="file" type="file" class="form-control"/>
                                    </div>
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text">&nbsp;Type</span>
                                        </div>
                                        <form:select path="type_id" class="custom-select" cssStyle="width: 75%;"
                                                     id="videoType">
                                            <c:forEach items="${videoType}" var="type">
                                                <form:option value="${type.id}">${type.type_title}</form:option>
                                            </c:forEach>
                                        </form:select>
                                        <form:errors path="type_id" cssClass="text-warning"/>

                                    </div>
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text">Genre</span>
                                        </div>
                                        <form:select path="genre_id" class="custom-select" cssStyle="width: 75%;">
                                            <c:forEach items="${videoGenre}" var="genre">
                                                <form:option value="${genre.id}">${genre.title}</form:option>
                                            </c:forEach>
                                        </form:select>
                                        <form:errors path="genre_id" cssClass="text-warning"/>

                                    </div>
                                    <div class="input-group" id="videoAge" >
                                        <div class="input-group-prepend">
                                            <span class="input-group-text">&nbsp;Max. Age</span>
                                        </div>
                                        <input path="age" id="age" type="text" class="form-control"
                                                    value="18" required="required"/>
                                        <errors path="age" cssClass="text-warning"/>
                                    </div>
                                    <div class="input-group" id="videoYear">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text">&nbsp;Year</span>
                                        </div>
                                        <input path="year" id="year" type="date" class="form-control"
                                                    required="required"/>
                                        <errors path="year" cssClass="text-warning"/>
                                    </div>

                                    <button type="submit"
                                                 class="btn btn-primary mr-2">Add Video</button>
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

        <script src="/vendors/base/vendor.bundle.base.js"></script>
        <script src="/js/off-canvas.js"></script>
        <script src="/js/hoverable-collapse.js"></script>
        <script src="/js/template.js"></script>
        <script>

           $('#videoType').change(function () {
               $('#videoType').val() == 18 ? $('#videoAge').show() : $('#videoAge').hide();
               $('#videoType').val() == 19 ? $('#videoYear').show() : $('#videoYear').hide();

           })
        </script>

</body>
</html>