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
    <link rel="stylesheet" href="<c:url value="/user/styles/index.css" />"/>
    <link rel="stylesheet" href="<c:url value="/user/styles/index_base.css" />"/>
    <link rel="stylesheet" href="<c:url value="/user/styles/root.css"/> "/>
    <link rel="stylesheet" href="<c:url value="/user/styles/grid.css"/> "/>
    <link rel="stylesheet" href="<c:url value="/user/styles/main.css"/> "/>
</head>

<body>
<!-- top nav -->
<div class="top-nav">
    <div class="container-main">
        <div class="nav">
            <div class="nav-content">
                <a href="${pageContext.request.contextPath}/home" class="logo">Travel Booking</a>
                <div class="nav-menu">
                    <ul class="header__nav-list header__nav-list--hover" >
                        <li class="header__nav-item header__nav-item-user" style="border: 1px solid #AEB6BF;">
                            <input
                                    type="checkbox"
                                    class="nav-input"
                                    id="nav-input-tablet"
                            />

                            <label for="nav-input-tablet" class="nav-tablet">
                                <ul class="nav-tablet__list">
                                    <c:if test="${sessionScope.user == null}">
                                        <li class="nav-tablet__item js-sign">
                                            <a href="${pageContext.request.contextPath}/user/view/login.jsp"
                                               class="nav-tablet__item-link" style="display: block">Đăng ký</a>
                                        </li>
                                        <li class="nav-tablet__item js-sign">
                                            <a href="${pageContext.request.contextPath}/user/view/login.jsp"
                                               class="nav-tablet__item-link" style="display: block">Đăng nhập</a>
                                        </li>
                                    </c:if>
                                    <c:if test="${sessionScope.user != null}">
                                        <li class="nav-tablet__item js-sign">
                                            <a href="${pageContext.request.contextPath}/user/view/login.jsp"
                                               class="nav-tablet__item-link"  style="display: block">Xin
                                                chào ${sessionScope.user.firstName}</a>
                                        </li>
                                        <li class="nav-tablet__item js-sign">
                                            <a href="${pageContext.request.contextPath}/user/view/login.jsp"
                                               class="nav-tablet__item-link" style="display: block">Nhật ký</a>
                                        </li>
                                        <li class="nav-tablet__item js-sign">
                                            <a href="${pageContext.request.contextPath}/login?action=logout"
                                               class="nav-tablet__item-link" style="display: block">Đăng xuất</a>
                                        </li>
                                    </c:if>
                                </ul>
                            </label>
                            <a href="" class="header__nav-item-link">
                                <label for="nav-input-tablet" class="nav__bars-btn">
                      <span
                              class="iconify header__nav-item-icon-bars"
                              data-icon="bx:bx-menu"
                      ></span>
                                </label>
                                <label for="nav-input-tablet">
                      <span
                              class="iconify header__nav-item-icon-user"
                              data-icon="bx:bxs-user"
                      ></span>
                                </label>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
            <div id="nav-mode" class="nav-mode">
                <span href="" class="nav-mode__btn-hotel active">Khách sạn</span>
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
                        <div class="box-fill">Đặt phòng ngay</div>
                    </a>
                </div>
                <div class="room-subheading">
              <span
                      class="iconify room-subheading--star"
                      data-icon="bx:bxs-star"></span>

                    <div class="room-rating">


                        <strong> ${room.rating}/5 </strong>
                        <a class="room-rating__count" href="#room-review-container">(${reviewCount} đánh giá)</a>
                    </div>

                    <span class="point-between">·</span>
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
                                <img src="${pageContext.request.contextPath}/images/${room.roomImage[0].name}"
                                />
                            </div>
                        </div>
                        <div class="col-6">
                            <div class="row">

                                <div class="col-6 image__small-wrapper">
                                    <div class="image-sub__smallsize">
                                        <img src="${pageContext.request.contextPath}/images/${room.roomImage[1].name}"
                                        />
                                    </div>
                                </div>


                                <div class="col-6 image__small-wrapper">
                                    <div class="image-sub__smallsize child_2">
                                        <img src="${pageContext.request.contextPath}/images/${room.roomImage[2].name}"
                                        />
                                    </div>
                                </div>

                            </div>
                            <div class="row">

                                <div class="col-6 image__small-wrapper">
                                    <div class="image-sub__smallsize">
                                        <img src="${pageContext.request.contextPath}/images/${room.roomImage[3].name}"
                                        />
                                    </div>
                                </div>

                                <div class="col-6 image__small-wrapper last-img">

                                    <div class="image-sub__smallsize">
                                        <img src="${pageContext.request.contextPath}/images/${room.roomImage[4].name}"/>
                                    </div>

                                    <div class="image-sub_smallsize--btn">
                        <span
                                class="iconify"
                                data-icon="ion:images-outline"
                        ></span>
                                        <span class="image--count">Tất cả</span>
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
                    ${room.accomodatesCount} Khách · ${room.bedCount} phòng ngủ · ${room.bathCount} phòng tắm
                </div>
                <div class="line-spacing"></div>
                <div class="room-content__amenities-container">
                    <div class="room-content__amenities-heading">
                        <h4>Tiện nghi</h4>
                    </div>
                    <div class="room-content__amenities-wrapper">
                        <div class="row">
                            <div class="col-6">
                                <div class="amenities-wrapper">
                                    <span class="iconify" data-icon="bx:bx-wifi"></span>
                                    <span class="amenities-label">Miễn phí wifi</span>
                                </div>
                                <div class="amenities-wrapper">
                      <span
                              class="iconify"
                              data-icon="ic:outline-local-laundry-service"
                      ></span>
                                    <span class="amenities-label">Dịch vụ giặt là</span>
                                </div>
                                <div class="amenities-wrapper">
                                    <span class="iconify" data-icon="bi:snow"></span>
                                    <span class="amenities-label">Điều hoà</span>
                                </div>
                            </div>
                            <div class="col-6">
                                <div class="amenities-wrapper">
                      <span
                              class="iconify"
                              data-icon="ic:round-local-parking"
                      ></span>
                                    <span class="amenities-label">Miễn phí nơi đậu xe</span>
                                </div>
                                <div class="amenities-wrapper">
                      <span
                              class="iconify"
                              data-icon="mdi:hair-dryer-outline"
                      ></span>
                                    <span class="amenities-label">Máy sấy tóc</span>
                                </div>
                                <div class="amenities-wrapper">
                                    <span class="iconify" data-icon="mdi:room-service"></span>
                                    <span class="amenities-label">Phục vụ 24/7</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="line-spacing"></div>
                <div class="room-content__des">
                    <p>
                        ${room.description}
                    </p>
                </div>
                <div class="line-spacing"></div>
                <div class="room-content__inroom-container">
                    <div class="room-content__inroom-heading">
                        <h4>Phòng của bạn</h4>
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
                                    Phòng ngủ
                                </div>
                                <div class="room-content__inroom-bed--type">
                                    1 giường queen
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
                                    Diện tích
                                </div>
                                <div class="room-content__inroom-area--count">
                                    ${room.area} mét vuông
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
                                    Quang cảnh
                                </div>
                                <div class="room-content__inroom-view--type">Thành phố</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-5 box-move">
            <div id="booking-box-container" class="box booking-box-container">
                <div class="booking-box-heading">
                    <div class="booking-box-heading__price">
                        $<span id="room_price">${room.price}</span> /đêm
                    </div>

                    <div class="booking-box-heading__rate">
                <span
                        class="iconify room-subheading--star"
                        data-icon="bx:bxs-star"
                ></span>
                        <div class="room-rating">
                            <strong> ${room.rating}/5 </strong>
                            <a class="room-rating__count" href="">(${reviewCount} đánh giá)</a>
                        </div>
                    </div>
                </div>
                <div class="booking-box-info">
                    <div class="booking-box-date-container">
                        <div class="booking-box-date--checkin change-date">
                            <div class="booking-box-checkin-wrapper">
                                <label
                                        for="booking-box-checkin"
                                        class="booking-box-checkin__label"
                                >NHẬN PHÒNG</label
                                >
                                <input
                                        value="${checkInDate}"
                                        name="checkInDate"
                                        readonly
                                        type="text"
                                        id="booking-box-checkin"
                                        class="booking-box-checkin__input"
                                        placeholder="Thêm ngày"
                                />
                            </div>
                        </div>
                        <div class="booking-box-date--checkout change-date">
                            <div class="booking-box-checkout-wrapper">
                                <label
                                        for="booking-box-checkout"
                                        class="booking-box-checkout__label"
                                >TRẢ PHÒNG</label
                                >
                                <input
                                        name="checkOutDate"
                                        value="${checkOutDate}"
                                        readonly
                                        type="text"
                                        id="booking-box-checkout"
                                        class="booking-box-checkout__input"
                                        placeholder="Thêm ngày"
                                />
                            </div>
                        </div>
                    </div>
                    <div id="booking-box-guests" class="booking-box-guests-container">
                        <label
                                class="booking-box-guests--label"
                                for="booking-box-guests--input"
                        >KHÁCH</label
                        >
                        <input
                                name="quantityPeople"
                                <c:if test="${quantityPeople == null}">
                                    value="1 Khách"
                                </c:if>
                                <c:if test="${quantityPeople != null}">
                                    value="${quantityPeople} Khách"
                                </c:if>
                                type="text"
                                id="booking-box-guests--input"
                                class="booking-box-guests--input"
                                disabled
                        />
                        <div class="booking-box-guests-number">
                            <div class="booking-box-guests-number-warning">
                                Vui lòng nhập tuổi trẻ em.
                            </div>

                            <div class="booking-box-guests-number-wrapper">
                                <div class="booking-box-guests__label">Người lớn</div>
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
                                        1
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
                                <div class="booking-box-guests__label">Trẻ em</div>
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
                                        name="booking-child-age"
                                        id="booking-box-guests-age-child"
                                        class="booking-box-guests-age-child"
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
                <a
                        id="booking-box-btn" href="" class="booking-box-btn box-fill">Đặt phòng</a>
                <div class="booking-box-price-container">
                    <div class="booking-box-price-wrapper">
                        <div class="booking-box-price__label">
                            $<span id="booking-box-price__room-price">${room.price}</span>
                            x
                            <span id="booking-box-price__days">${totalDay}</span> đêm
                        </div>
                        <div class="booking-box-price__label">
                            $<span id="booking-box-price__room-price-total">${room.price*totalDay}</span>
                        </div>
                    </div>
                    <div class="booking-box-price-wrapper">
                        <div class="booking-box-price__label">
                  <span class="booking-box-price__fee-service"
                  >Phí dịch vụ</span
                  >
                        </div>
                        <div class="booking-box-price__label">
                            $<span id="booking-box-price__fee-service-total">5</span>
                        </div>
                    </div>
                    <div class="booking-box-price-wrapper__discount">
                        <div class="booking-box-price__label">
                            <span class="booking-box-price__discount">Giảm giá</span>
                        </div>
                        <div class="booking-box-price__label">
                            $<span id="booking-box-price__discount-total">-10</span>
                        </div>
                    </div>
                    <div class="line-spacing"></div>
                    <div class="booking-box-price-wrapper">
                        <div class="booking-box-price__label">
                            <span class="booking-box-price__total-label">Tổng</span>
                        </div>
                        <div class="booking-box-price__label">
                            $<span id="booking-box-price__total">${room.price*totalDay+5}</span>
                        </div>
                        <input
                                id="total_money"
                                disabled
                                value="0"
                                type="text"
                                style="display: none"
                        />
                    </div>
                </div>
            </div>
        </div>
        <div class="col-12">
            <div class="room-policies-container">
                <div class="row">
                    <div class="col-4">
                        <div class="room-policies-heading">Chính sách khách sạn</div>
                    </div>
                    <div class="col-8">
                        <div class="room-policies-wrapper">
                            <div class="room-policies-wrapper--item">
                                <div class="room-policies-wrapper__heading--checkin">
                                    Nhận phòng
                                </div>
                                <div class="room-policies-wrapper__body--checkin">
                                    <ul>
                                        <li>
                                            Giờ nhận phòng <strong>từ: 14:00 đến nửa đêm</strong>
                                        </li>
                                        <li>
                                            Việc đáp ứng yêu cầu nhận phòng sớm tùy tình hình thực
                                            tế
                                        </li>
                                        <li>Tuổi tối thiểu để nhận phòng: 18</li>
                                    </ul>
                                </div>
                            </div>
                            <div class="room-policies-wrapper--item">
                                <div class="room-policies-wrapper__heading--checkout">
                                    Trả phòng
                                </div>
                                <div class="room-policies-wrapper__body--checkout">
                                    <ul>
                                        <li>Trả phòng <strong>trước 11:00</strong></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="room-policies-wrapper">
                            <div class="room-policies-wrapper--item">
                                <div class="room-policies-wrapper__heading--general">
                                    Chính sách chung
                                </div>
                                <div class="room-policies-wrapper__body--general">
                                    <ul>
                                        <li>Không cho phép hút thuốc</li>
                                        <li>Không cho phép thú cưng</li>
                                        <li>Không cho phép tổ chức tiệc / sự kiện</li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="room-policies-wrapper">
                            <div class="room-policies-wrapper--item">
                                <div class="room-policies-wrapper__heading--child">
                                    Chính sách trẻ em
                                </div>
                                <div class="room-policies-wrapper__body--child">
                                    <ul>
                                        <li>Khách lớn hơn 12 tuổi sẽ được xem như người lớn</li>
                                        <li>Trẻ em dưới 6 tuổi có thể lưu trú miễn phí</li>
                                        <li>
                                            Trẻ em ở các tuổi còn lại lưu trú có thể mất phí
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
                                <span id="review_quantity">${reviewCount} lượt đánh giá</span>
                            </div>
                        </div>
                        <div class="room-review-average-score-bar-container">
                            <div class="room-review-average-score-bar-wrapper">
                                <div class="room-review-average-score-bar__label">
                                    Xuất sắc
                                </div>
                                <div class="room-review-average-score-bar__background">
                                    <div
                                            id="room-review-average-score-bar__1"
                                            class="room-review-average-score-bar"
                                    ></div>
                                </div>
                            </div>
                            <div class="room-review-average-score-bar-wrapper">
                                <div class="room-review-average-score-bar__label">Tốt</div>
                                <div class="room-review-average-score-bar__background">
                                    <div
                                            id="room-review-average-score-bar__2"
                                            class="room-review-average-score-bar"
                                    ></div>
                                </div>
                            </div>
                            <div class="room-review-average-score-bar-wrapper">
                                <div class="room-review-average-score-bar__label">Khá</div>
                                <div class="room-review-average-score-bar__background">
                                    <div
                                            id="room-review-average-score-bar__3"
                                            class="room-review-average-score-bar"
                                    ></div>
                                </div>
                            </div>
                            <div class="room-review-average-score-bar-wrapper">
                                <div class="room-review-average-score-bar__label">
                                    Trung bình
                                </div>
                                <div class="room-review-average-score-bar__background">
                                    <div
                                            id="room-review-average-score-bar__4"
                                            class="room-review-average-score-bar"
                                    ></div>
                                </div>
                            </div>
                            <div class="room-review-average-score-bar-wrapper">
                                <div class="room-review-average-score-bar__label">Kém</div>
                                <div class="room-review-average-score-bar__background">
                                    <div
                                            id="room-review-average-score-bar__5"
                                            class="room-review-average-score-bar"
                                    ></div>
                                </div>
                            </div>
                        </div>
                        <div class="room-review-btn-edit">Đánh giá ngay</div>
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
                                            20/12/2021
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
                            <form action="${pageContext.request.contextPath}/review" method="get" >
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
                                            <div class="room-review-cancel-edit-btn">Hủy</div>
                                            <button class="room-review-edit-btn">Đánh giá</button>
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
                <div class="room-host-container">
                    <div class="room-hosted-owner">
                        <div class="room-hosted-owner__img">
                            <img src="/images/quang.jpg" alt=""/>
                        </div>
                        <div class="room-hosted-owner-profile">
                <span class="room-hosted-owner-profile-name"
                >Chủ nhà Quang đần</span
                >
                            <span class="room-hosted-owner-profile-joineddate"
                            >Tham gia tháng 3 năm 2016</span
                            >
                        </div>
                    </div>
                    <div class="room-hosted-details">
                        <div class="room-hosted-details-left">
                            <div class="room-hosted-details-left-feature">
                                <div class="room-hosted-details-left-feature-item">
                    <span
                            style="color: #ee6c4d"
                            class="iconify"
                            data-icon="bi:star-fill"
                    ></span>
                                    <span class="room-hosted-details-left-feature-item-name"
                                    >80 Đánh giá</span
                                    >
                                </div>
                                <div class="room-hosted-details-left-feature-item">
                    <span
                            class="iconify"
                            data-icon="bx:bxs-badge-check"
                            style="color: #ee6c4d"
                    ></span>
                                    <span class="room-hosted-details-left-feature-item-name"
                                    >Đã xác minh</span
                                    >
                                </div>
                                <div class="room-hosted-details-left-feature-item">
                    <span
                            class="iconify"
                            data-icon="ri:medal-2-fill"
                            style="color: #ee6c4d"
                    ></span>
                                    <span class="room-hosted-details-left-feature-item-name"
                                    >Siêu chủ nhà</span
                                    >
                                </div>
                            </div>
                            <div class="room-hosted-details-left-details">
                  <span class="room-hosted-details-left-details-heading"
                  >Giới thiệu</span
                  >
                                <span class="room-hosted-details-left-details-text"
                                >Lorem ipsum dolor sit amet consectetur adipisicing elit.
                  </span>
                            </div>
                            <div class="room-hosted-details-left-details">
                  <span class="room-hosted-details-left-details-heading"
                  >Quang là một Chủ nhà siêu cấp</span
                  >
                                <span class="room-hosted-details-left-details-text"
                                >Chủ nhà siêu cấp là những người có kinh nghiệm, được đánh
                    giá cao và cam kết mang lại kỳ nghỉ tuyệt vời cho
                    khách.</span
                                >
                            </div>
                        </div>
                        <div class="room-hosted-details-right">
                            <div class="room-hosted-details-right-hostinfo">
                  <span class="room-hosted-details-right-hostinfo-item"
                  >Tỉ lệ phản hồi: 100%
                  </span>
                                <span class="room-hosted-details-right-hostinfo-item"
                                >Thời gian phản hồi: Vài giờ đồng hồ
                  </span>
                            </div>
                            <div class="room-hosted-details-right-contacthost box">
                                Liên hệ với chủ nhà
                            </div>
                            <div class="room-hosted-details-right-protectmoney">
                  <span
                          class="iconify"
                          data-icon="fluent:shield-error-20-filled"
                          style="color: #ffce45"
                          data-height="30"
                          data-width="30"
                  ></span>
                                <span class="room-hosted-details-right-protectmoney-text"
                                >Để bảo vệ khoản thanh toán của bạn, tuyệt đối không chuyển
                    tiền hoặc liên lạc bên ngoài trang web hoặc ứng dụng.
                  </span>
                            </div>
                        </div>
                    </div>
                </div>
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
                                    src="${pageContext.request.contextPath}/images/${room.roomImage[0].name}"
                                    style="width: 100%"
                            />
                        </div>
                        <c:forEach var="img" items="${room.roomImage}" begin="1">
                            <div class="item">
                                <img
                                        src="${pageContext.request.contextPath}/images/${img.name}"
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

