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
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <!-- CSS -->
    <link
            rel="stylesheet"
            href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"
    />
    <link
            rel="stylesheet"
            href="https://cdn.jsdelivr.net/npm/litepicker/dist/css/litepicker.css"
    />
    <script src="https://cdn.jsdelivr.net/npm/litepicker/dist/litepicker.js"></script>
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
                <div class="nav-menu">
                    <div class="header__nav-list ">
                        <div class=" header__nav-item-user">
                            <div id="header__nav-item-user" class="header__nav-item-user">
                                <div href="" class="header__nav-item-link">
                                    <span
                                            class="iconify header__nav-item-icon-bars"
                                            data-icon="bx:bx-menu"
                                            data-width="25"
                                            data-height="25"
                                    ></span>
                                    <span
                                            class="iconify header__nav-item-icon-user"
                                            data-icon="bx:bxs-user"
                                            data-width="25"
                                            data-height="25"
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
                                                    class="nav-tablet__item-link" style="display: block">Xin
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
                                               class="nav-tablet__item-link" style="display: block">Nh???t k??</a>
                                        </li>
                                        <li class="nav-tablet__item js-sign">
                                            <a href="${pageContext.request.contextPath}/login?action=logout"
                                               class="nav-tablet__item-link" style="display: block">????ng
                                                xu???t</a>
                                        </li>
                                    </c:if>
                                </ul>
                            </div>
                        </div>
                        </li>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>
