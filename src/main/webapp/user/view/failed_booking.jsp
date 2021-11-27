<%@ page import="java.util.Date" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
    <link rel="stylesheet" href="<c:url value="/user/styles/root.css" />"/>
    <link rel="stylesheet" href="<c:url value="/user/styles/grid.css" />"/>
    <link rel="stylesheet" href="<c:url value="/user/styles/booking.css" /> "/>
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
                          data-icon="bi:x-circle-fill"
                          style="color: #cd1818"
                          data-width="30"
                          data-height="30"
                  ></span>
                        </div>
                        <h3>Gửi yêu cầu không thành công</h3>
                        <p>
                            Chúng tôi không thể thực hiện giao dịch này.
                            <br />Vui lòng tải lại trang và thử lại.
                        </p>
                    </div>
                </div>

                <div class="booking-success-btn">
                    <span>Trở về trang chủ</span>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- end add sub -->
</body>
</html>

