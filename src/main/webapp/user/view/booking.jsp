<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8"/>

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
    <div class=container-main>
        <div class="nav">
            <div class="nav-content">
                <a href="${pageContext.request.contextPath}/home" class="logo">Travel Booking</a>
            </div>
        </div>
    </div>
</div>
<!-- end top nav -->
<form action="${pageContext.request.contextPath}/home/booking/payment" method="post">
    <input type="hidden" name="idRoom" value="${room.id}">

    <div class=container-main>

        <div class="row">
            <div class="col-7">
                <div class="booking-content-container">
                    <div class="booking-content-heading">
                        <a href="javascript:history.back()">
                        <div class="booking-content-heading__icons">
                <span
                        class="iconify"
                        data-icon="akar-icons:chevron-left"
                ></span>
                        </div>
                        </a>
                        <h1>X??c nh???n v?? thanh to??n</h1>
                    </div>
                    <div id="booking-trip" class="booking-content-wrapper">
                        <div class="booking-content-wrapper--heading">
                            Th??ng tin chuy???n ??i
                        </div>
                        <div class="booking-content-wrapper--block">
                            <div class="booking-content-wrapper--block--left">
                                <label
                                        for="booking-checkin"
                                        class="booking-content-wrapper--block--left__heading"
                                >
                                    Ng??y
                                </label>
                                <input
                                        name="dateBooking"
                                        type="text"
                                        class="booking-content-wrapper--block--left__subheading"
                                        id="booking-checkin"
                                        value="${checkInDate} - ${checkOutDate}"
                                        readonly
                                />
                            </div>
                            <div class="booking-content-wrapper--block--right">
                                <button class="booking-content-edit-date" href="" type="button">
                                    Ch???nh s???a
                                </button>
                            </div>
                        </div>

                        <div class="booking-content-wrapper--block">
                            <div class="booking-content-wrapper--block--left">
                                <label
                                        for="booking-guess"
                                        class="booking-content-wrapper--block--left__heading"
                                >
                                    Kh??ch
                                </label>
                                <input
                                        type="text"
                                        name="quantityPeople"
                                        readonly
                                        class="booking-content-wrapper--block--left__subheading"
                                        id="booking-guess"
                                        value="${quantityPeople} kh??ch"
                                />
                            </div>
                            <div class="booking-content-wrapper--block--right">
                                <button class="booking-content-edit-guess" href="" type="button">
                                    Ch???nh s???a
                                </button>
                            </div>
                        </div>

                        <div id="booking-box-guests" class="booking-box-guests-container">
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
                                            name="booking-child-age"
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
                    <div class="line-space"></div>
                    <div id="booking-payment" class="booking-content-wrapper">
                        <div class="booking-content-wrapper--heading">
                            Ph????ng th???c thanh to??n
                        </div>
                        <div class="booking-content-button-container">
                            <button
                                    type="button"
                                    id="booking-payment-transfer"
                                    name="payment"
                                    class="box-outline booking-payment-transfer active"
                            >
                            <span
                                    class="iconify"
                                    data-icon="uil:transaction"
                                    data-width="30"
                                    data-height="30"
                            ></span>
                                <div class="booking-payment-select__text">Chuy???n kho???n</div>
                            </button>

                        </div>
                        <div class="booking-transfer-container active">
                            <p>
                                H?????ng d???n thanh to??n s??? ???????c g???i t???i
                                <strong>email</strong> c???a b???n. Vui l??ng thanh to??n tr?????c
                                <strong>2 ng??y sau th???i gian ????ng k??</strong>. Qu?? th???i h???n
                                thanh to??n tr??n, ????n ph??ng s??? t??? ?????ng b??? h???y.
                            </p>
                        </div>

                    </div>

                    <div class="line-space"></div>
                    <div class="booking-content-wrapper">
                        <div class="booking-content-wrapper--heading">Ch??nh s??ch h???y</div>
                        <div class="booking-canceled-wrapper">
                            <ul>
                                <li>
                                    H???y tr?????c 14:00 ng??y 20 thg 11 ????? ???????c ho??n l???i 50% tr??? ????m
                                    ?????u ti??n v?? ph?? d???ch v???. <a href="">T??m hi???u th??m</a>
                                </li>
                                <li>
                                    Ch??nh s??ch tr?????ng h???p b???t kh??? kh??ng c???a ch??ng t??i kh??ng ??p
                                    d???ng cho c??c tr?????ng h???p gi??n ??o???n ??i l???i do COVID-19 g??y ra.
                                    <a href="">T??m hi???u th??m</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="line-space"></div>
                    <div class="booking-content-wrapper">
                        <div class="booking-term">
                            B???ng vi???c ch???n n??t b??n d?????i, t??i ?????ng ?? v???i
                            <a href=""> N???i quy nh?? c???a Ch??? nh?? </a> ,
                            <a href=""
                            >C??c y??u c???u v??? an to??n trong ?????i d???ch COVID-19 c???a Airbnb</a
                            >
                            v?? <a href=""> Ch??nh s??ch ho??n ti???n cho kh??ch.</a>
                        </div>
                    </div>
                    <div class="booking-content-wrapper">
                        <button class="booking-btn-pay">X??c nh???n & thanh to??n</button>
                    </div>
                </div>
            </div>
            <div class="col-5 booking-move-container">
                <div class="booking-move-wrapper">
                    <div class="booking-move-heading-wrapper">
                        <div class="booking-move-heading__image">
                            <img src="${room.roomImage[0].name}" alt=""/>
                        </div>
                        <div class="booking-move-heading__content">
                <span class="booking-move-heading__content-heading"
                >${room.name}</span
                >
                            <div class="booking-move-heading__content-subheading">
                                <span>${room.building.name}</span>
                                <span>${room.bedCount} ph??ng ng??? ?? ${room.bathCount} ph??ng t???m</span>
                            </div>
                            <div class="booking-move-heading__content-footer">
                                <div class="booking-move-heading__content-footer-left">
                    <span
                            class="iconify booking-subheading--star"
                            data-icon="bx:bxs-star"
                            style="color: #ee6c4d"
                    ></span>
                                    <div class="booking-rating">
                                        <strong> ${room.rating}/5 </strong>
                                        (${reviewCount} ????nh gi??)
                                    </div>
                                </div>
                                <div class="booking-move-heading__content-footer-right">
                    <span
                            class="iconify"
                            data-icon="ri:medal-2-fill"
                            style="color: #ee6c4d"
                    ></span>
                                    <span class="room-hosted-details-left-feature-item-name"
                                    >${room.roomType.name}</span
                                    >
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="line-space"></div>
                    <div class="booking-move-price-detail-wrapper">
                        <div class="booking-move-price-detail-heading">Chi ti???t gi??</div>
                        <div class="booking-move-price-detail-content">
                            <div class="booking-move-price-detail-content-wrapper">
                                <div class="booking-move-price__label">
                                    $<span id="booking-move-price__room-price">${room.price}</span>
                                    x
                                    <div id="booking-move-price__days">${totalDay} ????m</div>
                                </div>
                                <div class="booking-box-price__label">
                                    $<span id="booking-box-price__room-price-total">${totalPrice-5}</span>
                                </div>
                            </div>
                            <div class="booking-move-price-detail-content-wrapper">
                                <div class="booking-move-price__label">
                    <span class="booking-move-price__fee-service"
                    >Ph?? d???ch v???</span
                    >
                                </div>
                                <div class="booking-box-price__label">
                                    $<span id="booking-box-price__fee-service-total">5</span>
                                </div>
                            </div>
                            <div
                                    class="
                    booking-move-price-detail-content-wrapper
                    none_discount
                  "
                            >
                                <div class="booking-move-price__label">
                                    <span class="booking-move-price__discount">Gi???m gi??</span>
                                </div>
                                <div class="booking-box-price__label">
                                    $
                                    <div id="booking-box-price__discount-total">-10</div>
                                </div>
                            </div>
                            <div class="booking-move-price-detail-content-wrapper">
                                <div class="booking-move-price__label">
                                    <span class="booking-move-price__total">T???ng</span>
                                </div>
                                <div class="booking-box-price__label">
                                    $<span id="booking-box-price__total-total">${totalPrice}</span>
                                    <input
                                            value="35"
                                            id="total_money"
                                            type="text"
                                            style="display: none"
                                    />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</form>