<!-- end top nav -->
<!-- main content -->
<div class="container-main">
    <!-- image-container -->
    <div class="row">
        <div class="col-12">
            <div class="room-heading-container">
                <div class="room-heading">
                    <h2>${room.name}</h2>
                    <a href="#booking-box-container" class="room-heading-btn">
                        <div class="box-fill">?????t ph??ng ngay</div>
                    </a>
                </div>
                <div class="room-subheading">
              <span
                      class="iconify room-subheading--star"
                      data-icon="bx:bxs-star"></span>

                    <div class="room-rating">


                        <strong> ${room.rating}/5 </strong>
                        <a class="room-rating__count" href="#room-review-container">(${reviewCount} ????nh gi??)</a>
                    </div>

                    <span class="point-between">??</span>
                    <div class="room-addr">
                        <a href="" class="room-addr__city">${room.building.city.name}</a>
                    </div>
                </div>
            </div>
            <div class="box box-image">
                <div class="image-container">
                    <div class="row">
                        <div class="col-6 image__bigsize-wrapper">
                            <div class="image__bigsize">
                                <img src="${room.roomImage[0].name}"
                                />
                            </div>
                        </div>
                        <div class="col-6">
                            <div class="row">

                                <div class="col-6 image__small-wrapper">
                                    <div class="image-sub__smallsize">
                                        <img src="${room.roomImage[1].name}"
                                        />
                                    </div>
                                </div>


                                <div class="col-6 image__small-wrapper">
                                    <div class="image-sub__smallsize child_2">
                                        <img src="${room.roomImage[2].name}"
                                        />
                                    </div>
                                </div>

                            </div>
                            <div class="row">

                                <div class="col-6 image__small-wrapper">
                                    <div class="image-sub__smallsize">
                                        <img src="${room.roomImage[3].name}"
                                        />
                                    </div>
                                </div>

                                <div class="col-6 image__small-wrapper last-img">

                                    <div class="image-sub__smallsize">
                                        <img src="${room.roomImage[4].name}"/>
                                    </div>

                                    <div class="image-sub_smallsize--btn">
                        <span
                                class="iconify"
                                data-icon="ion:images-outline"
                        ></span>
                                        <span class="image--count">T???t c???</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-7 room-content">
            <div class="room-content-container">
                <div class="room-content__heading">
                    <h3>${room.roomType.name}. ${room.building.name}</h3>
                </div>
                <div class="room-content__sub-heading">
                    ${room.roomType.description} <br>
                    ?????a ch???: ${room.building.address} <br>
                    ${room.accomodatesCount} Kh??ch t???i ??a ?? ${room.bedCount} ph??ng ng??? ?? ${room.bathCount} ph??ng t???m
                </div>
                <div class="line-spacing"></div>
                <div class="room-content__amenities-container">
                    <div class="room-content__amenities-heading">
                        <h4>Ti???n nghi</h4>
                    </div>
                    <div class="room-content__amenities-wrapper">
                        <div class="row">
                            <div class="col-6">
                                <div class="amenities-wrapper">
                                    <span class="iconify" data-icon="bx:bx-wifi"></span>
                                    <span class="amenities-label">Mi???n ph?? wifi</span>
                                </div>
                                <div class="amenities-wrapper">
                      <span
                              class="iconify"
                              data-icon="ic:outline-local-laundry-service"
                      ></span>
                                    <span class="amenities-label">D???ch v??? gi???t l??</span>
                                </div>
                                <div class="amenities-wrapper">
                                    <span class="iconify" data-icon="bi:snow"></span>
                                    <span class="amenities-label">??i???u ho??</span>
                                </div>
                            </div>
                            <div class="col-6">
                                <div class="amenities-wrapper">
                      <span
                              class="iconify"
                              data-icon="ic:round-local-parking"
                      ></span>
                                    <span class="amenities-label">Mi???n ph?? n??i ?????u xe</span>
                                </div>
                                <div class="amenities-wrapper">
                      <span
                              class="iconify"
                              data-icon="mdi:hair-dryer-outline"
                      ></span>
                                    <span class="amenities-label">M??y s???y t??c</span>
                                </div>
                                <div class="amenities-wrapper">
                                    <span class="iconify" data-icon="mdi:room-service"></span>
                                    <span class="amenities-label">Ph???c v??? 24/7</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="line-spacing"></div>
                <div class="room-content__des">
                    <p style="white-space:pre-wrap">M?? t???: <br>${room.description}
                    </p>
                </div>
                <div class="line-spacing"></div>
                <div class="room-content__inroom-container">
                    <div class="room-content__inroom-heading">
                        <h4>Ph??ng c???a b???n</h4>
                    </div>
                    <div class="row room-content__inroom-items">
                        <div class="col-3 room-content__inroom-wrapper">
                            <div class="room-content__inroom-icons">
                    <span
                            class="iconify"
                            data-icon="icon-park-outline:double-bed"
                            data-width="35"
                            data-height="35"
                    ></span>
                                <div class="room-content__inroom-bed--heading">
                                    Ph??ng ng???
                                </div>
                                <div class="room-content__inroom-bed--type">
                                    1 gi?????ng queen
                                </div>
                            </div>
                        </div>
                        <div class="col-3 room-content__inroom-wrapper">
                            <div class="room-content__inroom-icons">
                    <span
                            class="iconify"
                            data-icon="bx:bx-area"
                            data-width="35"
                            data-height="35"
                    ></span>
                                <div class="room-content__inroom-area--heading">
                                    Di???n t??ch
                                </div>
                                <div class="room-content__inroom-area--count">
                                    ${room.area} m??t vu??ng
                                </div>
                            </div>
                        </div>
                        <div class="col-3 room-content__inroom-wrapper">
                            <div class="room-content__inroom-icons">
                    <span
                            class="iconify"
                            data-icon="healthicons:city"
                            data-width="35"
                            data-height="35"
                    ></span>
                                <div class="room-content__inroom-view--heading">
                                    Quang c???nh
                                </div>
                                <div class="room-content__inroom-view--type">Th??nh ph???</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-5 box-move">
            <form action="${pageContext.request.contextPath}/home/booking" method="post">
                <input type="hidden" name="reviewCount" value="${reviewCount}">
                <input type="hidden" name="idRoom" value="${room.id}">
                <input type="hidden" name="dateBlock" value="${dateBlock}">
                <div id="booking-box-container" class="box booking-box-container">
                    <div class="booking-box-heading">
                        <div class="booking-box-heading__price">
                            $<span id="room_price">${room.price}</span> /????m
                        </div>

                        <div class="booking-box-heading__rate">
                <span
                        class="iconify room-subheading--star"
                        data-icon="bx:bxs-star"
                ></span>
                            <div class="room-rating">
                                <strong> ${room.rating}/5 </strong>
                                <a class="room-rating__count" href="">(${reviewCount} ????nh gi??)</a>
                            </div>
                        </div>
                    </div>
                    <div class="alert alert-warning" id="warning-alert" style="display: none">
                        <button type="button" class="close" data-dismiss="alert">
                            x
                        </button>
                        <strong>Please fill all the blank </strong> to continue booking!
                    </div>

                    <div class="booking-box-info">
                        <div class="booking-box-date-container">
                            <div class="booking-box-date--checkin change-date">
                                <div class="booking-box-checkin-wrapper">
                                    <label
                                            for="booking-box-checkin"
                                            class="booking-box-checkin__label"
                                    >NH???N PH??NG</label
                                    >
                                    <input
                                            value="${checkInDate}"
                                            name="checkInDate"
                                            autocomplete="off"
                                            type="text"
                                            id="booking-box-checkin"
                                            class="booking-box-checkin__input"
                                            placeholder="Th??m ng??y"
                                            required
                                    />
                                </div>
                            </div>
                            <div class="booking-box-date--checkout change-date">
                                <div class="booking-box-checkout-wrapper">
                                    <label
                                            for="booking-box-checkout"
                                            class="booking-box-checkout__label"
                                    >TR??? PH??NG</label
                                    >
                                    <input
                                            name="checkOutDate"
                                            value="${checkOutDate}"
                                            autocomplete="off"
                                            type="text"
                                            id="booking-box-checkout"
                                            class="booking-box-checkout__input"
                                            placeholder="Th??m ng??y"
                                            required
                                    />
                                </div>
                            </div>
                        </div>
                        <div id="booking-box-guests" class="booking-box-guests-container">
                            <label
                                    class="booking-box-guests--label"
                                    for="booking-box-guests--input"
                            >KH??CH</label
                            >
                            <input
                                    name="quantityPeople"
                                    <c:if test="${quantityPeople == null}">
                                        value="1 Kh??ch"
                                    </c:if>
                                    <c:if test="${quantityPeople != null}">
                                        value="${quantityPeople} Kh??ch"
                                    </c:if>
                                    type="text"
                                    id="booking-box-guests--input"
                                    class="booking-box-guests--input"
                                    required
                                    readonly

                            />
                            <div class="booking-box-guests-number">
                                <div class="booking-box-guests-number-warning">
                                    Vui l??ng nh???p tu???i tr??? em.
                                </div>

                                <div class="booking-box-guests-number-wrapper">
                                    <div class="booking-box-guests__label">Ng?????i l???n</div>
                                    <div class="booking-box-guests__btn">
                                        <div class="booking-box-guests__btn-adult-sub">
                        <span
                                class="iconify booking-box-guests-icon"
                                data-icon="carbon:subtract-alt"
                        ></span>
                                        </div>
                                        <div
                                                id="booking-box-guests__count--adult"
                                                class="booking-box-guests__count--adult"
                                        >
                                            <c:if test="${quantityPeople == null}">
                                                1
                                            </c:if>
                                            <c:if test="${quantityPeople != null}">
                                                ${quantityPeople}
                                            </c:if>
                                        </div>
                                        <div class="booking-box-guests__btn-adult-add">
                        <span
                                class="iconify booking-box-guests-icon"
                                data-icon="fluent:add-circle-24-regular"
                        ></span>
                                        </div>
                                    </div>
                                </div>
                                <div class="booking-box-guests-number-wrapper">
                                    <div class="booking-box-guests__label">Tr??? em</div>
                                    <div class="booking-box-guests__btn">
                                        <div class="booking-box-guests__btn-child-sub">
                        <span
                                class="iconify booking-box-guests-icon"
                                data-icon="carbon:subtract-alt"
                        ></span>
                                        </div>
                                        <div
                                                id="booking-box-guests__count--child"
                                                class="booking-box-guests__count--child"
                                        >
                                            0
                                        </div>
                                        <div class="booking-box-guests__btn-child-add">
                        <span
                                class="iconify booking-box-guests-icon"
                                data-icon="fluent:add-circle-24-regular"
                        ></span>
                                        </div>
                                    </div>
                                </div>

                                <div class="booking-box-guests-number-wrapper__child">
                                    <select
                                            id="booking-box-guests-age-child"
                                            class="booking-box-guests-age-child"
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
                        </div>
                    </div>


                    <button id="booking-box-btn" class="booking-box-btn box-fill">?????t ph??ng</button>
                    <div class="booking-box-price-container">
                        <div class="booking-box-price-wrapper">
                            <div class="booking-box-price__label">
                                $<span id="booking-box-price__room-price">${room.price}</span>
                                x
                                <span id="booking-box-price__days">${totalDay}</span> ????m
                            </div>
                            <div class="booking-box-price__label">
                                $<span id="booking-box-price__room-price-total">${room.price*totalDay}</span>
                            </div>
                        </div>
                        <div class="booking-box-price-wrapper">
                            <div class="booking-box-price__label">
                  <span class="booking-box-price__fee-service"
                  >Ph?? d???ch v???</span
                  >
                            </div>
                            <div class="booking-box-price__label">
                                $<span id="booking-box-price__fee-service-total">5</span>
                            </div>
                        </div>
                        <div class="booking-box-price-wrapper__discount">
                            <div class="booking-box-price__label">
                                <span class="booking-box-price__discount">Gi???m gi??</span>
                            </div>
                            <div class="booking-box-price__label">
                                $<span id="booking-box-price__discount-total">-10</span>
                            </div>
                        </div>
                        <div class="line-spacing"></div>
                        <div class="booking-box-price-wrapper">
                            <div class="booking-box-price__label">
                                <span class="booking-box-price__total-label">T???ng</span>
                            </div>
                            <div class="booking-box-price__label">
                                $<span id="booking-box-price__total">${room.price*totalDay+5}</span>
                            </div>
                            <input
                                    id="total_money"
                                    name="totalPrice"
                                    disabled
                                    value="0"
                                    type="hidden"
                                    style="display: none"
                                    required
                            />
                        </div>
                    </div>
                </div>
            </form>
        </div>
        <div class="col-12">
            <div class="room-policies-container">
                <div class="row">
                    <div class="col-4">
                        <div class="room-policies-heading">Ch??nh s??ch kh??ch s???n</div>
                    </div>
                    <div class="col-8">
                        <div class="room-policies-wrapper">
                            <div class="room-policies-wrapper--item">
                                <div class="room-policies-wrapper__heading--checkin">
                                    Nh???n ph??ng
                                </div>
                                <div class="room-policies-wrapper__body--checkin">
                                    <ul>
                                        <li>
                                            Gi??? nh???n ph??ng <strong>t???: 14:00 ?????n n???a ????m</strong>
                                        </li>
                                        <li>
                                            Vi???c ????p ???ng y??u c???u nh???n ph??ng s???m t??y t??nh h??nh th???c
                                            t???
                                        </li>
                                        <li>Tu???i t???i thi???u ????? nh???n ph??ng: 18</li>
                                    </ul>
                                </div>
                            </div>
                            <div class="room-policies-wrapper--item">
                                <div class="room-policies-wrapper__heading--checkout">
                                    Tr??? ph??ng
                                </div>
                                <div class="room-policies-wrapper__body--checkout">
                                    <ul>
                                        <li>Tr??? ph??ng <strong>tr?????c 11:00</strong></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="room-policies-wrapper">
                            <div class="room-policies-wrapper--item">
                                <div class="room-policies-wrapper__heading--general">
                                    Ch??nh s??ch chung
                                </div>
                                <div class="room-policies-wrapper__body--general">
                                    <ul>
                                        <li>Kh??ng cho ph??p h??t thu???c</li>
                                        <li>Kh??ng cho ph??p th?? c??ng</li>
                                        <li>Kh??ng cho ph??p t??? ch???c ti???c / s??? ki???n</li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="room-policies-wrapper">
                            <div class="room-policies-wrapper--item">
                                <div class="room-policies-wrapper__heading--child">
                                    Ch??nh s??ch tr??? em
                                </div>
                                <div class="room-policies-wrapper__body--child">
                                    <ul>
                                        <li>Kh??ch l???n h??n 12 tu???i s??? ???????c xem nh?? ng?????i l???n</li>
                                        <li>Tr??? em d?????i 6 tu???i c?? th??? l??u tr?? mi???n ph??</li>
                                        <li>
                                            Tr??? em ??? c??c tu???i c??n l???i l??u tr?? c?? th??? m???t ph??
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-12">
            <div id="room-review-container" class="room-review-container">
                <div class="row">
                    <div class="col-4 room-review-wrapper">
                        <div class="room-review-average-score-wrapper">
                            <div class="room-review-average-score">
                                <span id="avg_score"></span> /5
                                <span id="review_quantity">${reviewCount} l?????t ????nh gi??</span>
                            </div>
                        </div>
                        <div class="room-review-average-score-bar-container">
                            <div class="room-review-average-score-bar-wrapper">
                                <div class="room-review-average-score-bar__label">
                                    Xu???t s???c
                                </div>
                                <div class="room-review-average-score-bar__background">
                                    <div
                                            id="room-review-average-score-bar__1"
                                            class="room-review-average-score-bar"
                                    ></div>
                                </div>
                            </div>
                            <div class="room-review-average-score-bar-wrapper">
                                <div class="room-review-average-score-bar__label">T???t</div>
                                <div class="room-review-average-score-bar__background">
                                    <div
                                            id="room-review-average-score-bar__2"
                                            class="room-review-average-score-bar"
                                    ></div>
                                </div>
                            </div>
                            <div class="room-review-average-score-bar-wrapper">
                                <div class="room-review-average-score-bar__label">Kh??</div>
                                <div class="room-review-average-score-bar__background">
                                    <div
                                            id="room-review-average-score-bar__3"
                                            class="room-review-average-score-bar"
                                    ></div>
                                </div>
                            </div>
                            <div class="room-review-average-score-bar-wrapper">
                                <div class="room-review-average-score-bar__label">
                                    Trung b??nh
                                </div>
                                <div class="room-review-average-score-bar__background">
                                    <div
                                            id="room-review-average-score-bar__4"
                                            class="room-review-average-score-bar"
                                    ></div>
                                </div>
                            </div>
                            <div class="room-review-average-score-bar-wrapper">
                                <div class="room-review-average-score-bar__label">K??m</div>
                                <div class="room-review-average-score-bar__background">
                                    <div
                                            id="room-review-average-score-bar__5"
                                            class="room-review-average-score-bar"
                                    ></div>
                                </div>
                            </div>
                        </div>
                        <div class="room-review-btn-edit">????nh gi?? ngay</div>
                    </div>

                    <div class="col-8 room-review-wrapper">
                        <div class="room-review-comment-container">
                            <c:forEach items="${reviews}" var="review">
                                <div id="review-1" class="room-review-comment-wrapper">
                                    <div class="room-review-comment-block__info">
                                        <div class="room-review-comment-block__info-name">
                                                ${review.user.firstName}
                                        </div>
                                        <div class="room-review-comment-block__info-date">
                                            <span class="iconify" data-icon="la:pen"></span>
                                                ${review.cmtDate}
                                        </div>
                                    </div>
                                    <div class="room-review-comment-block__main-comment">
                                        <div class="room-review-comment-block__main-comment-body">
                                                ${review.comment}
                                        </div>
                                    </div>
                                    <div class="room-review-comment-block__score">
                      <span class="room-review-comment-block__score-total"
                      >${review.rate}</span
                      >
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                        <div
                                id="room-review-edit-container"
                                class="room-review-edit-container"
                        >
                            <form action="${pageContext.request.contextPath}/review" method="get">
                                <input type="hidden" name="reviewCount" value="${reviewCount}">
                                <input type="hidden" name="email" value="${sessionScope.user.email}">
                                <input type="hidden" name="idRoom" value="${room.id}">
                                <div class="room-review-edit-wrapper">
                                    <div class="room-review-comment-block__info">
                                        <div class="room-review-comment-block__info-name">
                                            ${sessionScope.user.firstName}
                                        </div>
                                        <div class="room-review-comment-block__info-date">
                                            <span class="iconify" data-icon="la:pen"></span>
                                            <%= new Date().toString()%>
                                        </div>
                                    </div>
                                    <div class="room-review-edit-block__main-comment">
                                        <div class="room-review-comment-block__main-comment-heading">
                                        </div>
                                        <div class="room-review-comment-block__main-comment-body">
                                    <textarea
                                            name="comment"
                                            id="room-review-write-review__body"
                                            cols="65"
                                            rows="4"></textarea>
                                        </div>
                                        <div class="room-review-edit-btn-wrapper">
                                            <div class="room-review-cancel-edit-btn">H???y</div>
                                            <button class="room-review-edit-btn">????nh gi??</button>
                                        </div>
                                    </div>
                                    <div class="room-review-edit-block__score">
                                        <input name="score" id="score-5" type="radio" value="5" checked/>
                                        <label class="label__score" for="score-5"
                                        >5
                                            <span
                                                    style="color: #ee6c4d"
                                                    class="iconify"
                                                    data-icon="bi:star-fill"
                                            ></span>
                                        </label>
                                        <br/>
                                        <input name="score" id="score-4" type="radio" value="4"/>
                                        <label class="label__score" for="score-4"
                                        >4
                                            <span
                                                    style="color: #ee6c4d"
                                                    class="iconify"
                                                    data-icon="bi:star-fill"
                                            ></span>
                                        </label>
                                        <br/>
                                        <input name="score" id="score-3" type="radio" value="3"/>
                                        <label class="label__score" for="score-3"
                                        >3
                                            <span
                                                    style="color: #ee6c4d"
                                                    class="iconify"
                                                    data-icon="bi:star-fill"
                                            ></span>
                                        </label>
                                        <br/>
                                        <input name="score" id="score-2" type="radio" value="2"/>
                                        <label class="label__score" for="score-2"
                                        >2
                                            <span
                                                    style="color: #ee6c4d"
                                                    class="iconify"
                                                    data-icon="bi:star-fill"
                                            ></span>
                                        </label>
                                        <br/>
                                        <input name="score" id="score-1" type="radio" value="1"/>
                                        <label class="label__score" for="score-1"
                                        >1
                                            <span
                                                    style="color: #ee6c4d"
                                                    class="iconify"
                                                    data-icon="bi:star-fill"
                                            ></span>
                                        </label>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-12">

            </div>
        </div>
    </div>
    <!-- end image container -->