<!-- end main content -->
<script src="<c:url value="/user/js/detail_prod.js"/> "></script>
<script src="<c:url value="/user/js/main.js"/> "></script>

<script src="<c:url value="/user/node_modules/moment/moment.js"/> "></script>
<script>
    $("#booking-box-btn").click(function (e) {
        if (parseInt(document.getElementById("booking-box-guests--input").value) === 0
            || document.getElementById("booking-box-checkin").value === null || document.getElementById("booking-box-checkout").value == null) {
            return 0;
        } else {
            document.getElementById("booking-box-btn").href = '${pageContext.request.contextPath}/view/booking.jsp';
        }

    })
</script>
<script>
    var format = "DD-MM-YYYY";
    var today = moment();
    today.subtract(1, "days").format(format);
    const disallowedDates = [["2001-01-01", today]];
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
            var start = picker.getStartDate().getTime();
            var end = picker.getEndDate().getTime();
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
<script>
    // btn add sub
    $(".booking-box-guests__btn-adult-add").click(function (e) {
        var temp = parseInt(
            document.getElementById("booking-box-guests__count--adult").innerHTML
        );
        var quantity = parseInt(
            document.getElementById("booking-box-guests--input").value
        );

        if (temp < 5) {
            temp += 1;
            quantity += 1;
            document.getElementById(
                "booking-box-guests__count--adult"
            ).innerHTML = temp;
            document.getElementById("booking-box-guests--input").value =
                quantity + " Khách";
        }
    });
    $(".booking-box-guests__btn-adult-sub").click(function (e) {
        var quantity = parseInt(
            document.getElementById("booking-box-guests--input").value
        );
        var temp = parseInt(
            document.getElementById("booking-box-guests__count--adult").innerHTML
        );
        if (temp > 1) {
            temp -= 1;
            quantity -= 1;
            document.getElementById(
                "booking-box-guests__count--adult"
            ).innerHTML = temp;
            document.getElementById("booking-box-guests--input").value =
                quantity + " Khách";
        }
    });
    $(".booking-box-guests__btn-child-add").click(function (e) {
        var temp = parseInt(
            document.getElementById("booking-box-guests__count--child").innerHTML
        );
        var quantity = parseInt(
            document.getElementById("booking-box-guests--input").value
        );
        if (temp < 5) {
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
                quantity + " Khách";
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
                quantity + " Khách";
        }
    });
    // end
</script>
</body>
<footer class="footer"></footer>
</html>
