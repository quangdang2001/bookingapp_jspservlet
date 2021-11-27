<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Travel Booking</title>
    <link
            href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap"
            rel="stylesheet"
    />
    <script src="https://code.iconify.design/2/2.0.4/iconify.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <!-- CSS -->
    <link rel="icon" type="image/png" href="<c:url value="/user/images/favicon-16x16.png" />" sizes="16x16">
    <link rel="icon" type="image/png" href="<c:url value="/user/images/favicon-32x32.png" />" sizes="32x32">
    <link rel="stylesheet" href="<c:url value="/user/styles/root.css" />"/>
    <link rel="stylesheet" href="<c:url value="/user/styles/grid.css" />"/>
    <link rel="stylesheet" href="<c:url value="/user/styles/account.css" /> "/>
    <link
            rel="stylesheet"
            href="https://cdn.jsdelivr.net/npm/litepicker/dist/css/litepicker.css"
    />
    <script src="https://cdn.jsdelivr.net/npm/litepicker/dist/litepicker.js"></script>
</head>
<body>
<!-- top nav -->
<div class="top-nav">
    <div class="container-main">
        <div class="nav">
            <div class="nav-content">
                <a href="${pageContext.request.contextPath}/home" class="logo">Travel Booking</a>
                <div class="header__nav-list">
                    <div id="header__nav-item-user" class="header__nav-item-user">
                        <div href="" class="header__nav-item-link">
                  <span
                          class="iconify header__nav-item-icon-bars"
                          data-icon="bx:bx-menu"
                  ></span>
                            <span
                                    class="iconify header__nav-item-icon-user"
                                    data-icon="bx:bxs-user"
                            ></span>
                        </div>
                    </div>

                    <div class="nav-tablet">
                        <ul class="nav-tablet__list">
                            <c:if test="${sessionScope.user == null}">
                                <li class="nav-tablet__item js-sign">
                                    <a href="${pageContext.request.contextPath}/user/view/login.jsp"
                                       class="nav-tablet__item-link" style="display: block">Đăng nhập</a>
                                </li>
                                <li class="nav-tablet__item js-sign">
                                    <a href="${pageContext.request.contextPath}/user/view/login.jsp"
                                       class="nav-tablet__item-link" style="display: block">Đăng ký</a>
                                </li>
                            </c:if>
                            <c:if test="${sessionScope.user != null}">
                                <li class="nav-tablet__item js-sign">
                                    <a
                                            style="display: block"
                                            class="nav-tablet__item-link">Xin chào ${sessionScope.user.firstName}</a>
                                </li>
                                <li class="nav-tablet__item">
                                    <a href="${pageContext.request.contextPath}/home/user?action=load"
                                       class="nav-tablet__item-link">
                                        Cài đặt tài khoản
                                    </a>
                                </li>
                                <li class="nav-tablet__item js-sign">
                                    <a href="${pageContext.request.contextPath}/home/history"
                                       style="display: block"
                                       class="nav-tablet__item-link">Nhật ký</a>
                                </li>
                                <li class="nav-tablet__item js-sign">
                                    <a href="${pageContext.request.contextPath}/login?action=logout"
                                       style="display: block"
                                       class="nav-tablet__item-link">Đăng xuất</a>
                                </li>
                            </c:if>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- end top nav -->
<div class="container-main">
    <div class="row trip-container">
        <div class="col-12 trip-heading">Nhật kí chuyến đi</div>
        <c:forEach var="booking" items="${bookings}">
            <div class="col-4">
                <a href="${pageContext.request.contextPath}/home/room-detail?idRoom=${booking.room.id}">
                    <div class="trip-wrapper">
                        <div class="trip-wrapper-heading">
                            <div
                                    style="background-image: url(<c:url
                                            value="/images/${booking.room.roomImage[0].name}"/>)"
                                    class="trip-heading__image"
                            ></div>
                        </div>
                        <div class="trip-body">
                            <div id="trip-body-heading" class="trip-body-heading">
                                    ${booking.room.name} - Trạng thái: <c:if
                                    test="${booking.transaction.status==true}">đã thanh toán</c:if>
                                <c:if test="${booking.transaction.status==false}">chưa thanh toán</c:if>
                            </div>
                            <div id="trip-body-room" class="trip-body-items">
                                    ${booking.room.building.address} - ${booking.room.building.city.name}
                            </div>
                            <div id="trip-body-date" class="trip-body-items">
                                    ${booking.checkInDate} <b>To</b> ${booking.checkOutDate}
                            </div>
                            <div id="trip-body-guest" class="trip-body-items">${booking.quantityPeople} Khách</div>
                            <div class="trip-body-items">Ngày đặt phòng: ${booking.bookingDate}</div>
                        </div>
                    </div>
                </a>

            </div>
        </c:forEach>
    </div>
</div>

<div class="footer">
    <div class="container-main">
        <div class="footer-end">
            <div class="footer-copyright">
                <ul class="footer__end-copyright-list">
                    <li class="footer__end-copyright__item">
                        <i class="fas fa-copyright"></i>
                        <a href="" class="footer__end-copyright__item-link"
                        >2021 Travel Booking, Inc</a
                        >
                    </li>
                    <li class="footer__end-copyright__item">
                        <a href="" class="footer__end-copyright__item-link"
                        >Quyền riêng tư</a
                        >
                    </li>
                    <li class="footer__end-copyright__item">
                        <a href="" class="footer__end-copyright__item-link"
                        >Điều khoản</a
                        >
                    </li>
                </ul>
            </div>
            <div class="footer__end-social">
                <ul class="footer__end-social-list">
                    <li class="footer__end-social-item">
                        <i class="fas fa-globe"></i>
                        <span href="" class="footer__end-social-item-link">
                  Tiếng Việt (VN)
                </span>
                    </li>
                    <li class="footer__end-social-item">
                        <i class="fas fa-dollar-sign"></i>
                        <span href="" class="footer__end-social-item-link"> USD </span>
                    </li>
                    <li class="footer__end-social-item">
                        <a href="" class="footer__end-social-item-link">
                  <span
                          class="iconify"
                          data-icon="brandico:facebook-rect"
                  ></span>
                        </a>
                    </li>
                    <li class="footer__end-social-item">
                        <a href="" class="footer__end-social-item-link">
                  <span
                          class="iconify"
                          data-icon="akar-icons:twitter-fill"
                  ></span>
                        </a>
                    </li>
                    <li class="footer__end-social-item">
                        <a href="" class="footer__end-social-item-link">
                  <span
                          class="iconify"
                          data-icon="ant-design:instagram-filled"
                  ></span>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>
<script>
    $("html").click(function () {
        $(".nav-tablet").removeClass("active");
    });
    $("#header__nav-item-user").click(function (e) {
        e.stopPropagation();
    });
    $("#header__nav-item-user").click(function (e) {
        $(".nav-tablet").addClass("active");
    });
</script>
<!-- end add sub -->
</body>
</html>
