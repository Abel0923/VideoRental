<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
                        <h2 align="center"><i class="mdi mdi-video"></i> Add Genre </h2>
                        <hr>
                        <div class="col-md-6 grid-margin stretch-card">
                            <div class="card">
                                <div class="card-body">
                                    <p class="card-description">
                                        <form:form class="forms-sample" method="post" action="/admin/admin_add_genre"
                                                   modelAttribute="genre">
                                    <div class="input-group" align="centre">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text">&nbsp;Film Title</span>
                                        </div>
                                        <form:input path="title" id="title" type="text" class="form-control"
                                                    required="required"/>
                                        <form:errors path="title" cssClass="text-warning"/>
                                    </div>

                                    <form:button value="Add Video" type="submit"
                                                 class="btn btn-primary mr-2">
                                        <i class="fa fa-list-alt"></i>&nbsp;Add Genre</form:button>
                                    <button class="btn btn-light">Cancel</button>
                                    </form:form>
                                    </p>
                                </div>
                                <br>
                                <hr>
                                <h3>List of Genre</h3>
                                <div class="table-responsive">
                                    <table id="recent-purchases-listing" class="table">
                                        <thead>
                                        <tr>
                                            <th>Title</th>
                                            <th>Action</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${listGenre}" var="genre">
                                        <tr>
                                            <td>${genre.title}</td>
                                            <td>
                                                <a href="/admin/admin_remove_genre/${genre.id}">
                                                <button class="btn btn-sm btn-outline-danger">
                                                    <i class="mdi mdi-delete"></i>Delete</button>
                                                    </button>
                                                </a>
                                            </td>
                                        </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
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
        </body>
        </html>