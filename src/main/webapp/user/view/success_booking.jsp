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
    <link rel="icon" type="image/png" href="<c:url value="/user/images/favicon-16x16.png" />" sizes="16x16">
    <link rel="icon" type="image/png" href="<c:url value="/user/images/favicon-32x32.png" />" sizes="32x32">
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
                        <h3>G???i y??u c???u th??nh c??ng</h3>
                        <p>
                            ????y ch??a ph???i l?? x??c nh???n ?????t ph??ng. B???n s??? ???????c g???i ????n x??c
                            nh???n sau khi ?????t c???c th??nh c??ng. Email s??? ???????c g???i trong v??ng
                            24h.
                        </p>
                    </div>
                    <div class="booking-success-body">
                        <div class="booking-success-body-heading">
                            ${room.name} <br> ${room.building.name} <br> ?????a ch???: ${room.building.address}
                        </div>
                        <div class="booking-success-body-room-quantity">
                            ${room.bedCount} ph??ng ng??? ?? ${room.bathCount} ph??ng t???m
                        </div>
                        <div class="booking-success-body-date">
                            <div class="booking-success-body-date-checkin">
                                <span>Nh???n ph??ng</span>
                                <h4>${checkInDate}</h4>
                            </div>
                            <div class="booking-success-body-date-checkout">
                                <span>Tr??? ph??ng</span>
                                <h4>${checkOutDate}</h4>
                            </div>
                        </div>
                        <div class="booking-success-body-guess">
                            <span>S??? l?????ng kh??ch</span>
                            <h4>${quantityPeople}</h4>
                        </div>
                        <div class="booking-success-body-footer">
                            Vui l??ng ki???m tra Email c???a b???n ????? ti???p t???c ?????t c???c. ????n x??c
                            nh???n s??? m???t hi???u l???c sau th???i gian trong v??ng 48h. B???n s???
                            kh??ng t???n ph?? khi ch??a thanh to??n.
                        </div>
                    </div>
                </div>
                <a href="${pageContext.request.contextPath}/home/history" >
                <div class="booking-success-btn">
                    <span>?????n nh???t k??</span>
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
                        >Quy???n ri??ng t??</a
                        >
                    </li>
                    <li class="footer__end-copyright__item">
                        <a href="" class="footer__end-copyright__item-link"
                        >??i???u kho???n</a
                        >
                    </li>
                </ul>
            </div>
            <div class="footer__end-social">
                <ul class="footer__end-social-list">
                    <li class="footer__end-social-item">
                        <i class="fas fa-globe"></i>
                        <span href="" class="footer__end-social-item-link">
                  Ti???ng Vi???t (VN)
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
