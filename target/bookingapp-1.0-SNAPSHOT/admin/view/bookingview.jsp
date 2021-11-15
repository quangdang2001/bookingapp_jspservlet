<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="../common/header.jsp"/>
<body>
<c:import url="../common/sidebar.jsp"/>

<div class="mobile-menu-overlay"></div>

<div class="main-container">
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
            <div class="card-box mb-30">
                <div class="pd-20">
                    <h4 class="text-green h4">Booking</h4>
                    <p class="mb-0"> <a class="text-primary" href="${pageContext.request.contextPath}/adminPage/booking?action=showForm" target="_blank">
                        Update booking</a></p>
                </div>

                <div class="pb-20">
                    <table class="data-table table stripe hover nowrap">
                        <thead>
                        <tr>
                            <th class="table-plus datatable-nosort">ID</th>
                            <th>User ID</th>
                            <th>Room</th>
                            <th>Check in</th>
                            <th>Check out</th>
                            <th>Cancel</th>
                            <th>Booking date</th>
                            <th>Payment</th>
                            <th>Status</th>
                            <th class="datatable-nosort">Action</th>
                        </tr>
                        </thead>

                        <tbody>
                        <c:forEach var="booking" items="${bookings}">

                            <tr>
                                <td class="table-plus">${booking.id}</td>
                                <td>${booking.user.id}</td>
                                <td>${booking.room.name}</td>
                                <td>${booking.checkInDate}</td>
                                <td>${booking.checkOutDate}</td>
                                <td>${booking.cancelDate}</td>
                                <td>${booking.bookingDate}</td>
                                <td>${booking.transaction.paymemt.name}</td>
                                <c:if test="${booking.status == true}" >
                                    <td> <input class="form-check-input" type="checkbox" name="status" value="true"  checked readonly></td>
                                </c:if>
                                <c:if test="${booking.status == false}" >
                                    <td> <input class="form-check-input" type="checkbox" name="status" value="false" readonly></td>
                                </c:if>

                                <td>
                                    <div class="dropdown">
                                        <a class="btn btn-link font-24 p-0 line-height-1 no-arrow dropdown-toggle"
                                           href="#" role="button" data-toggle="dropdown">
                                            <i class="dw dw-more"></i>
                                        </a>
                                        <div class="dropdown-menu dropdown-menu-right dropdown-menu-icon-list">
                                            <a class="dropdown-item"
                                               href="${pageContext.request.contextPath}/adminPage/booking?id=${room.id}&action=update"><i
                                                    class="dw dw-edit2"></i> Edit</a>
                                            <a class="dropdown-item"
                                               href="${pageContext.request.contextPath}/adminPage/booking?id=${room.id}&action=delete"><i
                                                    class="dw dw-delete-3"></i> Delete</a>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                        </c:forEach>

                        </tbody>
                    </table>
                </div>
            </div>
        </div>

        <c:import url="../common/footer.jsp"/>
    </div>

</div>

<!-- js -->
<c:import url="../common/library.jsp"/>
</body>
</html>