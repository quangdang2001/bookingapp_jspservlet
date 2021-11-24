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
                                    <a href="${pageContext.request.contextPath}/home/user?action=load" class="nav-tablet__item-link">
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
    <div class="row">
        <div class="col-2"></div>
        <div class="col-8">
          <form action="${pageContext.request.contextPath}/home/user" method="get" >
            <input type="hidden" name="action" value="update">
            <div class="account-container">
                <div class="account-heading">
                    <h2>Thông tin cá nhân</h2>
                </div>
                <div class="account-body">
                    <div class="account-body-items">
                        <div class="account-body-items-left">
                            <label for="account-name">Tên riêng</label>
                            <input
                                    name="fName"
                                    class="account-body-items-input"
                                    id="account-name"
                                    type="text"
                                    value="${sessionScope.user.firstName}"
                                    readonly
                            />
                        </div>
                        <div class="account-body-items-right">
                            <span id="account-name-edit">Chỉnh sửa</span>
                            <span style="display: none" id="account-name-cancel"
                            >Hủy</span
                            >
                        </div>
                    </div>

                    <div class="account-body-items">
                        <div class="account-body-items-left">
                            <label for="account-name">Họ</label>
                            <input
                                    name="lName"
                                    class="account-body-items-input"

                                    type="text"
                                    value="${sessionScope.user.lastName}"
                                    readonly
                            />
                        </div>
                        <div class="account-body-items-right">
                            <span>Chỉnh sửa</span>
                            <span style="display: none"
                            >Hủy</span
                            >
                        </div>
                    </div>

                    <div class="account-body-items">
                        <div class="account-body-items-left">
                            <label for="account-email">Địa chỉ Email</label>
                            <input
                                    class="account-body-items-input"
                                    id="account-email"
                                    type="text"
                                    value="${sessionScope.user.email}"
                                    readonly
                            />
                        </div>

                    </div>

                    <div class="account-body-items">
                        <div class="account-body-items-left">
                            <label for="account-name">Mật khẩu</label>
                            <input
                                    name="password"
                                    class="account-body-items-input"

                                    type="text"
                                    value="${sessionScope.user.password}"
                                    readonly
                            />
                        </div>
                        <div class="account-body-items-right">
                            <span>Chỉnh sửa</span>
                            <span style="display: none"
                            >Hủy</span
                            >
                        </div>
                    </div>

                    <div class="account-body-items">
                        <div class="account-body-items-left">
                            <label for="account-phone">Số điện thoại</label>
                            <input
                                    name="phone"
                                    class="account-body-items-input"
                                    id="account-phone"
                                    type="text"
                                    value="${sessionScope.user.phone}"
                                    readonly
                            />
                        </div>
                        <div class="account-body-items-right">
                            <span id="account-phone-edit">Chỉnh sửa</span>
                            <span style="display: none" id="account-phone-cancel"
                            >Hủy</span
                            >
                        </div>
                    </div>
                    <div class="account-body-items">
                        <div class="account-body-items-left">
                            <label for="account-addr">Địa chỉ</label>
                            <input
                                    name="address"
                                    class="account-body-items-input"
                                    id="account-addr"
                                    type="text"
                                    value="${sessionScope.user.address}"
                                    readonly
                            />
                        </div>
                        <div class="account-body-items-right">
                            <span id="account-addr-edit">Chỉnh sửa</span>
                            <span style="display: none" id="account-addr-cancel"
                            >Hủy</span
                            >
                        </div>
                    </div>
                </div>
                <button class="account-btn">Lưu</button>
            </div>
          </form>
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
<script>
    // name
    $("#account-name-edit").click(function (e) {
        document.getElementById("account-name-edit").style.display = "none";
        document.getElementById("account-name-cancel").style.display = "block";
        document.getElementById("account-name").readOnly = false;
        document.getElementById("account-name").focus();
    });
    $("#account-name-cancel").click(function (e) {
        document.getElementById("account-name-edit").style.display = "block";
        document.getElementById("account-name-cancel").style.display = "none";
        document.getElementById("account-name").readOnly = true;
    });
    //   end

    $("#account-birthday-edit").click(function (e) {
        document.getElementById("account-birthday-edit").style.display = "none";
        document.getElementById("account-birthday-cancel").style.display =
            "block";
        document.getElementById("account-birthday").readOnly = false;
        document.getElementById("account-birthday").focus();
    });
    $("#account-birthday-cancel").click(function (e) {
        document.getElementById("account-birthday-edit").style.display =
            "block";
        document.getElementById("account-birthday-cancel").style.display =
            "none";
        document.getElementById("account-birthday").readOnly = true;
    });
    //   end

    $("#account-phone-edit").click(function (e) {
        document.getElementById("account-phone-edit").style.display = "none";
        document.getElementById("account-phone-cancel").style.display = "block";
        document.getElementById("account-phone").readOnly = false;
        document.getElementById("account-phone").focus();
    });
    $("#account-phone-cancel").click(function (e) {
        document.getElementById("account-phone-edit").style.display = "block";
        document.getElementById("account-phone-cancel").style.display = "none";
        document.getElementById("account-phone").readOnly = true;
    });
    //   end

    $("#account-email-edit").click(function (e) {
        document.getElementById("account-email-edit").style.display = "none";
        document.getElementById("account-email-cancel").style.display = "block";
        document.getElementById("account-email").readOnly = false;
        document.getElementById("account-email").focus();
    });
    $("#account-email-cancel").click(function (e) {
        document.getElementById("account-email-edit").style.display = "block";
        document.getElementById("account-email-cancel").style.display = "none";
        document.getElementById("account-addr").readOnly = true;
    });
    //   end

    $("#account-addr-edit").click(function (e) {
        document.getElementById("account-addr-edit").style.display = "none";
        document.getElementById("account-addr-cancel").style.display = "block";
        document.getElementById("account-addr").readOnly = false;
        document.getElementById("account-addr").focus();
    });
    $("#account-addr-cancel").click(function (e) {
        document.getElementById("account-addr-edit").style.display = "block";
        document.getElementById("account-addr-cancel").style.display = "none";
        document.getElementById("account-addr").readOnly = true;
    });
    //   end
</script>
<!-- end add sub -->
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
</body>
</html>
