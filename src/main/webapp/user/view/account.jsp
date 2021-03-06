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
                                       class="nav-tablet__item-link" style="display: block">????ng nh???p</a>
                                </li>
                                <li class="nav-tablet__item js-sign">
                                    <a href="${pageContext.request.contextPath}/user/view/login.jsp"
                                       class="nav-tablet__item-link" style="display: block">????ng k??</a>
                                </li>
                            </c:if>
                            <c:if test="${sessionScope.user != null}">
                                <li class="nav-tablet__item js-sign">
                                    <a
                                            style="display: block"
                                            class="nav-tablet__item-link">Xin ch??o ${sessionScope.user.firstName}</a>
                                </li>
                                <li class="nav-tablet__item">
                                    <a href="${pageContext.request.contextPath}/home/user?action=load" class="nav-tablet__item-link">
                                        C??i ?????t t??i kho???n
                                    </a>
                                </li>
                                <li class="nav-tablet__item js-sign">
                                    <a href="${pageContext.request.contextPath}/home/history"
                                       style="display: block"
                                       class="nav-tablet__item-link">Nh???t k??</a>
                                </li>
                                <li class="nav-tablet__item js-sign">
                                    <a href="${pageContext.request.contextPath}/login?action=logout"
                                       style="display: block"
                                       class="nav-tablet__item-link">????ng xu???t</a>
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
                    <h2>Th??ng tin c?? nh??n</h2>
                </div>
                <div class="account-body">
                    <div class="account-body-items">
                        <div class="account-body-items-left">
                            <label for="account-fname">T??n ri??ng</label>
                            <input
                                    name="fName"
                                    class="account-body-items-input"
                                    id="account-fname"
                                    type="text"
                                    value="${sessionScope.user.firstName}"
                                    readonly
                            />
                        </div>
                        <div class="account-body-items-right">
                            <span id="account-fname-edit">Ch???nh s???a</span>
                            <span style="display: none" id="account-fname-cancel"
                            >H???y</span
                            >
                        </div>
                    </div>

                    <div class="account-body-items">
                        <div class="account-body-items-left">
                            <label for="account-lname">H???</label>
                            <input
                                    name="lName"
                                    id="account-lname"
                                    class="account-body-items-input"
                                    type="text"
                                    value="${sessionScope.user.lastName}"
                                    readonly
                            />
                        </div>
                        <div class="account-body-items-right">
                            <span id="account-lname-edit">Ch???nh s???a</span>
                            <span style="display: none" id="account-lname-cancel"
                            >H???y</span
                            >
                        </div>
                    </div>

                    <div class="account-body-items">
                        <div class="account-body-items-left">
                            <label for="account-email">?????a ch??? Email</label>
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
                            <label for="account-password">M???t kh???u</label>
                            <input
                                    name="password"
                                    id="account-password"
                                    class="account-body-items-input"
                                    type="password"
                                    value="${sessionScope.user.password}"
                                    readonly
                            />
                        </div>
                        <div class="account-body-items-right">
                            <span id="account-password-edit">Ch???nh s???a</span>
                            <span style="display: none" id="account-password-cancel"
                            >H???y</span
                            >
                        </div>
                    </div>

                    <div class="account-body-items">
                        <div class="account-body-items-left">
                            <label for="account-phone">S??? ??i???n tho???i</label>
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
                            <span id="account-phone-edit">Ch???nh s???a</span>
                            <span style="display: none" id="account-phone-cancel"
                            >H???y</span
                            >
                        </div>
                    </div>
                    <div class="account-body-items">
                        <div class="account-body-items-left">
                            <label for="account-addr">?????a ch???</label>
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
                            <span id="account-addr-edit">Ch???nh s???a</span>
                            <span style="display: none" id="account-addr-cancel"
                            >H???y</span
                            >
                        </div>
                    </div>
                </div>
                <button class="account-btn">L??u</button>
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
<script>
    // name
    $("#account-fname-edit").click(function (e) {
        document.getElementById("account-fname-edit").style.display = "none";
        document.getElementById("account-fname-cancel").style.display = "block";
        document.getElementById("account-fname").readOnly = false;
        document.getElementById("account-fname").focus();
    });
    $("#account-fname-cancel").click(function (e) {
        document.getElementById("account-fname-edit").style.display = "block";
        document.getElementById("account-fname-cancel").style.display = "none";
        document.getElementById("account-fname").readOnly = true;

    });
    //   end
    $("#account-lname-edit").click(function (e) {
        document.getElementById("account-lname-edit").style.display = "none";
        document.getElementById("account-lname-cancel").style.display = "block";
        document.getElementById("account-lname").readOnly = false;
        document.getElementById("account-lname").focus();
    });
    $("#account-lname-cancel").click(function (e) {
        document.getElementById("account-lname-edit").style.display = "block";
        document.getElementById("account-lname-cancel").style.display = "none";
        document.getElementById("account-lname").readOnly = true;
    });
    //   end

    $("#account-password-edit").click(function (e) {
        document.getElementById("account-password-edit").style.display = "none";
        document.getElementById("account-password-cancel").style.display =
            "block";
        document.getElementById("account-password").readOnly = false;
        document.getElementById("account-password").focus();
    });
    $("#account-password-cancel").click(function (e) {
        document.getElementById("account-password-edit").style.display =
            "block";
        document.getElementById("account-password-cancel").style.display =
            "none";
        document.getElementById("account-password").readOnly = true;
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
