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
    <link rel="icon" type="image/png" href="<c:url value="/user/images/favicon-16x16.png" />" sizes="16x16">
    <link rel="icon" type="image/png" href="<c:url value="/user/images/favicon-32x32.png" />" sizes="32x32">
    <link rel="stylesheet" href="<c:url value="/user/styles/root.css"/> "/>
    <link rel="stylesheet" href="<c:url value="/user/styles/grid.css"/> "/>
    <link rel="stylesheet" href="<c:url value="/user/styles/main.css"/> "/>
</head>

<body>

<!-- top nav -->
<div class="top-nav">
    <div class="container-main">
        <div class="nav-bar">
            <div class="nav-content">
                <a href="${pageContext.request.contextPath}/home" class="logo">Travel Booking</a>
                <div class="header__nav-list">
                    <div class="header__nav-item-user">
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
                                                class="nav-tablet__item-link" style="display: block">Xin
                                            chào ${sessionScope.user.firstName}</a>
                                    </li>
                                    <li class="nav-tablet__item">
                                        <a href="${pageContext.request.contextPath}/home/user?action=load"
                                           class="nav-tablet__item-link">
                                            Cài đặt tài khoản
                                        </a>
                                    </li>
                                    <li class="nav-tablet__item js-sign">
                                        <a href="${pageContext.request.contextPath}/home/history"
                                           class="nav-tablet__item-link" style="display: block">Nhật ký</a>
                                    </li>
                                    <li class="nav-tablet__item js-sign">
                                        <a href="${pageContext.request.contextPath}/login?action=logout"
                                           class="nav-tablet__item-link" style="display: block">Đăng
                                            xuất</a>
                                    </li>
                                </c:if>
                            </ul>
                        </div>
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
    <form action="${pageContext.request.contextPath}/home/rooms" method="get">
        <input type="hidden" name="action" value="search">
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
                                    value="${destination}"
                                    required
                            />
                        </div>

                    </div>
                </div>
            </div>
            <div class="col-2 col-md-2 col-sm-6">
                <div class="date-picker">
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
                                required
                                name="checkInDate"
                                placeholder="DD/MM/YYYY"
                                readonly
                                class="date-picker-input-date"
                                type="text"
                                id="check_in"
                                value="${checkInDate}"
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
                                name="checkOutDate"
                                value="${checkOutDate}"
                                placeholder="DD/MM/YYYY"
                                class="date-picker-input-date"
                                type="text"
                                id="check_out"
                                readonly
                                required
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
                                    name="quantityPeople"
                                    required
                                    readonly
                                    type="text"
                                    <c:if test="${quantityPeople == null}">
                                        value="0 Khách"
                                    </c:if>
                                    <c:if test="${quantityPeople != null}">
                                        value="${quantityPeople} Khách"
                                    </c:if>
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
                    </div>
                </div>
            </div>
            <div class="col-1 col-md-1 col-sm-12">
                <button class="box-fill btn-search box-outline">
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
                            <form action="${pageContext.request.contextPath}/home/rooms" method="get">
                                <input type="hidden" name="action" value="filter">

                                <div class="filter-product-header">Bộ lọc</div>

                                <div class="filter-product-label">Sắp xếp theo</div>
                                <div class="filter-product-sort-wrapper">
                                    <input type="radio" name="sortByPrice" id="sort-1" value="low_to_high"/>
                                    <label for="sort-1">Sắp xếp giá tăng dần</label><br/>
                                    <input type="radio" name="sortByPrice" id="sort-2" value="high_to_low"/>
                                    <label for="sort-1">Sắp xếp giá giãm dần</label><br/>
                                </div>
                                <div class="filter-product-label">Loại phòng</div>
                                <div class="filter-product-room-type-wrapper">
                                    <input name="roomType" type="checkbox" id="type-1" value="Phòng riêng"/>
                                    <label for="type-1">Phòng riêng</label><br/>
                                    <input name="roomType" type="checkbox" id="type-2" value="Phòng nguyên căn"/>
                                    <label for="type-2">Phòng nguyên căn</label><br/>
                                    <input name="roomType" type="checkbox" id="type-3" value="Phòng khách sạn"/>
                                    <label for="type-3">Phòng khách sạn</label><br/>
                                    <input name="roomType" type="checkbox" id="type-4" value="Homestay"/>
                                    <label for="type-4">Homestay</label><br/>
                                </div>
                                <div class="filter-product-label">Xếp hạng sao</div>
                                <div class="filter-product-star-wrapper">
                                    <div class="filter-product-star-wrapper-input">
                                        <input name="star" type="checkbox" id="star-1" value="1"/>
                                        <label class="star-label-input" for="star-1"
                                        ><span class="star-wrapper"> 1★ </span>
                                        </label>
                                    </div>
                                    <div class="filter-product-star-wrapper-input">
                                        <input name="star" type="checkbox" id="star-2" value="2"/>
                                        <label class="star-label-input" for="star-2"
                                        ><span class="star-wrapper"> 2★ </span>
                                        </label>
                                    </div>
                                    <div class="filter-product-star-wrapper-input">
                                        <input name="star" type="checkbox" id="star-3" value="3"/>
                                        <label class="star-label-input" for="star-3"
                                        ><span class="star-wrapper"> 3★ </span>
                                        </label>
                                    </div>
                                    <div class="filter-product-star-wrapper-input">
                                        <input name="star" type="checkbox" id="star-4" value="4"/>
                                        <label class="star-label-input" for="star-4"
                                        ><span class="star-wrapper"> 4★ </span>
                                        </label>
                                    </div>
                                    <div class="filter-product-star-wrapper-input">
                                        <input name="star" type="checkbox" id="star-5" value="5"/>
                                        <label class="star-label-input" for="star-5"
                                        ><span class="star-wrapper"> 5★ </span>
                                        </label>
                                    </div>
                                </div>
                                <div class="filter-product-label">Ngân sách</div>
                                <div class="filter-product-budget-wrapper">
                                    <input name="rangePrice" type="radio" id="budget-1" value="under_20"/>
                                    <label for="budget-1">Dưới 20$</label><br/>
                                    <input name="rangePrice" type="radio" id="budget-2" value="20_to_50"/>
                                    <label for="budget-2">20$ đến 50$</label
                                    ><br/>
                                    <input name="rangePrice" type="radio" id="budget-3" value="50_to_100"/>
                                    <label for="budget-3">50$ đến 100$</label
                                    ><br/>
                                    <input name="rangePrice" type="radio" id="budget-4" value="100_to_200"/>
                                    <label for="budget-4">100$ đến 200$</label
                                    ><br/>
                                    <input name="rangePrice" type="radio" id="budget-5" value="over_200"/>
                                    <label for="budget-5">Hơn 200$</label><br/>
                                </div>
                                <button class="filter-product-btn">Lưu</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-9">
                <div class="row">
                    <div class="list-product-container">
                        <c:forEach var="room" items="${rooms}">
                            <div class="product-container">
                                <a href="${pageContext.request.contextPath}/home/room-detail?idRoom=${room.id}">
                                    <div class="row">
                                        <div class="col-4">
                                            <div class="product-container-img">
                                                <div class="product-img">
                                                    <img src="${pageContext.request.contextPath}/images/${room.roomImage[0].name}"
                                                         alt=""/>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-8">
                                            <div class="product-container-info">
                                                <div class="product-container-info-main">
                                                    <div class="product-info-header">
                                                        <h2>${room.name}</h2>
                                                    </div>

                                                    <div class="product-info-location">
                                <span
                                        class="iconify product-info-location-icon"
                                        data-icon="ci:location"
                                ></span>
                                                        <span> ${room.building.name} </span>
                                                    </div>
                                                    <div class="product-info-room-type">
                                                            ${room.roomType.name}
                                                    </div>
                                                    <div class="product-info-rate">
                                                        <strong><span
                                                                class="iconify product-info-rank__icon"
                                                                data-icon="carbon:star-filled"
                                                        ></span>${room.rating}/5</strong>

                                                    </div>
                                                </div>
                                                <div class="product-container-info-price">
                                                    <div class="product-info-price">

                                                        <div class="product-info-price__current">
                                                            $${room.price}
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
                        </c:forEach>

                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- end body content -->