</div>

<!-- overlay image -->
<div id="more_image" class="modal">
    <div class="modal-body-container">
        <header class="modal-body-btn-back">
            <span class="iconify" data-icon="akar-icons:chevron-left"></span>
        </header>
        <div class="modal-body-wrapper">
            <div class="modal-body-wrapper__container-image">
                <div id="myCarousel" class="carousel slide" data-ride="carousel">
                    <!-- Wrapper for slides -->
                    <div class="carousel-inner">
                        <div class="item active">
                            <img
                                    src="${room.roomImage[0].name}"
                                    style="width: 100%"
                            />
                        </div>
                        <c:forEach var="img" items="${room.roomImage}" begin="1">
                            <div class="item">
                                <img
                                        src="${img.name}"
                                        style="width: 100%"
                                />
                            </div>
                        </c:forEach>
                    </div>

                    <!-- Left and right controls -->
                    <a
                            class="left carousel-control"
                            href="#myCarousel"
                            data-slide="prev"
                    >
                        <span class="glyphicon glyphicon-chevron-left"></span>
                        <span class="sr-only">Previous</span>
                    </a>
                    <a
                            class="right carousel-control"
                            href="#myCarousel"
                            data-slide="next"
                    >
                        <span class="glyphicon glyphicon-chevron-right"></span>
                        <span class="sr-only">Next</span>
                    </a>
                </div>
            </div>
        </div>
    </div>
