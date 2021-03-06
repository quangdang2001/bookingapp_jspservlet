<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Travel Booking</title>
    <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css"
            integrity="sha512-NhSC1YmyruXifcj/KFRWoC561YpHpc5Jtzgvbuzx5VozKpWvQ+4nXhPdFgmx8xqexRcpAglTj9sIBWINXa8x5w=="
            crossorigin="anonymous"
            referrerpolicy="no-referrer"
    />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <link
            rel="stylesheet"
            href="https://cdn.jsdelivr.net/npm/litepicker/dist/css/litepicker.css"
    />
    <script src="https://cdn.jsdelivr.net/npm/litepicker/dist/litepicker.js"></script>
    <script src="https://code.iconify.design/2/2.0.3/iconify.min.js"></script>
    <link rel="icon" type="image/png" href="<c:url value="/user/images/favicon-16x16.png" />" sizes="16x16">
    <link rel="icon" type="image/png" href="<c:url value="/user/images/favicon-32x32.png" />" sizes="32x32">
    <link rel="stylesheet" href="<c:url value="/user/styles/index.css" />"/>
    <link rel="stylesheet" href="<c:url value="/user/styles/index_base.css" />"/>
    <link rel="stylesheet" href="<c:url value="/user/styles/reponsive.css" />"/>

    <link
            href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap"
            rel="stylesheet"
    />
    <style>
        .atag {
            text-decoration: none;
            color: black;
        }
    </style>