<!-- End main content -->
<%--footer--%>
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
<%--end footer--%>


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
    let maxPeople = 5;

    $(".room-people__btn-adult-add").click(function (e) {
        let temp = parseInt(
            document.getElementById("room-people__count--adult").innerHTML
        );
        var quantity = parseInt(
            document.getElementById("room-people_btn").value
        );
        if (temp < maxPeople) {
            temp = temp + 1;
            quantity = quantity + 1;
            console.log(temp);
            console.log(quantity);
            document.getElementById("room-people__count--adult").innerHTML = temp;
            document.getElementById("room-people_btn").value =
                quantity + " Khách";
        }
    });
    $(".room-people__btn-adult-sub").click(function (e) {
        if (
            parseInt(
                document.getElementById("room-people__count--child").innerHTML
            ) >= 1 && parseInt(
                document.getElementById("room-people__count--adult").innerHTML
            )===1
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
            document.getElementById("room-people_btn").value =
                quantity + " Khách";
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
        if (temp < maxPeople) {
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
        $(".nav-tablet").removeClass("active");
    });
    $("#header__nav-item-user").click(function (e) {
        e.stopPropagation();
    });
    $("#header__nav-item-user").click(function (e) {
        $(".nav-tablet").addClass("active");
    });

</script>
<!-- end btn add sub -->
</body>
</html>
