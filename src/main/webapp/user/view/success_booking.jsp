<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Travel Booking</title>
    <link
            href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap"
            rel="stylesheet"
    />
    <script src="https://code.iconify.design/2/2.0.4/iconify.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <!-- CSS -->

    <link rel="stylesheet" href="<c:url value="/user/styles/root.css" />" />
    <link rel="stylesheet" href="<c:url value="/user/styles/grid.css" />" />
    <link rel="stylesheet" href="<c:url value="/user/styles/booking.css" /> " />
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
            </div>
        </div>
    </div>
</div>
<!-- end top nav -->
<div class="container-main">
    <div class="row">
        <div class="col-2"></div>
        <div class="col-8">
            <div class="booking-success-container">
                <div class="box-popup">
                    <div class="booking-success-heading">
                        <div class="booking-success-heading__icons">
                  <span
                          class="iconify"
                          data-icon="bi:check-circle-fill"
                          style="color: #8bc34a"
                          data-width="30"
                          data-height="30"
                  ></span>
                        </div>
                        <h3>Gửi yêu cầu thành công</h3>
                        <p>
                            Đây chưa phải là xác nhận đặt phòng. Bạn sẽ được gửi đơn xác
                            nhận sau khi đặt cọc thành công. Email sẽ được gửi trong vòng
                            24h.
                        </p>
                    </div>
                    <div class="booking-success-body">
                        <div class="booking-success-body-heading">
                            ${room.name} <br> ${room.building.name} <br> Địa chỉ: ${room.building.address}
                        </div>
                        <div class="booking-success-body-room-quantity">
                            ${room.bedCount} phòng ngủ · ${room.bathCount} phòng tắm
                        </div>
                        <div class="booking-success-body-date">
                            <div class="booking-success-body-date-checkin">
                                <span>Nhận phòng</span>
                                <h4>${checkInDate}</h4>
                            </div>
                            <div class="booking-success-body-date-checkout">
                                <span>Trả phòng</span>
                                <h4>${checkOutDate}</h4>
                            </div>
                        </div>
                        <div class="booking-success-body-guess">
                            <span>Số lượng khách</span>
                            <h4>${quantityPeople}</h4>
                        </div>
                        <div class="booking-success-body-footer">
                            Vui lòng kiểm tra Email của bạn để tiếp tục đặt cọc. Đơn xác
                            nhận sẽ mất hiệu lực sau thời gian trong vòng 48h. Bạn sẽ
                            không tốn phí khi chưa thanh toán.
                        </div>
                    </div>
                </div>
                <a href="${pageContext.request.contextPath}/home/history" >
                <div class="booking-success-btn">
                    <span>Đến nhật kí</span>
                </div>
                </a>
            </div>
        </div>
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
<!-- end add sub -->
</body>
</html>
