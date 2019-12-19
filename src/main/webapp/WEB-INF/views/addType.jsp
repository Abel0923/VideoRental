<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

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
                        <h2 align="center"><i class="fa fa-list-alt"></i> Add Video Type </h2>
                        <hr>
                        <div class="col-md-6 grid-margin stretch-card">
                            <div class="card">
                                <div class="card-body">
                                    <p class="card-description">
                            <form:form class="forms-sample" method="post" action="/admin/admin_add_type"
                                                   modelAttribute="type">
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text">&nbsp;Film Title</span>
                                        </div>
                                        <form:input path="type_title" id="title" type="text" class="form-control"
                                                    required="required"/>
                                    <form:errors path="type_title" cssClass="text-warning" />

                                </div>

                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text">&nbsp;Price</span>
                                        </div>
                                        <form:input path="price" id="price" type="text" class="form-control"
                                                    required="required"/>
                                        <form:errors path="price" cssClass="text-warning" />

                                    </div>

                                    <form:button value="Add Video" type="submit"
                                                 class="btn btn-primary mr-2">
                                        <i class="mdi mdi-video"></i>&nbsp;Add Video Type</form:button>
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
</body>
</html>