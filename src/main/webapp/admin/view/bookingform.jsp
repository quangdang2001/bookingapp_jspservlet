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
                        <h4 class="text-blue h4">Form update booking</h4>
                    </div>
                </div>
                <form action="${pageContext.request.contextPath}/adminPage/booking" method="get">
                    <input type="hidden" name="action" value="save">

                    <div class="form-group row">
                        <label class="col-sm-12 col-md-2 col-form-label">ID</label>
                        <div class="col-sm-12 col-md-10">
                            <input name="id" readonly class="form-control" type="text" value="${booking.id}">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-12 col-md-2 col-form-label">User</label>
                        <div class="col-sm-12 col-md-10">
                            <input name="idUser" readonly  class="form-control" type="text" value="${booking.user.id}">
                        </div>
                    </div>

                    <div class="form-group row">
                        <label class="col-sm-12 col-md-2 col-form-label">Room</label>
                        <div class="col-sm-12 col-md-10">
                            <input name="nameRoom" readonly  class="form-control" type="text" value="${booking.room.name}">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-12 col-md-2 col-form-label">Price for stay</label>
                        <div class="col-sm-12 col-md-10">
                            <input name="priceForStay" readonly  class="form-control" type="text" value="${booking.priceForStay}">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-12 col-md-2 col-form-label">Check in</label>
                        <div class="col-sm-12 col-md-10">
                            <input name="checkInDate" readonly  class="form-control" type="text" value="${booking.checkInDate}">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-12 col-md-2 col-form-label">Check out</label>
                        <div class="col-sm-12 col-md-10">
                            <input name="checkOutDate" readonly  class="form-control" type="text" value="${booking.checkOutDate}">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-12 col-md-2 col-form-label">Cancel date</label>
                        <div class="col-sm-12 col-md-10">
                            <input name="cancelDate" class="form-control date-picker"
                                   placeholder="Select Date" type="text" value="${booking.cancelDate}">
                        </div>
                    </div>

                    <div class="form-group row">
                        <label class="col-sm-12 col-md-2 col-form-label">Booking date</label>
                        <div class="col-sm-12 col-md-10">
                            <input name="bookingDate" readonly  class="form-control" type="text"
                                   value="${booking.bookingDate}">
                        </div>
                    </div>

                    <div class="form-group row">
                        <label class="col-sm-12 col-md-2 col-form-label">Payment</label>
                        <div class="col-sm-12 col-md-10">
                            <input name="paymentName" readonly  class="form-control" type="text" value="${booking.transaction.paymemt.name}">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-12 col-md-2 col-form-label">Status</label>
                        <c:choose>
                            <c:when test="${booking.status == true}">
                                <div class="custom-control custom-checkbox mb-5" style="padding-left: 50px">
                                    <input  name="status" value="false" type="checkbox" class="custom-control-input"
                                            id="customCheck2"  checked>
                                    <label class="custom-control-label" for="customCheck2" >Tick if paid</label>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <div class="custom-control custom-checkbox mb-5" style="padding-left: 50px">
                                    <input  name="status" value="false" type="checkbox" class="custom-control-input"
                                            id="customCheck1">
                                    <label class="custom-control-label" for="customCheck1" >Tick if paid</label>
                                </div>
                            </c:otherwise>
                        </c:choose>
                    </div>

                    <input type="submit" class="btn btn-primary " value="Save">
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