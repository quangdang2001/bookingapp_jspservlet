<%@ page import="java.util.Date" %>
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
            <form action="${pageContext.request.contextPath}/register" method="post">
                <div class="email-verify-container">
                    <div class="email-verify-heading">
                        <h2>Xác nhận địa chỉ email</h2>
                    </div>
                    <div class="email-verify-subheading">
                        <p>
                            Nhập mã xác thực chúng tôi đã gửi đến <strong>email</strong>.
                            Nếu bạn không thấy hãy kiểm tra hộp thư Spam.
                        </p>
                    </div>

                    <input type="hidden" name="action" value="save">
                    <div class="email-verify-input-wrapper">
                        ${message}
                        <input
                                name="code"
                                type="number"
                                maxlength="6"
                                id="email-verify-input"
                                required
                        />
                    </div>
                    <button class="email-verify-btn__verify">Xác nhận</button>
                </div>
            </form>
        </div>

    </div>
</div>

<!-- end add sub -->
</body>
</html>