</head>
<body>
<div class="app">
    <div class="background" style="background-image: url(
    <c:url value="/user/images/background.jpg"/> )">
        <header class="header">
            <div class="grid wide">
                <div class="header__nav">
                    <div class="logo">Travel Booking</div>
                    <ul class="header__nav-list hold-on-mobile-tablet">
                        <li class="header__nav-item header__nav-item--acticve">
                            <a href="" class="header__nav-item-link">N??i ???</a>
                        </li>

                        <li class="header__nav-item">
                            <a href="" class="header__nav-item-link"
                            >Tr???i nghi???m tr???c tuy???n(d??? ??n)</a
                            >
                        </li>
                    </ul>
                    <ul id="header__nav-item-user" class="header__nav-list header__nav-list--hover">
                        <li class="header__nav-item header__nav-item-user">
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
                                                    class="nav-tablet__item-link">Xin
                                                ch??o ${sessionScope.user.firstName}</a>
                                        </li>
                                        <li class="nav-tablet__item">
                                            <a href="${pageContext.request.contextPath}/home/user?action=load"
                                               class="nav-tablet__item-link">
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
                            <div href="" class="header__nav-item-link">

                      <span
                              class="iconify header__nav-item-icon-bars"
                              data-icon="bx:bx-menu"
                              data-height="25"
                              data-weight="25"
                      ></span>
                                <span
                                        class="iconify header__nav-item-icon-user"
                                        data-icon="bx:bxs-user"
                                        data-height="25"
                                        data-weight="25"
                                ></span>

                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </header>
        <div class="grid wide">
            <form action="${pageContext.request.contextPath}/home/rooms" method="get">
                <input type="hidden" name="action" value="search">
                <div class="search">
                    <ul class="search__list">
                        <li class="search__item">
                            <div id="search_location" class="search__item-link">
                                <h3 class="search__item-heading">?????a ??i???m</h3>
                                <input
                                        required
                                        name="destination"
                                        type="text"
                                        class="search__item-input"
                                        placeholder="B???n s???p ??i ????u"
                                        value="${destination}"
                                />
                            </div>

                        </li>
                        <div class="border"></div>
                        <li class="search__item search__item--width">
                            <h3 class="search__item-heading">Nh???n ph??ng</h3>
                            <input
                                    required
                                    name="checkInDate"
                                    value="${checkInDate}"
                                    placeholder="Th??m ng??y"
                                    readonly
                                    class="date-picker-input-date"
                                    type="text"
                                    id="check_in"
                            />
                        </li>
                        <div class="border"></div>
                        <li class="search__item search__item--width">
                            <div class="search__item-link">
                                <h3 class="search__item-heading">Tr??? ph??ng</h3>
                                <input
                                        required
                                        name="checkOutDate"
                                        placeholder="Th??m ng??y"
                                        value="${checkOutDate}"
                                        class="date-picker-input-date"
                                        type="text"
                                        id="check_out"
                                        readonly
                                />
                            </div>
                        </li>
                        <div class="border"></div>
                        <li id="room-people" class="search__item">
                            <div  class="search__item-link search__item-link-two">
                                <div  class="link-text">
                                    <h3 class="search__item-heading">Kh??ch</h3>
                                    <c:if test="${quantityPeople == null}">
                                        <span
                                                id="search__item-input-quantity"
                                                class="search__item-input"
                                        >Th??m kh??ch</span>
                                    </c:if>
                                    <c:if test="${quantityPeople != null}">
                                        <span
                                                id="search__item-input-quantity"
                                                class="search__item-input"
                                        >${quantityPeople} Kh??ch</span>
                                    </c:if>
                                    <input
                                            required
                                            name="quantityPeople"
                                            <c:if test="${quantityPeople == null}">
                                                value="0 Kh??ch"
                                            </c:if>
                                            <c:if test="${quantityPeople != null}">
                                                value="${quantityPeople} Kh??ch"
                                            </c:if>
                                            readonly
                                            type="text"
                                            style="display: none"
                                            id="room-people_btn"
                                            class="room-people_btn"
                                    />
                                </div>
                            </div>

                            <div class="room-people-number">
                                <div class="room-people-number-warning">
                                    Vui l??ng nh???p tu???i tr??? em.
                                </div>
                                <div class="room-people-number-wrapper">
                                    <div class="room-people__label">Ng?????i l???n</div>
                                    <div class="room-people__btn">
                                        <div class="room-people__btn-adult-sub">
                                        <span
                                          class="iconify room-people-icon"
                                          data-icon="carbon:subtract-alt"
                                        ></span>
                                        </div>
                                        <div
                                                id="room-people__count--adult"
                                                class="room-people__count--adult"
                                        >
                                            <c:if test="${quantityPeople == null}">
                                                0
                                            </c:if>
                                            <c:if test="${quantityPeople != null}">
                                                ${quantityPeople}
                                            </c:if>
                                        </div>
                                        <div class="room-people__btn-adult-add">
                        <span
                                class="iconify room-people-icon"
                                data-icon="fluent:add-circle-24-regular"
                        ></span>
                                        </div>
                                    </div>
                                </div>
                                <div class="room-people-number-wrapper">
                                    <div class="room-people__label">Tr??? em</div>
                                    <div class="room-people__btn">
                                        <div class="room-people__btn-child-sub">
                        <span
                                class="iconify room-people-icon"
                                data-icon="carbon:subtract-alt"
                        ></span>
                                        </div>
                                        <div
                                                id="room-people__count--child"
                                                class="room-people__count--child"
                                        >
                                            0
                                        </div>
                                        <div class="room-people__btn-child-add">
                        <span
                                class="iconify room-people-icon"
                                data-icon="fluent:add-circle-24-regular"
                        ></span>
                                        </div>
                                    </div>
                                </div>
                                <div class="room-people-number-wrapper__child">
                                    <select
                                            class="room-people-age-child"
                                    >
                                        <option selected value="0">D?????i 1 tu???i</option>
                                        <option value="1">1 tu???i</option>
                                        <option value="2">2 tu???i</option>
                                        <option value="3">3 tu???i</option>
                                        <option value="4">4 tu???i</option>
                                        <option value="5">5 tu???i</option>
                                        <option value="6">6 tu???i</option>
                                        <option value="7">7 tu???i</option>
                                        <option value="8">8 tu???i</option>
                                        <option value="9">9 tu???i</option>
                                        <option value="10">10 tu???i</option>
                                        <option value="11">11 tu???i</option>
                                        <option value="12">12 tu???i</option>
                                        <option value="13">13 tu???i</option>
                                        <option value="14">14 tu???i</option>
                                        <option value="15">15 tu???i</option>
                                        <option value="16">16 tu???i</option>
                                        <option value="17">17 tu???i</option>
                                    </select>
                                </div>
                            </div>
                        </li>
                        <div class="border"></div>
                        <li class="search__item">
                            <div class="link-btn js-search-where-scroll">
                                <button class="search__item-link-btn">
                    <span
                            class="iconify"
                            data-icon="bytesize:search"
                            data-width="25"
                            data-height="25"
                    ></span>
                                </button>
                            </div>
                        </li>
                    </ul>
                    <input
                            type="checkbox"
                            class="calendar-input-checked"
                            id="calendar-click"
                    />
                    <label for="calendar-click" class="cancel-calendar"></label>
                </div>
            </form>
        </div>
        <div class="background__content">
            <div class="grid wide">
                <h3 class="background__content-heading">
                    B???n ch??a bi???t n??n ??i ????u? Tuy???t!
                </h3>
                <div class="background__content-search">
                    <a href="#">
                        <button class="background__content-search-btn">
                  <span class="background__content-search-btn-span"
                  >T??m ki???m linh ho???t</span
                  >
                        </button>
                    </a>
                </div>
            </div>
        </div>
    </div>

    <div class="web-container">
        <div class="grid wide">
            <div class="row web__content sm-gutter">
                <div class="col l-12">
                    <h1 class="web__content-heading">
                        Kh??m ph?? nh???ng ?????a ??i???m g???n ????y
                    </h1>
                    <div class="home__product">
                        <div
                                class="
                    row
                    sm-gutter
                    home__product-tablet home__product-mobile
                  "
                        >
                            <div class="col l-3 m-4 c-6">
                                <div class="home__product-place">
                                    <div class="home__product-img">
                                        <img
                                                src="${pageContext.request.contextPath}/user/images/hnoi.jpg"
                                                alt=""
                                                class="home__product-img-place"
                                        />
                                    </div>
                                    <div class="home__prodcut-info">
                                        <a href="${pageContext.request.contextPath}/home/rooms?action=search&destination=H??+N???i&checkInDate=&checkOutDate=&quantityPeople=1"
                                           class="home__prodcut-info-place atag">H?? N???i</a>
                                        <p class="home__prodcut-info-time">1 gi??? l??i xe</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col l-3 m-4 c-6">
                                <div class="home__product-place">
                                    <div class="home__product-img">
                                        <img
                                                src="${pageContext.request.contextPath}/user/images/NinhBinh.png"
                                                alt=""
                                                class="home__product-img-place"
                                        />
                                    </div>
                                    <div class="home__prodcut-info">
                                        <a href="${pageContext.request.contextPath}/home/rooms?action=search&destination=Qu???ng+Ng??i&checkInDate=&checkOutDate=&quantityPeople=1"
                                           class="home__prodcut-info-place atag">Qu???ng Ng??i</a>
                                        <p class="home__prodcut-info-time">2 gi??? l??i xe</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col l-3 m-4 c-6">
                                <div class="home__product-place">
                                    <div class="home__product-img">
                                        <img
                                                src="${pageContext.request.contextPath}/user/images/HP.png"
                                                alt=""
                                                class="home__product-img-place"
                                        />
                                    </div>
                                    <div class="home__prodcut-info">
                                        <a href="${pageContext.request.contextPath}/home/rooms?action=search&destination=H???i+Ph??ng&checkInDate=&checkOutDate=&quantityPeople=1"
                                           class="home__prodcut-info-place atag">H???i Ph??ng</a>
                                        <p class="home__prodcut-info-time">3 gi??? l??i xe</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col l-3 m-4 c-6">
                                <div class="home__product-place">
                                    <div class="home__product-img">
                                        <img
                                                src="${pageContext.request.contextPath}/user/images/mongcai.png"
                                                alt=""
                                                class="home__product-img-place"
                                        />
                                    </div>
                                    <div class="home__prodcut-info">
                                        <a href="${pageContext.request.contextPath}/home/rooms?action=search&destination=H???+Ch??+Minh&checkInDate=&checkOutDate=&quantityPeople=1"
                                           class="home__prodcut-info-place atag">TP. H??? Ch?? Minh</a>
                                        <p class="home__prodcut-info-time">4.5 gi??? l??i xe</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col l-3 m-4 c-6">
                                <div class="home__product-place">
                                    <div class="home__product-img">
                                        <img
                                                src="${pageContext.request.contextPath}/user/images/BG.jpg"
                                                alt=""
                                                class="home__product-img-place"
                                        />
                                    </div>
                                    <div class="home__prodcut-info">
                                        <a href="${pageContext.request.contextPath}/home/rooms?action=search&destination=?????k+L???k&checkInDate=&checkOutDate=&quantityPeople=1"
                                           class="home__prodcut-info-place atag">?????k L???k</a>
                                        <p class="home__prodcut-info-time">1 gi??? l??i xe</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col l-3 m-4 c-6">
                                <div class="home__product-place">
                                    <div class="home__product-img">
                                        <img
                                                src="${pageContext.request.contextPath}/user/images/lucnam.png"
                                                alt=""
                                                class="home__product-img-place"
                                        />
                                    </div>
                                    <div class="home__prodcut-info">
                                        <a href="${pageContext.request.contextPath}/home/rooms?action=search&destination=????+N???ng&checkInDate=&checkOutDate=&quantityPeople=1"
                                           class="home__prodcut-info-place atag">???? N???ng</a>
                                        <p class="home__prodcut-info-time">2 gi??? l??i xe</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col l-3 m-4 c-6">
                                <div class="home__product-place">
                                    <div class="home__product-img">
                                        <img
                                                src="${pageContext.request.contextPath}/user/images/hue.jpg"
                                                alt=""
                                                class="home__product-img-place"
                                        />
                                    </div>
                                    <div class="home__prodcut-info">
                                        <a href="${pageContext.request.contextPath}/home/rooms?action=search&destination=Hu???&checkInDate=&checkOutDate=&quantityPeople=1"
                                           class="home__prodcut-info-place atag">Hu???</a>
                                        <p class="home__prodcut-info-time">3 gi??? l??i xe</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col l-3 m-4 c-6">
                                <div class="home__product-place">
                                    <div class="home__product-img">
                                        <img
                                                src="${pageContext.request.contextPath}/user/images/CL.png"
                                                alt=""
                                                class="home__product-img-place"
                                        />
                                    </div>
                                    <div class="home__prodcut-info">
                                        <a href="${pageContext.request.contextPath}/home/rooms?action=search&destination=H???i+An&checkInDate=&checkOutDate=&quantityPeople=1"
                                           class="home__prodcut-info-place atag">H???i An</a>
                                        <p class="home__prodcut-info-time">4.5 gi??? l??i xe</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <h1 class="web__content-heading">??? b???t c??? ????u</h1>
                    <div class="home__category">
                        <div class="row sm-gutter home__category-tablet">
                            <a
                                    href=""
                                    class="
                      home__category-item-link
                      col
                      l-3
                      home__category-item-tablet
                    "
                            >
                                <div class="home__category-item">
                                    <img
                                            src="${pageContext.request.contextPath}/user/images/nghiduong.jpg"
                                            alt=""
                                            class="home__category-item-img"
                                    />
                                    <h3 class="home__category-item-name">
                                        N??i ngh??? d?????ng ngo??i tr???i
                                    </h3>
                                </div>
                            </a>
                            <a
                                    href=""
                                    class="
                      home__category-item-link
                      col
                      l-3
                      home__category-item-tablet
                    "
                            >
                                <div class="home__category-item">
                                    <img
                                            src="${pageContext.request.contextPath}/user/images/nd2.jpg"
                                            alt=""
                                            class="home__category-item-img"
                                    />
                                    <h3 class="home__category-item-name">Ch??? ??? ?????c ????o</h3>
                                </div>
                            </a>
                            <a
                                    href=""
                                    class="
                      home__category-item-link
                      col
                      l-3
                      home__category-item-tablet
                    "
                            >
                                <div class="home__category-item">
                                    <img
                                            src="${pageContext.request.contextPath}/user/images/nd3.jpg"
                                            alt=""
                                            class="home__category-item-img"
                                    />
                                    <h3 class="home__category-item-name">To??n b??? nh??</h3>
                                </div>
                            </a>
                            <a
                                    href=""
                                    class="
                      home__category-item-link
                      col
                      l-3
                      home__category-item-tablet
                    "
                            >
                                <div class="home__category-item">
                                    <img
                                            src="${pageContext.request.contextPath}/user/images/nd4.jpg"
                                            alt=""
                                            class="home__category-item-img"
                                    />
                                    <h3 class="home__category-item-name">
                                        Cho ph??p mang theo th?? c??ng
                                    </h3>
                                </div>
                            </a>
                        </div>
                    </div>
                    <a href="" class="web__content-banner-link">
                        <div class="web__content-banner" style="background: url(
                        <c:url value="/user/images/chunha.jpg"/> ) center / cover no-repeat ">
                            <div class="web__content-banner-info">
                                <h2 class="web__content-banner-heading">
                                    Th??? ????n ti???p kh??ch
                                </h2>
                                <p class="web__content-banner-text">
                                    Ki???m th??m thu nh???p v?? kh??m ph?? c??c c?? h???i m??? b???ng c??ch
                                    chia se n??i ??? c???a b???n.
                                </p>
                                <button type="button" class="web__content-banner-btn">
                                    T??m hi???u th??m
                                </button>
                            </div>
                        </div>
                    </a>
                    <h1 class="web__content-heading">
                        Kh??m ph?? nh???ng ??i???u n??n tr???i nghi???m
                    </h1>
                    <div class="home__experience">
                        <div class="row sm-gutter home__experience-mobile">
                            <div class="col l-4 m-4 home__experience-mobile-item">
                                <a href="" class="home__experience-item-link">
                                    <div class="img-experience-item">
                                        <img
                                                src="${pageContext.request.contextPath}/user/images/chokp.jpg"
                                                alt=""
                                                class="home__experience-item-img"
                                        />
                                    </div>
                                    <h3 class="home__experience-item-name">
                                        N??i ngh??? d?????ng ngo??i tr???i
                                    </h3>
                                    <p class="home__experience-item-info">
                                        T??m c??c ho???t ?????ng kh?? qu??n g???n b???n
                                    </p>
                                </a>
                            </div>
                            <div class="col l-4 m-4 home__experience-mobile-item">
                                <a href="" class="home__experience-item-link">
                                    <div class="img-experience-item">
                                        <img
                                                src="${pageContext.request.contextPath}/user/images/phonekp.jpg"
                                                alt=""
                                                class="home__experience-item-img"
                                        />
                                    </div>
                                    <h3 class="home__experience-item-name">
                                        Tr???i nghi???m tr???c tuy???n
                                    </h3>
                                    <p class="home__experience-item-info">
                                        C??c ho???t ?????ng t????ng t??c, truy???n tr???c ti???p d?????i s??? d???n
                                        d???t c???a Ng?????i t??? ch???c
                                    </p>
                                </a>
                            </div>
                            <div class="col l-4 m-4 home__experience-mobile-item">
                                <a href="" class="home__experience-item-link">
                                    <div class="img-experience-item">
                                        <img
                                                src="${pageContext.request.contextPath}/user/images/noibat.jpg"
                                                alt=""
                                                class="home__experience-item-img"
                                        />
                                    </div>
                                    <h3 class="home__experience-item-name">
                                        V???n ?????ng vi??n Olympic v?? v???n ?????ng vi??n Paralympic
                                    </h3>
                                    <p class="home__experience-item-info">
                                        C??c ho???t ?????ng tr???c tuy???n do v???n ?????ng vi??n t??? ch???c
                                    </p>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="footer">
        <div class="grid wide">
            <div class="row sm-gutter footer-head">
                <div class="col l-3 m-6 c-12">
                    <div class="footer__info">
                        <h4 class="footer__info-heading">Gi???i thi???u</h4>
                        <ul class="footer__info-list">
                            <li class="footer__info-item">
                                <a href="" class="footer__info-item-link">
                                    <p class="footer__info-item-name">
                                        Ph????ng th???c ho???t ?????ng c???a Travel Booking
                                    </p>
                                </a>
                            </li>
                            <li class="footer__info-item">
                                <a href="" class="footer__info-item-link">
                                    <p class="footer__info-item-name">Trang tin t???c</p>
                                </a>
                            </li>

                            <li class="footer__info-item">
                                <a href="" class="footer__info-item-link">
                                    <p class="footer__info-item-name">Nh?? ?????u t??</p>
                                </a>
                            </li>

                            <li class="footer__info-item">
                                <a href="" class="footer__info-item-link">
                                    <p class="footer__info-item-name">
                                        Nh??? c?? host, m???i ??i???u c?? th???
                                    </p>
                                </a>
                            </li>
                            <li class="footer__info-item">
                                <a href="" class="footer__info-item-link">
                                    <p class="footer__info-item-name">C?? h???i ngh??? nghi???p</p>
                                </a>
                            </li>
                            <li class="footer__info-item">
                                <a href="" class="footer__info-item-link">
                                    <p class="footer__info-item-name">Th?? c???a nh?? s??ng l???p</p>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="col l-3 m-6 c-12">
                    <div class="footer__info">
                        <h4 class="footer__info-heading">C???ng ?????ng</h4>
                        <ul class="footer__info-list">
                            <li class="footer__info-item">
                                <a href="" class="footer__info-item-link">
                                    <p class="footer__info-item-name">
                                        S??? ??a d???ng v?? C???m gi??c th??n thu???c
                                    </p>
                                </a>
                            </li>
                            <li class="footer__info-item">
                                <a href="" class="footer__info-item-link">
                                    <p class="footer__info-item-name">
                                        Ti???n nghi ph?? h???p cho ng?????i khuy???t t???t
                                    </p>
                                </a>
                            </li>
                            <li class="footer__info-item">
                                <a href="" class="footer__info-item-link">
                                    <p class="footer__info-item-name">
                                        ?????i t??c li??n k???t ThreeGuy
                                    </p>
                                </a>
                            </li>

                            <li class="footer__info-item">
                                <a href="" class="footer__info-item-link">
                                    <p class="footer__info-item-name">
                                        L?????t gi???i thi???u c???a kh??ch
                                    </p>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="col l-3 m-6 c-12">
                    <div class="footer__info">
                        <h4 class="footer__info-heading">????n ti???p kh??ch</h4>
                        <ul class="footer__info-list">
                            <li class="footer__info-item">
                                <a href="" class="footer__info-item-link">
                                    <p class="footer__info-item-name">Cho thu?? nh??</p>
                                </a>
                            </li>
                            <li class="footer__info-item">
                                <a href="" class="footer__info-item-link">
                                    <p class="footer__info-item-name">
                                        T??? ch???c Tr???i nghi???m tr???c tuy???n
                                    </p>
                                </a>
                            </li>
                            <li class="footer__info-item">
                                <a href="" class="footer__info-item-link">
                                    <p class="footer__info-item-name">T??? ch???c tr???i nghi???m</p>
                                </a>
                            </li>
                            <li class="footer__info-item">
                                <a href="" class="footer__info-item-link">
                                    <p class="footer__info-item-name">
                                        ????n ti???p kh??ch c?? tr??ch nhi???m
                                    </p>
                                </a>
                            </li>
                            <li class="footer__info-item">
                                <a href="" class="footer__info-item-link">
                                    <p class="footer__info-item-name">Trung t??m t??i nguy??n</p>
                                </a>
                            </li>
                            <li class="footer__info-item">
                                <a href="" class="footer__info-item-link">
                                    <p class="footer__info-item-name">Trung t??m c???ng ?????ng</p>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="col l-3 m-6 c-12">
                    <div class="footer__info">
                        <h4 class="footer__info-heading">H??? tr???</h4>
                        <ul class="footer__info-list">
                            <li class="footer__info-item">
                                <a href="" class="footer__info-item-link">
                                    <p class="footer__info-item-name">
                                        Bi???n ph??p ???ng ph?? v???i ?????i d???ch COVID-19 c???a ch??ng t???i
                                    </p>
                                </a>
                            </li>
                            <li class="footer__info-item">
                                <a href="" class="footer__info-item-link">
                                    <p class="footer__info-item-name">Trung t??m tr??? gi??p</p>
                                </a>
                            </li>
                            <li class="footer__info-item">
                                <a href="" class="footer__info-item-link">
                                    <p class="footer__info-item-name">C??c t??y ch???n h???y</p>
                                </a>
                            </li>
                            <li class="footer__info-item">
                                <a href="" class="footer__info-item-link">
                                    <p class="footer__info-item-name">H??? tr??? d??n c??</p>
                                </a>
                            </li>
                            <li class="footer__info-item">
                                <a href="" class="footer__info-item-link">
                                    <p class="footer__info-item-name">Tin c???y v?? an to??n</p>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="footer-end hold-on-mobile">
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
                            <span href="" class="footer__end-social-item-link">
                    USD
                  </span>
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
</div>

