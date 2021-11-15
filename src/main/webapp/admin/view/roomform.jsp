<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="../common/header.jsp"/>
<body>


<div class="mobile-menu-overlay"></div>

<div class="main-container" style="padding: 0px 300px">
    <div class="pd-ltr-20 xs-pd-20-10">
        <div class="min-height-200px">
            <div class="page-header">
                <div class="row">
                    <div class="col-md-6 col-sm-12">
                        <div class="title">
                            <h4>DataTable</h4>
                        </div>
                        <nav aria-label="breadcrumb" role="navigation">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="index.html">Home</a></li>
                                <li class="breadcrumb-item active" aria-current="page">DataTable</li>
                            </ol>
                        </nav>
                    </div>
                    <div class="col-md-6 col-sm-12 text-right">
                        <div class="dropdown">

                        </div>
                    </div>
                </div>
            </div>
            <!-- Simple Datatable start -->

            <div class="pd-20 card-box mb-30">
                <div class="clearfix">
                    <div class="pull-left">
                        <h4 class="text-blue h4">Form add buidling</h4>
                    </div>
                </div>
                <form action="${pageContext.request.contextPath}/adminPage/room" method="post"
                      enctype="multipart/form-data">

                    <input type="hidden" name="action" value="add">

                    <div class="form-group row">
                        <label class="col-sm-12 col-md-2 col-form-label">ID</label>
                        <div class="col-sm-12 col-md-10">
                            <input name="id" readonly class="form-control" type="text" value="${room.id}">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-12 col-md-2 col-form-label">Name</label>
                        <div class="col-sm-12 col-md-10">
                            <input name="name" class="form-control" type="text" value="${room.name}">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-12 col-md-2 col-form-label">Building</label>
                        <div class="col-md-6">
                            <div class="form-group">
                                <select class="custom-select2 form-control" name="building"
                                        style="width: 100%; height: 38px;">
                                    <optgroup>
                                        <c:forEach var="building" items="${buildings}">
                                            <c:choose>
                                                <c:when test="${room.building.id == building.id}">
                                                    <option value="${building.id}" selected>${building.name}</option>
                                                </c:when>
                                                <c:otherwise>
                                                    <option value="${building.id}">${building.name}</option>
                                                </c:otherwise>
                                            </c:choose>
                                        </c:forEach>

                                    </optgroup>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-12 col-md-2 col-form-label">Room type</label>
                        <div class="col-md-6">
                            <div class="form-group">
                                <select class="custom-select2 form-control" name="roomType"
                                        style="width: 100%; height: 38px;">
                                    <optgroup>
                                        <c:forEach var="roomtype" items="${roomTypes}">
                                            <c:choose>
                                                <c:when test="${room.roomType.id == roomtype.id}">
                                                    <option value="${roomtype.id}" selected>${roomtype.name}</option>
                                                </c:when>
                                                <c:otherwise>
                                                    <option value="${roomtype.id}">${roomtype.name}</option>
                                                </c:otherwise>
                                            </c:choose>
                                        </c:forEach>
                                    </optgroup>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-12 col-md-2 col-form-label">Price</label>
                        <div class="col-sm-12 col-md-10">
                            <input name="price" class="form-control" type="text" value="${room.price}">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-12 col-md-2 col-form-label">Rating</label>
                        <div class="col-sm-12 col-md-10">
                            <input name="rating" class="form-control" type="text" value="${room.rating}">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-12 col-md-2 col-form-label">Bedroom</label>
                        <div class="col-sm-12 col-md-10">
                            <input name="bedCount" class="form-control" type="text" value="${room.bedCount}">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-12 col-md-2 col-form-label">Bathroom</label>
                        <div class="col-sm-12 col-md-10">
                            <input name="bathCount" class="form-control" type="text" value="${room.bathCount}">
                        </div>
                    </div>

                    <div class="form-group row">
                        <label class="col-sm-12 col-md-2 col-form-label">Accomodate</label>
                        <div class="col-sm-12 col-md-10">
                            <input name="accomodatesCount" class="form-control" type="text"
                                   value="${room.accomodatesCount}">
                        </div>
                    </div>

                    <div class="form-group row">
                        <label class="col-sm-12 col-md-2 col-form-label">Area</label>
                        <div class="col-sm-12 col-md-10">
                            <input name="area" class="form-control" type="text" value="${room.area}">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-12 col-md-2 col-form-label">Description</label>
                        <textarea class="form-control" name="description">${room.description}</textarea>
                    </div>

                    <input type="submit" class="btn btn-primary " value="Save">
                </form>
            </div>

            <div class="pd-20 card-box mb-30">
                <div class="form-group row">
                    <div class="row">
                        <c:forEach var="img" items="${room.roomImage}">
                            <div class="col-md-4">
                                <div class="thumbnail">
                                    <img src="${pageContext.request.contextPath}/images/${img.name}" alt=""
                                         style="width:100%">
                                    <div class="caption">
                                        <form action="${pageContext.request.contextPath}/adminPage/roomImage"
                                              method="post">
                                            <input type="hidden" name="action" value="delete">
                                            <input type="hidden" name="idImg" value="${img.id}">
                                            <div class="caption">
                                                <input type="submit" class="btn btn-warning" style="margin: 5px auto" value="Delete">
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
            <div class="pd-20 card-box mb-30">
                <form action="${pageContext.request.contextPath}/adminPage/roomImage" method="post"
                      enctype='multipart/form-data'>
                    <input type="hidden" name="action" value="add">
                    <input type="hidden" name="idRoom" value="${room.id}">
                    <div class="form-group">
                        <label>Image:</label>
                        <input name="img" type="file" accept="image/png, image/jpeg" multiple
                               class="form-control-file form-control height-auto">
                    </div>
                    <c:if test="${room.id != null}" >
                    <input type="submit" class="btn btn-primary " value="Save image">
                    </c:if>
                    <c:if test="${room.id == null}" >
                        <input disabled type="submit" class="btn btn-primary " value="Save image">
                    </c:if>
                </form>
            </div>


        </div>

        <c:import url="../common/footer.jsp"/>
    </div>

</div>
<!-- js -->
<c:import url="../common/library.jsp"/>
</body>
</html>