</div>


<!-- eend overlay image -->
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
<%--end footer--%>
<!-- end main content -->
<script src="<c:url value="/user/js/main.js"/> "></script>
<script src="<c:url value="/user/js/detail_prod.js"/> "></script>
<script src="<c:url value="/user/node_modules/moment/moment.js"/> "></script>
<script>
    $("#booking-box-btn").click(function (e) {
        if (parseInt(document.getElementById("booking-box-guests--input").value) === 0
            || document.getElementById("booking-box-checkin").value === ''
            || document.getElementById("booking-box-checkout").value == ''
        ) {
            document.getElementById("warning-alert").style.display = "block"
            $("#warning-alert").fadeTo(2000, 500).slideUp(500, function () {
                $("#warning-alert").slideUp(500);
            });

        } else {
            document.getElementById("booking-box-btn").href = '${pageContext.request.contextPath}/view/booking.jsp';
        }
    })

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
    $("html").click(function (e) {
        $(".booking-box-guests-number").removeClass("active");
        $(".booking-box-guests-number-warning").removeClass("active");
        $(".booking-box-guests-age-child").removeClass("active");

    });

    $("#booking-box-guests").click(function (e) {
        e.stopPropagation();
    });

    $("#booking-box-guests").click(function (e) {
        $(".booking-box-guests-number").addClass("active");
        if (parseInt(
            document.getElementById("booking-box-guests__count--child").innerHTML
        ) != 0) {
            $(".booking-box-guests-number").addClass("active");
            $(".booking-box-guests-number-warning").addClass("active");
            $(".booking-box-guests-age-child").addClass("active");
        }
    });