<script src="<c:url value="/user/js/index.js"/> "></script>
<script src="<c:url value="/user/node_modules/moment/moment.js"/> "></script>
<script>
    var format = "DD-MM-YYYY";
    var today = moment();
    today.subtract(1, "days").format(format);
    const disallowedDates = [["2001-01-01", today]];
    new Litepicker({
        element: document.getElementById("check_in"),
        elementEnd: document.getElementById("check_out"),
        singleMode: false,
        numberOfColumns: 2,
        numberOfMonths: 2,
        format: "DD/MM/YYYY",
        lockDays: disallowedDates,
        tooltipText: {
            one: "night",
            other: "nights",
        },
        tooltipNumber: (totalDays) => {
            return totalDays;
        },
    });
</script>
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
<script>
    $("html").click(function () {
        $(".room-people-number").removeClass("active");
        $(".room-people-number-warning").removeClass("active");
        $(".room-people-age-child").removeClass("active");
    });
    $("#room-people").click(function (e) {
        e.stopPropagation();
    });
    $("#room-people").click(function (e) {
        $(".room-people-number").addClass("active");
        if (parseInt(
            document.getElementById("room-people__count--child").innerHTML) != 0) {
            $(".room-people-number-warning").addClass("active");
            $(".room-people-age-child").addClass("active");
        }
    });
