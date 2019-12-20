<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<div>
    <%@ include file="user_header.jsp"%>
</div>

<div class="container-fluid page-body-wrapper">

    <div>
        <%@ include file="user_nav_bar.jsp"%>
    </div>

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
                        <img class="d-block w-100" src="/images/img1.jpg" alt="First slide">
                    </div>
                    <div class="carousel-item">
                        <img class="d-block w-100" src="/images/img2.jpg" alt="Second slide">
                    </div>
                    <div class="carousel-item">
                        <img class="d-block w-100" src="/images/img3.jpg" alt="Third slide">
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
            <br>

            <!-- video list -->
            <div class="menu-film-list">
                <ul style="list-style: none;">
                    <c:if test="${not empty videos}">
                        <c:forEach items="${videos}" var="video">
                            <li style="float: left;">

                                    <div class="card" style="width: 12rem;">
                                        <c:if test="${not empty video.image_uri}">
                                            <td><img src="/uploads/${video.image_uri}" alt="${video.videoTitle}" style=" height: 14rem; width: 12rem"></td>
                                        </c:if>
                                        <c:if test="${empty video.image_uri}">
                                            <td><img src="/images/Spider.jpg" alt="${video.videoTitle}" style=" height: 14rem; width: 12rem"></td>
                                        </c:if>

                                        <div class="card-body">
                                            <b >${video.videoTitle}</b>
                                            <p class="card-text card-small">
                                                <small>
                                                Description : <br>
                                                    &nbsp;&nbsp;
                                                    Category : ${video.videoType.type_title}<br>&nbsp;&nbsp;
                                                    Genre : ${video.videoGenre.title}<br>&nbsp;&nbsp;

                                                    <c:if test="${video.age >0}">
                                                        Max. Age : ${video.age}<br>&nbsp;&nbsp;
                                                    </c:if>
                                                    <c:if test="${video.year>0}">
                                                        Year : ${video.year}<br>&nbsp;&nbsp;
                                                    </c:if>
                                                Price : ${video.price}<br>
                                                Days : <i class="mdi mdi-minus-circle sub" id="sub"></i>
                                                <input type="number" id="days" value="${onOfDays}" min="1" max="3" class="noOfDays" disabled/>
                                                <i class="mdi mdi-plus-circle add" id="add"></i>

                                                </small>

                                            </p>
                                        </div>
                                        <div class="card-footer">
                                            <small class="text-muted">uploaded date : ${video.created_at}</small>
                                            <a onclick="location.href=this.href+'/user/cart/${video.videoId}/'+onOfDays.val()">
                                                <i class="mdi mdi-cart text-primary mx-0 float-right addToCart"></i>
                                            </a>
                                        </div>
                                    </div>

                            </li>
                        </c:forEach>
                    </c:if>
                    <c:if test="${empty videos}">
                        <br>
                        <h1 align="center"><i class="mdi mdi-flask-empty"></i>&nbsp;Empty List For now!</h1>
                    </c:if>
</ul>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript" src="/js/bootstrap.min.js"></script>
<script>
    var onOfDays;

    $(document).ready(function () {
        if ($('.noOfDays').val().empty() || $('.noOfDays').val().isEmpty || $('.noOfDays').val().eq(0)) {
            onOfDays=$(this).prev().val(+ 1)
        }
    });

    $('.addToCart').click(function () {
        if ($('.noOfDays').val().isEmpty) {
            onOfDays = $(this).prev().val(+$(this).prev().val() + 1);
        }
    });
    $('.add').click(function () {
        if ($(this).prev().val() < 3) {
            onOfDays = $(this).prev().val(+$(this).prev().val() + 1);
        }
    });
    $('.sub').click(function () {
        if ($(this).next().val() > 1) {
            if ($(this).next().val() > 1) onOfDays = $(this).next().val(+$(this).next().val() - 1);
        }
    });
</script>
</body>
</html>