</script>
<script>

    // btn add sub
    <%--<var maxPeople = 1;         //${room.accomodatesCount}&ndash;%&gt;--%>
    var maxPeople = ${room.accomodatesCount};

    <c:if test="${quantityPeople == null}">
        var maxPeopleChild = maxPeople - 1;
    </c:if>
    <c:if test="${quantityPeople != null}">
        var maxPeopleChild = maxPeople - ${quantityPeople};
    </c:if>
    $(".booking-box-guests__btn-adult-add").click(function (e) {
        var temp = parseInt(
            document.getElementById("booking-box-guests__count--adult").innerHTML
        );
        var quantity = parseInt(
            document.getElementById("booking-box-guests--input").value
        );

        if (temp < maxPeople) {
            temp += 1;
            quantity += 1;
            document.getElementById(
                "booking-box-guests__count--adult"
            ).innerHTML = temp;
            document.getElementById("booking-box-guests--input").value =
                quantity + " Kh??ch";
            maxPeopleChild -= 1;
        }
    });
    $(".booking-box-guests__btn-adult-sub").click(function (e) {
        if (
            parseInt(
                document.getElementById("booking-box-guests__count--child").innerHTML
            ) >= 1 && parseInt(
                document.getElementById("booking-box-guests__count--adult").innerHTML
            ) === 1
        ) {
            return 0;
        }
        var quantity = parseInt(
            document.getElementById("booking-box-guests--input").value
        );
        var temp = parseInt(
            document.getElementById("booking-box-guests__count--adult").innerHTML
        );
        if (temp > 0) {
            temp -= 1;
            quantity -= 1;
            document.getElementById(
                "booking-box-guests__count--adult"
            ).innerHTML = temp;
            document.getElementById("booking-box-guests--input").value =
                quantity + " Kh??ch";
            maxPeopleChild += 1;
        }
    });
    $(".booking-box-guests__btn-child-add").click(function (e) {
        if (
            parseInt(
                document.getElementById("booking-box-guests__count--adult").innerHTML
            ) === 0
        ) {
            return 0;
        }
        var temp = parseInt(
            document.getElementById("booking-box-guests__count--child").innerHTML
        );
        var quantity = parseInt(
            document.getElementById("booking-box-guests--input").value
        );
        if (temp < maxPeopleChild) {
            temp += 1;
            quantity += 1;
            document.getElementById(
                "booking-box-guests__count--child"
            ).innerHTML = temp;
            document.querySelector(
                ".booking-box-guests-number-warning"
            ).className += " active";
            document.querySelector(".booking-box-guests-age-child").className +=
                " active";
            document.getElementById("booking-box-guests--input").value =
                quantity + " Kh??ch";
            maxPeople -= 1;
        }
    });
    $(".booking-box-guests__btn-child-sub").click(function (e) {
        var temp = parseInt(
            document.getElementById("booking-box-guests__count--child").innerHTML
        );
        var quantity = parseInt(
            document.getElementById("booking-box-guests--input").value
        );
        if (temp > 0) {
            temp -= 1;
            quantity -= 1;
            document.getElementById(
                "booking-box-guests__count--child"
            ).innerHTML = temp;
            document.querySelector(
                ".booking-box-guests-number-warning"
            ).className = document
                .querySelector(".booking-box-guests-number-warning")
                .className.replace(" active", "");
            document.querySelector(".booking-box-guests-age-child").className =
                document
                    .querySelector(".booking-box-guests-age-child")
                    .className.replace(" active", "");
            document.getElementById("booking-box-guests--input").value =
                quantity + " Kh??ch";
            maxPeople += 1;
        }
    });
    // end