</div>

<%--  footer--%>
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
<%--  end footer--%>

<script src="<c:url value="/user/js/booking.js"/> "></script>
<script src="<c:url value="/user/node_modules/moment/moment.js"/> "></script>
<script>
    let format = "DD-MM-YYYY";
    let today = moment();
    today.subtract(1, "days").format(format);

    const disallowedDates = [["2001-01-01", today], <c:forEach var="date" items="${dateBlock}" >
        ${date},
        </c:forEach>];
    let picker = new Litepicker({
        element: document.getElementById("booking-checkin"),
        singleMode: false,
        numberOfColumns: 2,
        numberOfMonths: 2,
        format: "DD/MM/YYYY",
        lockDays: disallowedDates,
        autoApply: false,
        tooltipText: {
            one: "night",
            other: "nights",
        },
        tooltipNumber: (totalDays) => {
            return totalDays - 1;
        },
    });

    $(".booking-content-edit-date").click(function (e) {
        picker.show();
        let date = 0;

        picker.on("selected", (date1, date2) => {
            let start = picker.getStartDate().getTime();
            let end = picker.getEndDate().getTime();
            booking - content - edit - date
            const oneDay = 1000 * 60 * 60 * 24;
            const diffInTime = date2.getTime() - date1.getTime();
            const diffInDays = Math.round(diffInTime / oneDay);
            document.getElementById("booking-move-price__days").innerHTML =
                diffInDays + " ????m";
            let price_room = parseFloat(
                document.getElementById("booking-move-price__room-price").innerHTML
            );
            let fee = parseFloat(
                document.getElementById("booking-box-price__fee-service-total")
                    .innerHTML
            );
            document.getElementById("booking-box-price__total-total").innerHTML =
                price_room * diffInDays + fee;

            document.getElementById("total_money").value =
                price_room * diffInDays + fee;

            document.getElementById(
                "booking-box-price__room-price-total"
            ).innerHTML = price_room * diffInDays;
        });
    });