</script>
<script>
    // btn add sub
    var max_people = 5;

    $(".room-people__btn-adult-add").click(function (e) {
        var temp = parseInt(
            document.getElementById("room-people__count--adult").innerHTML
        );
        var quantity = parseInt(
            document.getElementById("room-people_btn").value
        );

        if (temp < max_people) {
            temp += 1;
            quantity += 1;
            document.getElementById("room-people__count--adult").innerHTML = temp;
            document.getElementById("room-people_btn").value = quantity;
            document.getElementById("search__item-input-quantity").innerHTML =
                quantity + " Kh??ch";
        }
        if (quantity === 0) {
            document.getElementById("search__item-input-quantity").innerHTML =
                "Th??m ng?????i";
        }
    });
    $(".room-people__btn-adult-sub").click(function (e) {
        if (
            parseInt(
                document.getElementById("room-people__count--child").innerHTML
            ) >= 1 && parseInt(
                document.getElementById("room-people__count--adult").innerHTML
            ) === 1
        ) {
            return 0;
        }
        var quantity = parseInt(
            document.getElementById("room-people_btn").value
        );
        var temp = parseInt(
            document.getElementById("room-people__count--adult").innerHTML
        );
        if (temp > 0) {
            temp -= 1;
            quantity -= 1;
            document.getElementById("room-people__count--adult").innerHTML = temp;
            document.getElementById("room-people_btn").value = quantity;
            document.getElementById("search__item-input-quantity").innerHTML =
                quantity + " Kh??ch";
        }
        if (quantity === 0) {
            document.getElementById("search__item-input-quantity").innerHTML =
                "Th??m kh??ch";
        }
    });
    $(".room-people__btn-child-add").click(function (e) {
        if (
            parseInt(
                document.getElementById("room-people__count--adult").innerHTML
            ) === 0
        ) {
            return 0;
        }
        var temp = parseInt(
            document.getElementById("room-people__count--child").innerHTML
        );
        var quantity = parseInt(
            document.getElementById("room-people_btn").value
        );
        if (temp < max_people) {
            temp += 1;
            quantity += 1;
            document.getElementById("room-people__count--child").innerHTML = temp;
            document.querySelector(".room-people-number-warning").className +=
                " active";
            document.querySelector(".room-people-age-child").className +=
                " active";
            document.getElementById("room-people_btn").value = quantity;
            document.getElementById("search__item-input-quantity").innerHTML =
                quantity + " Kh??ch";
        }
        if (quantity === 0) {
            document.getElementById("search__item-input-quantity").innerHTML =
                "Th??m ng?????i";
        }
    });
    $(".room-people__btn-child-sub").click(function (e) {
        var temp = parseInt(
            document.getElementById("room-people__count--child").innerHTML
        );
        var quantity = parseInt(
            document.getElementById("room-people_btn").value
        );
        if (temp > 0) {
            temp -= 1;
            quantity -= 1;
            document.getElementById("room-people__count--child").innerHTML = temp;
            document.querySelector(".room-people-number-warning").className =
                document
                    .querySelector(".room-people-number-warning")
                    .className.replace(" active", "");
            document.querySelector(".room-people-age-child").className = document
                .querySelector(".room-people-age-child")
                .className.replace(" active", "");
            document.getElementById("room-people_btn").value = quantity;
            document.getElementById("search__item-input-quantity").innerHTML =
                quantity + " Kh??ch";
        }
        if (quantity === 0) {
            document.getElementById("search__item-input-quantity").innerHTML =
                "Th??m ng?????i";
        }
    });
</script>
</body>
</html>
