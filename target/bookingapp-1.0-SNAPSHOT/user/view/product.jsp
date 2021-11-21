<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
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
    <link
            rel="stylesheet"
            href="https://cdn.jsdelivr.net/npm/litepicker/dist/css/litepicker.css"
    />
    <script src="https://cdn.jsdelivr.net/npm/litepicker/dist/litepicker.js"></script>
    <!-- CSS -->

    <link rel="stylesheet" href="<c:url value="/user/styles/root.css"/> "/>
    <link rel="stylesheet" href="<c:url value="/user/styles/grid.css"/> "/>
    <link rel="stylesheet" href="<c:url value="/user/styles/main.css"/> "/>
</head>

<body>
<div id="layout">
    <!-- top nav -->
    <div class="top-nav">
        <div class="container-main">
            <div class="nav-bar">
                <div class="nav-content">
                    <a href="" class="logo">Travel Booking</a>
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
                                <li class="nav-tablet__item js-sign">
                                    <a href="#" class="nav-tablet__item-link">Đăng ký</a>
                                </li>
                                <li class="nav-tablet__item js-sign">
                                    <a href="#" class="nav-tablet__item-link">Đăng nhập</a>
                                </li>
                                <li class="nav-tablet__item">
                                    <a href="#" class="nav-tablet__item-link">
                                        Cài đặt tài khoản
                                    </a>
                                </li>
                                <li class="nav-tablet__item">
                                    <a href="#" class="nav-tablet__item-link">
                                        Lịch sử chuyến đi
                                    </a>
                                </li>
                                <li class="nav-tablet__item">
                                    <a href="#" class="nav-tablet__item-link"> Đăng xuất </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- end top nav -->

    <!-- Main Content -->

    <div class="container-main">
        <!-- Search bar -->
        <form action="${pageContext.request.contextPath}/home/room" method="get">
            <div class="row">
                <div class="col-4 col-md-4 col-sm-12">
                    <div class="box box-outline">
                        <div class="location-search" id="location-search">
                <span
                        class="iconify search-bar-icons"
                        data-icon="ci:location"
                ></span>
                            <div class="location-search-toggle">
                                <label for="location-search-input" class="search-bar__label"
                                >Điểm đến</label
                                >
                                <input
                                        name="destination"
                                        class="location-search-input input"
                                        type="text"
                                        placeholder="Thành phố, khách sạn, điểm đến"
                                        autocomplete="off"
                                        id="location-search-input"
                                        value
                                        class
                                />
                            </div>
                            <div
                                    id="location-search-select-list"
                                    class="location-search-select-list"
                            >
                                <div class="location-search-select-label">
                                    Địa điểm nổi bật
                                </div>
                                <button
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
                                        id="location-search-suggest-3"
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
                                            Amannoi
                                        </div>
                                        <div
                                                class="
                          location-search-select-wrapper__content__sub-title
                        "
                                        >
                                            Khu nghỉ dưỡng
                                        </div>
                                    </div>
                                </button>
                                <button
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
                        </div>
                    </div>
                </div>
                <div class="col-2 col-md-2 col-sm-6">
                    <div class="date-picker">
              <span
                      class="iconify search-bar-icons_date"
                      data-icon="bx:bx-calendar-event"
              ></span>
                        <div class="date-picker-search-toggle">
                <span
                        class="iconify search-bar-icons_date"
                        data-icon="bx:bx-calendar-event"
                        data-height="25"
                        data-width="25"
                ></span>
                            <label for="check_in" class="search-bar__label_date"
                            >Nhận phòng</label
                            >
                            <input
                                    name="checkInDay"
                                    placeholder="DD/MM/YYYY"
                                    readonly
                                    class="date-picker-input-date"
                                    type="text"
                                    id="check_in"
                            />
                        </div>
                    </div>
                </div>
                <div class="col-2 col-md-2 col-sm-6">
                    <div class="date-picker">
              <span
                      class="iconify search-bar-icons_date"
                      data-icon="bx:bx-calendar-event"
                      data-height="25"
                      data-width="25"
              ></span>
                        <div class="date-picker-toggle">
                            <label for="check_out" class="search-bar__label_date"
                            >Trả phòng</label
                            >
                            <input
                                    name="checkOutDay"
                                    placeholder="DD/MM/YYYY"
                                    class="date-picker-input-date"
                                    type="text"
                                    id="check_out"
                                    readonly
                            />
                        </div>
                    </div>
                </div>
                <div class="col-3 col-md-3 col-sm-12">
                    <div class="box box-outline box-hover">
                        <div class="room-people" id="room-people">
                <span
                        class="iconify search-bar-icons"
                        data-icon="mdi:human-male-male"
                ></span>
                            <div class="room-people-search-toggle">
                                <label for="room-people_btn" class="search-bar__label"
                                >Số người</label
                                >
                                <input
                                        name="accomodates"
                                        disabled
                                        type="text"
                                        value="1 Khách"
                                        id="room-people_btn"
                                        class="room-people_btn"
                                />
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
                                            1
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
                        </div>
                    </div>
                </div>
                <div class="col-1 col-md-1 col-sm-12">
                    <button type="submit" class="box-fill btn-search box-outline">
              <span
                      class="iconify search-bar-icons__search"
                      data-icon="bytesize:search"
              ></span>
                    </button>
                </div>
            </div>
        </form>
        <!-- End search bar -->
    </div>

    <!-- body content -->

    <div class="body-content">
        <div class="container-main">
            <div class="row">
                <div class="col-3">
                    <div class="row">
                        <div class="col-12">
                            <div class="filter-product-container">
                                <div class="filter-product-header">Bộ lọc</div>

                                <div class="filter-product-label">Sắp xếp theo</div>
                                <div class="filter-product-sort-wrapper">
                                    <input type="checkbox" id="sort-1" value="low_to_high"/>
                                    <label for="sort-1">Sắp xếp giá tăng dần</label><br/>
                                    <input type="checkbox" id="sort-2" value="high_to_low"/>
                                    <label for="sort-1">Sắp xếp giá giãm dần</label><br/>
                                </div>
                                <div class="filter-product-label">Loại phòng</div>
                                <div class="filter-product-room-type-wrapper">
                                    <input type="checkbox" id="type-1" value="any"/>
                                    <label for="type-1">Phòng riêng</label><br/>
                                    <input type="checkbox" id="type-2" value="any"/>
                                    <label for="type-2">Nguyên căn</label><br/>
                                    <input type="checkbox" id="type-3" value="any"/>
                                    <label for="type-3">Khách sạn</label><br/>
                                    <input type="checkbox" id="type-4" value="any"/>
                                    <label for="type-4">Homestay</label><br/>
                                </div>
                                <div class="filter-product-label">Xếp hạng sao</div>
                                <div class="filter-product-star-wrapper">
                                    <div class="filter-product-star-wrapper-input">
                                        <input type="checkbox" id="star-1" value="one"/>
                                        <label class="star-label-input" for="star-1"
                                        ><span class="star-wrapper"> 1★ </span>
                                        </label>
                                    </div>
                                    <div class="filter-product-star-wrapper-input">
                                        <input type="checkbox" id="star-2" value="one"/>
                                        <label class="star-label-input" for="star-2"
                                        ><span class="star-wrapper"> 2★ </span>
                                        </label>
                                    </div>
                                    <div class="filter-product-star-wrapper-input">
                                        <input type="checkbox" id="star-3" value="one"/>
                                        <label class="star-label-input" for="star-3"
                                        ><span class="star-wrapper"> 3★ </span>
                                        </label>
                                    </div>
                                    <div class="filter-product-star-wrapper-input">
                                        <input type="checkbox" id="star-4" value="one"/>
                                        <label class="star-label-input" for="star-4"
                                        ><span class="star-wrapper"> 4★ </span>
                                        </label>
                                    </div>
                                    <div class="filter-product-star-wrapper-input">
                                        <input type="checkbox" id="star-5" value="one"/>
                                        <label class="star-label-input" for="star-5"
                                        ><span class="star-wrapper"> 5★ </span>
                                        </label>
                                    </div>
                                </div>
                                <div class="filter-product-label">Ngân sách</div>
                                <div class="filter-product-budget-wrapper">
                                    <input type="checkbox" id="budget-1" value="under_1m"/>
                                    <label for="budget-1">Dưới 1.000.000 ₫</label><br/>
                                    <input type="checkbox" id="budget-2" value="1m_to_2m"/>
                                    <label for="budget-2">1.000.000 ₫ đến 2.000.000 ₫</label
                                    ><br/>
                                    <input type="checkbox" id="budget-3" value="2m_to_5m"/>
                                    <label for="budget-3">2.000.000 ₫ đến 5.000.000 ₫</label
                                    ><br/>
                                    <input type="checkbox" id="budget-4" value="5m_to_10m"/>
                                    <label for="budget-4">5.000.000 ₫ đến 10.000.000 ₫</label
                                    ><br/>
                                    <input type="checkbox" id="budget-5" value="over_10m"/>
                                    <label for="budget-5">Hơn 10.00.000 ₫</label><br/>
                                </div>
                                <div class="filter-product-label">Xếp hạng của khách</div>
                                <div class="filter-product-rank-wrapper">
                                    <div class="filter-product-rank-radio">
                                        <input
                                                type="radio"
                                                id="rank-1"
                                                name="rank"
                                                value="any"
                                                checked
                                        />
                                        <label for="rank-1">Bất kỳ</label><br/>
                                    </div>
                                    <div class="filter-product-rank-radio">
                                        <input
                                                type="radio"
                                                id="rank-2"
                                                name="rank"
                                                value="over_4.5"
                                        />
                                        <label for="rank-2">Tuyệt vời 4.5 +</label><br/>
                                    </div>
                                    <div class="filter-product-rank-radio">
                                        <input
                                                type="radio"
                                                id="rank-3"
                                                name="rank"
                                                value="over_4"
                                        />
                                        <label for="rank-3">Rất tốt 4 +</label><br/>
                                    </div>
                                    <div class="filter-product-rank-radio">
                                        <input
                                                type="radio"
                                                id="rank-4"
                                                name="rank"
                                                value="over_3"
                                        />
                                        <label for="rank-4">Tốt 3 +</label><br/>
                                    </div>
                                </div>
                                <button class="filter-product-btn">Lưu</button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-9">
                    <div class="row">
                        <div class="list-product-container">
                            <div id="product-1" class="product-container">
                                <a href="${pageContext.request.contextPath}/user/view/detail_prod.jsp">
                                    <div class="row">
                                        <div class="col-4">
                                            <div class="product-container-img">
                                                <div class="product-img">
                                                    <img src="${pageContext.request.contextPath}/user/images/hotel.jpg" alt=""/>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-8">
                                            <div class="product-container-info">
                                                <div class="product-container-info-main">
                                                    <div class="product-info-header">
                                                        <h2>Khách sạn Banya Tree Lăng Cô</h2>
                                                    </div>
                                                    <div class="product-info-rank">
                                <span
                                        class="iconify product-info-rank__icon"
                                        data-icon="carbon:star-filled"
                                ></span>
                                                        <span
                                                                class="iconify product-info-rank__icon"
                                                                data-icon="carbon:star-filled"
                                                        ></span>
                                                        <span
                                                                class="iconify product-info-rank__icon"
                                                                data-icon="carbon:star-filled"
                                                        ></span>
                                                        <span
                                                                class="iconify product-info-rank__icon"
                                                                data-icon="carbon:star-filled"
                                                        ></span>
                                                        <span
                                                                class="iconify product-info-rank__icon"
                                                                data-icon="carbon:star-filled"
                                                        ></span>
                                                    </div>
                                                    <div class="product-info-location">
                                <span
                                        class="iconify product-info-location-icon"
                                        data-icon="ci:location"
                                ></span>
                                                        <span> Languna Lăng Cô </span>
                                                    </div>
                                                    <div class="product-info-room-type">
                                                        Phòng tại khách sạn
                                                    </div>
                                                    <div class="product-info-rate">
                                                        <strong>9/10</strong> Tuyệt vời
                                                        <span>(200 đánh giá)</span>
                                                    </div>
                                                </div>
                                                <div class="product-container-info-price">
                                                    <div class="product-info-price">
                                                        <div class="product-info-price-warapper">
                                                            <div class="product-info-price__old">
                                                                12.000.000 ₫
                                                            </div>
                                                            <div class="product-info-price__deal">
                                                                <span>-15%</span>
                                                            </div>
                                                        </div>
                                                        <div class="product-info-price__current">
                                                            10.000.000 ₫
                                                        </div>
                                                        <div class="product-info-price__sublabel">
                                                            Mỗi đêm
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- end body content -->

