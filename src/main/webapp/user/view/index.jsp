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
                            <a href="" class="header__nav-item-link">Nơi ở</a>
                        </li>

                        <li class="header__nav-item">
                            <a href="" class="header__nav-item-link"
                            >Trải nghiệm trực tuyến(dự án)</a
                            >
                        </li>
                    </ul>
                    <ul id="header__nav-item-user" class="header__nav-list header__nav-list--hover">
                        <li class="header__nav-item header__nav-item-user">
                            <div  class="nav-tablet">
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
                                            <a href="${pageContext.request.contextPath}/user/view/login.jsp"
                                               style="display: block"
                                               class="nav-tablet__item-link">Xin chào ${sessionScope.user.firstName}</a>
                                        </li>
                                        <li class="nav-tablet__item js-sign">
                                            <a href="${pageContext.request.contextPath}/user/view/login.jsp"
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
                                <h3 class="search__item-heading">Địa điểm</h3>
                                <input
                                        name="destination"
                                        type="text"
                                        class="search__item-input"
                                        placeholder="Bạn sắp đi đâu"
                                        value="${destination}"
                                />
                            </div>
                            <div
                                    id="location-search-select-list"
                                    class="location-search-select-list"
                            >
                                <div class="location-search-select-label">
                                    Địa điểm nổi bật
                                </div>
                                <button type="button"
                                        id="location-search-suggest-1"
                                        class="location-search-select-wrapper"
                                >
                                    <div class="location-search-select-wrapper__icons">
                      <span
                              class="iconify location-search-select-icons"
                              data-icon="ci:location"
                      ></span>
                                    </div>
                                    <div class="location-search-select-wrapper__content">
                                        <div
                                                class="location-search-select-wrapper__content__title"
                                        >
                                            Đà nẵng
                                        </div>
                                        <div
                                                class="
                          location-search-select-wrapper__content__sub-title
                        "
                                        >
                                            Địa điểm
                                        </div>
                                    </div>
                                </button>
                                <button
                                        type="button"
                                        id="location-search-suggest-2"
                                        class="location-search-select-wrapper"
                                >
                                    <div class="location-search-select-wrapper__icons">
                      <span
                              class="iconify location-search-select-icons"
                              data-icon="icon-park-outline:hotel"
                      ></span>
                                    </div>
                                    <div class="location-search-select-wrapper__content">
                                        <div
                                                class="location-search-select-wrapper__content__title"
                                        >
                                            Sheraton
                                        </div>
                                        <div
                                                class="
                          location-search-select-wrapper__content__sub-title
                        "
                                        >
                                            Khách sạn
                                        </div>
                                    </div>
                                </button>

                                <button
                                        type="button"
                                        id="location-search-suggest-4"
                                        class="location-search-select-wrapper"
                                >
                                    <div class="location-search-select-wrapper__icons">
                      <span
                              class="iconify location-search-select-icons"
                              data-icon="ci:location"
                      ></span>
                                    </div>
                                    <div class="location-search-select-wrapper__content">
                                        <div
                                                class="location-search-select-wrapper__content__title"
                                        >
                                            Đà nẵng
                                        </div>
                                        <div
                                                class="
                          location-search-select-wrapper__content__sub-title
                        "
                                        >
                                            Địa điểm
                                        </div>
                                    </div>
                                </button>
                                <button
                                        type="button"
                                        id="location-search-suggest-5"
                                        class="location-search-select-wrapper"
                                >
                                    <div class="location-search-select-wrapper__icons">
                      <span
                              class="iconify location-search-select-icons"
                              data-icon="ci:location"
                      ></span>
                                    </div>
                                    <div class="location-search-select-wrapper__content">
                                        <div
                                                class="location-search-select-wrapper__content__title"
                                        >
                                            Đà nẵng
                                        </div>
                                        <div
                                                class="
                          location-search-select-wrapper__content__sub-title
                        "
                                        >
                                            Địa điểm
                                        </div>
                                    </div>
                                </button>
                                <button
                                        type="button"
                                        id="location-search-suggest-6"
                                        class="location-search-select-wrapper"
                                >
                                    <div class="location-search-select-wrapper__icons">
                      <span
                              class="iconify location-search-select-icons"
                              data-icon="ci:location"
                      ></span>
                                    </div>
                                    <div class="location-search-select-wrapper__content">
                                        <div
                                                class="location-search-select-wrapper__content__title"
                                        >
                                            Đà nẵng
                                        </div>
                                        <div
                                                class="
                          location-search-select-wrapper__content__sub-title
                        "
                                        >
                                            Địa điểm
                                        </div>
                                    </div>
                                </button>
                            </div>
                        </li>
                        <div class="border"></div>
                        <li class="search__item search__item--width">
                            <h3 class="search__item-heading">Nhận phòng</h3>
                            <input
                                    name="checkInDate"
                                    value="${checkInDate}"
                                    placeholder="Thêm ngày"
                                    readonly
                                    class="date-picker-input-date"
                                    type="text"
                                    id="check_in"
                            />
                        </li>
                        <div class="border"></div>
                        <li class="search__item search__item--width">
                            <div class="search__item-link">
                                <h3 class="search__item-heading">Trả phòng</h3>
                                <input
                                        name="checkOutDate"
                                        placeholder="Thêm ngày"
                                        value="${checkOutDate}"
                                        class="date-picker-input-date"
                                        type="text"
                                        id="check_out"
                                        readonly
                                />
                            </div>
                        </li>
                        <div class="border"></div>
                        <li id="input_customer" class="search__item">
                            <div class="search__item-link search__item-link-two">
                                <input
                                        type="checkbox"
                                        hidden
                                        class="input-customer-checked"
                                        id="input-customer-check"
                                />

                                <label for="input-customer-check" class="link-text">
                                    <h3 class="search__item-heading">Khách</h3>
                                    <c:if test="${quantityPeople == null}">
                                        <span
                                                id="search__item-input-quantity"
                                                class="search__item-input"
                                        >Thêm khách</span>
                                    </c:if>
                                    <c:if test="${quantityPeople != null}">
                                        <span
                                                id="search__item-input-quantity"
                                                class="search__item-input"
                                        >${quantityPeople} Khách</span>
                                    </c:if>
                                    <input
                                            name="quantityPeople"
                                            <c:if test="${quantityPeople == null}">
                                                value="0 Khách"
                                            </c:if>
                                            <c:if test="${quantityPeople != null}">
                                                value="${quantityPeople} Khách"
                                            </c:if>

                                            readonly
                                            type="text"
                                            style="display: none"
                                            id="room-people_btn"
                                            class="room-people_btn"
                                    />
                                </label>
                            </div>

                            <div class="room-people-number">
                                <div class="room-people-number-warning">
                                    Vui lòng nhập tuổi trẻ em.
                                </div>
                                <div class="room-people-number-wrapper">
                                    <div class="room-people__label">Người lớn</div>
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
                                    <div class="room-people__label">Trẻ em</div>
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
                                        <option selected value="0">Dưới 1 tuổi</option>
                                        <option value="1">1 tuổi</option>
                                        <option value="2">2 tuổi</option>
                                        <option value="3">3 tuổi</option>
                                        <option value="4">4 tuổi</option>
                                        <option value="5">5 tuổi</option>
                                        <option value="6">6 tuổi</option>
                                        <option value="7">7 tuổi</option>
                                        <option value="8">8 tuổi</option>
                                        <option value="9">9 tuổi</option>
                                        <option value="10">10 tuổi</option>
                                        <option value="11">11 tuổi</option>
                                        <option value="12">12 tuổi</option>
                                        <option value="13">13 tuổi</option>
                                        <option value="14">14 tuổi</option>
                                        <option value="15">15 tuổi</option>
                                        <option value="16">16 tuổi</option>
                                        <option value="17">17 tuổi</option>
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
                    Bạn chưa biết nên đi đâu? Tuyệt!
                </h3>
                <div class="background__content-search">
                    <a href="#">
                        <button class="background__content-search-btn">
                  <span class="background__content-search-btn-span"
                  >Tìm kiếm linh hoạt</span
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
                        Khám phá những địa điểm gần đây
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
                                        <a href="${pageContext.request.contextPath}/home/rooms?action=search&destination=Hà+Nội&checkInDate=&checkOutDate=&quantityPeople=1"
                                           class="home__prodcut-info-place atag">Hà Nội</a>
                                        <p class="home__prodcut-info-time">1 giờ lái xe</p>
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
                                        <a href="${pageContext.request.contextPath}/home/rooms?action=search&destination=Ninh+Bình&checkInDate=&checkOutDate=&quantityPeople=1"
                                           class="home__prodcut-info-place atag">Ninh Bình</a>
                                        <p class="home__prodcut-info-time">2 giờ lái xe</p>
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
                                        <a href="${pageContext.request.contextPath}/home/rooms?action=search&destination=Hải+Phòng&checkInDate=&checkOutDate=&quantityPeople=1"
                                           class="home__prodcut-info-place atag">Hải Phòng</a>
                                        <p class="home__prodcut-info-time">3 giờ lái xe</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col l-3 m-4 c-6">
                                <div class="home__product-place">
                                    <div class="home__product-img">
                                        <img
                                                src="${pageContext.request.contextPath}/user/images/Móng Cái.png"
                                                alt=""
                                                class="home__product-img-place"
                                        />
                                    </div>
                                    <div class="home__prodcut-info">
                                        <a href="${pageContext.request.contextPath}/home/rooms?action=search&destination=Móng+Cái&checkInDate=&checkOutDate=&quantityPeople=1"
                                           class="home__prodcut-info-place atag">Móng Cái</a>
                                        <p class="home__prodcut-info-time">4.5 giờ lái xe</p>
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
                                        <a href="${pageContext.request.contextPath}/home/rooms?action=search&destination=Bắc+Giang&checkInDate=&checkOutDate=&quantityPeople=1"
                                           class="home__prodcut-info-place atag">Bắc Giang</a>
                                        <p class="home__prodcut-info-time">1 giờ lái xe</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col l-3 m-4 c-6">
                                <div class="home__product-place">
                                    <div class="home__product-img">
                                        <img
                                                src="${pageContext.request.contextPath}/user/images/LụcNam.png"
                                                alt=""
                                                class="home__product-img-place"
                                        />
                                    </div>
                                    <div class="home__prodcut-info">
                                        <a href="${pageContext.request.contextPath}/home/rooms?action=search&destination=Lục+Nam&checkInDate=&checkOutDate=&quantityPeople=1"
                                           class="home__prodcut-info-place atag">Lục Nam</a>
                                        <p class="home__prodcut-info-time">2 giờ lái xe</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col l-3 m-4 c-6">
                                <div class="home__product-place">
                                    <div class="home__product-img">
                                        <img
                                                src="${pageContext.request.contextPath}/user/images/Huế.jpg"
                                                alt=""
                                                class="home__product-img-place"
                                        />
                                    </div>
                                    <div class="home__prodcut-info">
                                        <a href="${pageContext.request.contextPath}/home/rooms?action=search&destination=Huế&checkInDate=&checkOutDate=&quantityPeople=1"
                                           class="home__prodcut-info-place atag">Huế</a>
                                        <p class="home__prodcut-info-time">3 giờ lái xe</p>
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
                                        <a href="${pageContext.request.contextPath}/home/rooms?action=search&destination=Cẩm+Lý&checkInDate=&checkOutDate=&quantityPeople=1"
                                           class="home__prodcut-info-place atag">Cẩm Lý</a>
                                        <p class="home__prodcut-info-time">4.5 giờ lái xe</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <h1 class="web__content-heading">Ở bất cứ đâu</h1>
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
                                            src="${pageContext.request.contextPath}/user/images/Nghỉ dưỡng.jpg"
                                            alt=""
                                            class="home__category-item-img"
                                    />
                                    <h3 class="home__category-item-name">
                                        Nơi nghỉ dưỡng ngoài trời
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
                                    <h3 class="home__category-item-name">Chỗ ở độc đáo</h3>
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
                                    <h3 class="home__category-item-name">Toàn bộ nhà</h3>
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
                                        Cho phép mang theo thú cưng
                                    </h3>
                                </div>
                            </a>
                        </div>
                    </div>
                    <a href="" class="web__content-banner-link">
                        <div class="web__content-banner" style="background: url(
                        <c:url value="/user/images/banner.jpg"/> ) center / cover no-repeat ">
                            <div class="web__content-banner-info">
                                <h2 class="web__content-banner-heading">
                                    Thử đón tiếp khách
                                </h2>
                                <p class="web__content-banner-text">
                                    Kiếm thêm thu nhập và khám phá các cơ hội mớ bằng cách
                                    chia se nơi ở của bạn.
                                </p>
                                <button type="button" class="web__content-banner-btn">
                                    Tìm hiểu thêm
                                </button>
                            </div>
                        </div>
                    </a>
                    <h1 class="web__content-heading">
                        Khám phá những điều nên trải nghiệm
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
                                        Nơi nghỉ dưỡng ngoài trời
                                    </h3>
                                    <p class="home__experience-item-info">
                                        Tìm các hoạt động khó quên gần bạn
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
                                        Trải nghiệm trực tuyến
                                    </h3>
                                    <p class="home__experience-item-info">
                                        Các hoạt động tương tác, truyền trực tiếp dưới sự dẫn
                                        dắt của Người tổ chức
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
                                        Vận động viên Olympic và vận động viên Paralympic
                                    </h3>
                                    <p class="home__experience-item-info">
                                        Các hoạt động trực tuyến do vận động viên tổ chức
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
                        <h4 class="footer__info-heading">Giới thiệu</h4>
                        <ul class="footer__info-list">
                            <li class="footer__info-item">
                                <a href="" class="footer__info-item-link">
                                    <p class="footer__info-item-name">
                                        Phương thức hoạt động của Travel Booking
                                    </p>
                                </a>
                            </li>
                            <li class="footer__info-item">
                                <a href="" class="footer__info-item-link">
                                    <p class="footer__info-item-name">Trang tin tức</p>
                                </a>
                            </li>

                            <li class="footer__info-item">
                                <a href="" class="footer__info-item-link">
                                    <p class="footer__info-item-name">Nhà đầu tư</p>
                                </a>
                            </li>

                            <li class="footer__info-item">
                                <a href="" class="footer__info-item-link">
                                    <p class="footer__info-item-name">
                                        Nhờ có host, mọi điều có thể
                                    </p>
                                </a>
                            </li>
                            <li class="footer__info-item">
                                <a href="" class="footer__info-item-link">
                                    <p class="footer__info-item-name">Cơ hội nghề nghiệp</p>
                                </a>
                            </li>
                            <li class="footer__info-item">
                                <a href="" class="footer__info-item-link">
                                    <p class="footer__info-item-name">Thư của nhà sáng lập</p>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="col l-3 m-6 c-12">
                    <div class="footer__info">
                        <h4 class="footer__info-heading">Cộng đồng</h4>
                        <ul class="footer__info-list">
                            <li class="footer__info-item">
                                <a href="" class="footer__info-item-link">
                                    <p class="footer__info-item-name">
                                        Sự đa dạng và Cảm giác thân thuộc
                                    </p>
                                </a>
                            </li>
                            <li class="footer__info-item">
                                <a href="" class="footer__info-item-link">
                                    <p class="footer__info-item-name">
                                        Tiện nghi phù hợp cho người khuyết tật
                                    </p>
                                </a>
                            </li>
                            <li class="footer__info-item">
                                <a href="" class="footer__info-item-link">
                                    <p class="footer__info-item-name">
                                        Đối tác liên kết ThreeGuy
                                    </p>
                                </a>
                            </li>

                            <li class="footer__info-item">
                                <a href="" class="footer__info-item-link">
                                    <p class="footer__info-item-name">
                                        Lượt giới thiệu của khách
                                    </p>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="col l-3 m-6 c-12">
                    <div class="footer__info">
                        <h4 class="footer__info-heading">Đón tiếp khách</h4>
                        <ul class="footer__info-list">
                            <li class="footer__info-item">
                                <a href="" class="footer__info-item-link">
                                    <p class="footer__info-item-name">Cho thuê nhà</p>
                                </a>
                            </li>
                            <li class="footer__info-item">
                                <a href="" class="footer__info-item-link">
                                    <p class="footer__info-item-name">
                                        Tổ chức Trải nghiệm trực tuyến
                                    </p>
                                </a>
                            </li>
                            <li class="footer__info-item">
                                <a href="" class="footer__info-item-link">
                                    <p class="footer__info-item-name">Tổ chức trải nghiệm</p>
                                </a>
                            </li>
                            <li class="footer__info-item">
                                <a href="" class="footer__info-item-link">
                                    <p class="footer__info-item-name">
                                        Đón tiếp khách có trách nhiệm
                                    </p>
                                </a>
                            </li>
                            <li class="footer__info-item">
                                <a href="" class="footer__info-item-link">
                                    <p class="footer__info-item-name">Trung tâm tài nguyên</p>
                                </a>
                            </li>
                            <li class="footer__info-item">
                                <a href="" class="footer__info-item-link">
                                    <p class="footer__info-item-name">Trung tâm cộng đồng</p>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="col l-3 m-6 c-12">
                    <div class="footer__info">
                        <h4 class="footer__info-heading">Hỗ trợ</h4>
                        <ul class="footer__info-list">
                            <li class="footer__info-item">
                                <a href="" class="footer__info-item-link">
                                    <p class="footer__info-item-name">
                                        Biện pháp ứng phó với đại dịch COVID-19 của chúng tối
                                    </p>
                                </a>
                            </li>
                            <li class="footer__info-item">
                                <a href="" class="footer__info-item-link">
                                    <p class="footer__info-item-name">Trung tâm trợ giúp</p>
                                </a>
                            </li>
                            <li class="footer__info-item">
                                <a href="" class="footer__info-item-link">
                                    <p class="footer__info-item-name">Các tùy chọn hủy</p>
                                </a>
                            </li>
                            <li class="footer__info-item">
                                <a href="" class="footer__info-item-link">
                                    <p class="footer__info-item-name">Hỗ trợ dân cư</p>
                                </a>
                            </li>
                            <li class="footer__info-item">
                                <a href="" class="footer__info-item-link">
                                    <p class="footer__info-item-name">Tin cậy và an toàn</p>
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
    // btn add sub
    var max_people = 5;
    var min_people = 0;
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
                quantity + " Khách";
        }
        if (quantity === 0) {
            document.getElementById("search__item-input-quantity").innerHTML =
                "Thêm người";
        }
    });
    $(".room-people__btn-adult-sub").click(function (e) {
        if (
            parseInt(
                document.getElementById("room-people__count--child").innerHTML
            ) >= 1
        ) {
            return 0;
        }
        var quantity = parseInt(
            document.getElementById("room-people_btn").value
        );
        var temp = parseInt(
            document.getElementById("room-people__count--adult").innerHTML
        );
        if (temp > min_people) {
            temp -= 1;
            quantity -= 1;
            document.getElementById("room-people__count--adult").innerHTML = temp;
            document.getElementById("room-people_btn").value = quantity;
            document.getElementById("search__item-input-quantity").innerHTML =
                quantity + " Khách";
        }
        if (quantity === 0) {
            document.getElementById("search__item-input-quantity").innerHTML =
                "Thêm khách";
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
                quantity + " Khách";
        }
        if (quantity === 0) {
            document.getElementById("search__item-input-quantity").innerHTML =
                "Thêm người";
        }
    });
    $(".room-people__btn-child-sub").click(function (e) {
        var temp = parseInt(
            document.getElementById("room-people__count--child").innerHTML
        );
        var quantity = parseInt(
            document.getElementById("room-people_btn").value
        );
        if (temp > min_people) {
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
                quantity + " Khách";
        }
        if (quantity === 0) {
            document.getElementById("search__item-input-quantity").innerHTML =
                "Thêm người";
        }
    });
</script>
</body>
</html>