</script>
<script>
    var format = "DD-MM-YYYY";
    var today = moment();
    today.subtract(1, "days").format(format);
    const disallowedDates = [["2001-01-01", today], <c:forEach var="date" items="${dateBlock}" >
        ${date},
        </c:forEach>]
    var picker = new Litepicker({
        element: document.getElementById("booking-box-checkin"),
        elementEnd: document.getElementById("booking-box-checkout"),
        singleMode: false,
        autoApply: false,
        numberOfColumns: 2,
        numberOfMonths: 2,
        format: "DD/MM/YYYY",
        lockDays: disallowedDates,
        tooltipText: {
            one: "night",
            other: "nights",
        },
        tooltipNumber: (totalDays) => {
            return totalDays - 1;
        },
    });

    $(".change-date").click(function (e) {
        picker.show();

        picker.on("selected", (date1, date2) => {
            const oneDay = 1000 * 60 * 60 * 24;
            const diffInTime = date2.getTime() - date1.getTime();
            const diffInDays = Math.round(diffInTime / oneDay);
            document.getElementById("booking-box-price__days").innerHTML =
                diffInDays;
            var price_room = parseFloat(
                document.getElementById("room_price").innerHTML
            );
            var fee = parseFloat(
                document.getElementById("booking-box-price__fee-service-total")
                    .innerHTML
            );
            document.getElementById(
                "booking-box-price__room-price-total"
            ).innerHTML = price_room * diffInDays;
            document.getElementById("booking-box-price__total").innerHTML =
                price_room * diffInDays + fee;

            document.getElementById("total_money").value =
                price_room * diffInDays + fee;
        });
    });
</script>

</body>
</html>