<!-- End main content -->

<script src="<c:url value="/user/js/main.js"/> "></script>
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
<!-- btn add sub -->
<script>
    // btn add sub
    $(".room-people__btn-adult-add").click(function (e) {
        let temp = parseInt(
            document.getElementById("room-people__count--adult").innerHTML
        );
        var quantity = parseInt(
            document.getElementById("room-people_btn").value
        );
        if (temp < 5) {
            temp = temp + 1;
            quantity = quantity +1;
            console.log(temp);
            console.log(quantity);
            document.getElementById("room-people__count--adult").innerHTML = temp;
            document.getElementById("room-people_btn").value =
                quantity + " Khách";
        }
    });
    $(".room-people__btn-adult-sub").click(function (e) {
        var quantity = parseInt(
            document.getElementById("room-people_btn").value
        );
        var temp = parseInt(
            document.getElementById("room-people__count--adult").innerHTML
        );
        if (temp > 1) {
            temp -= 1;
            quantity -= 1;
            document.getElementById("room-people__count--adult").innerHTML = temp;
            document.getElementById("room-people_btn").value =
                quantity + " Khách";
        }
    });
    $(".room-people__btn-child-add").click(function (e) {
        var temp = parseInt(
            document.getElementById("room-people__count--child").innerHTML
        );
        var quantity = parseInt(
            document.getElementById("room-people_btn").value
        );
        if (temp < 5) {
            temp += 1;
            quantity += 1;
            document.getElementById("room-people__count--child").innerHTML = temp;
            document.querySelector(".room-people-number-warning").className +=
                " active";
            document.querySelector(".room-people-age-child").className +=
                " active";
            document.getElementById("room-people_btn").value =
                quantity + " Khách";
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
            document.getElementById("room-people_btn").value =
                quantity + " Khách";
        }
    });
</script>
<script>

    $("html").click(function () {
        $(".location-search-select-list").removeClass("active");
    });

    $("#location-search").click(function (e) {
        e.stopPropagation();
    });

    $("#location-search").click(function (e) {
        $(".location-search-select-list").addClass("active");
    });


    // show room people

    $("html").click(function () {
        $(".room-people-number").removeClass("active");
    });

    $("#room-people").click(function (e) {
        e.stopPropagation();
    });

    $("#room-people").click(function (e) {
        $(".room-people-number").addClass("active");
    });


    $("html").click(function () {
        $(".nav-tablet").removeClass("active");
    });
    $("#header__nav-item-user").click(function (e) {
        e.stopPropagation();
    });
    $("#header__nav-item-user").click(function (e) {
        $(".nav-tablet").addClass("active");
    });


    // product sort
    $("html").click(function () {
        $(".product-sort-select-list").removeClass("active");
    });

    $("#product-sort").click(function (e) {
        e.stopPropagation();
    });

    $("#product-sort").click(function (e) {
        $(".product-sort-select-list").addClass("active");
    });

</script>
<!-- end btn add sub -->
</body>
</html>