</script>
<script>
    var maxPeople =${room.accomodatesCount};
    var maxPeopleChild = maxPeople - ${quantityPeople};
    $(".booking-box-guests__btn-adult-add").click(function (e) {
        let temp = parseInt(
            document.getElementById("booking-box-guests__count--adult").innerHTML
        );
        let quantity = parseInt(document.getElementById("booking-guess").value);

        if (temp < maxPeople) {
            temp += 1;
            quantity += 1;
            document.getElementById(
                "booking-box-guests__count--adult"
            ).innerHTML = temp;
            document.getElementById("booking-guess").value = quantity + " Kh??ch";
            maxPeopleChild -= 1;
        }
    });
    $(".booking-box-guests__btn-adult-sub").click(function (e) {
        let quantity = parseInt(document.getElementById("booking-guess").value);
        let temp = parseInt(
            document.getElementById("booking-box-guests__count--adult").innerHTML
        );
        if (temp > 1) {
            temp -= 1;
            quantity -= 1;
            document.getElementById(
                "booking-box-guests__count--adult"
            ).innerHTML = temp;
            document.getElementById("booking-guess").value = quantity + " Kh??ch";
            maxPeopleChild += 1;
        }
    });
    $(".booking-box-guests__btn-child-add").click(function (e) {
        let temp = parseInt(
            document.getElementById("booking-box-guests__count--child").innerHTML
        );
        var quantity = parseInt(document.getElementById("booking-guess").value);
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
            document.getElementById("booking-guess").value = quantity + " Kh??ch";
            maxPeople -= 1;
        }
    });
    $(".booking-box-guests__btn-child-sub").click(function (e) {
        let temp = parseInt(
            document.getElementById("booking-box-guests__count--child").innerHTML
        );
        let quantity = parseInt(document.getElementById("booking-guess").value);
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
            document.getElementById("booking-guess").value = quantity + " Kh??ch";
            maxPeople += 1;
        }
    });
</script>

</body>

</html>
