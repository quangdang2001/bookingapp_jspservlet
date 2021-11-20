<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!DOCTYPE html>
<html lang="vi">
  <head>
    <meta charset="UTF-8" />

    <title>Travel Booking</title>
    <link
      href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap"
      rel="stylesheet"
    />
    <script src="https://code.iconify.design/2/2.0.4/iconify.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <!-- CSS -->
    <link rel="stylesheet" href="<c:url value="/user/styles/root.css" />" />
    <link rel="stylesheet" href="<c:url value="/user/styles/grid.css" />" />
    <link rel="stylesheet" href="<c:url value="/user/styles/booking.css" /> " />
    <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/litepicker/dist/css/litepicker.css"
    />
    <script src="https://cdn.jsdelivr.net/npm/litepicker/dist/litepicker.js"></script>
  </head>
  <body>
  <!-- top nav -->
  <div class="top-nav">
    <div class="container">
      <div class="nav">
        <div class="nav-content">
          <a href="" class="logo">Travel Booking</a>
        </div>
      </div>
    </div>
  </div>
  <!-- end top nav -->
  <div class="container">
    <form>
    <div class="row">
      <div class="col-7">
        <div class="booking-content-container">
          <div class="booking-content-heading">
            <div class="booking-content-heading__icons">
                <span
                        class="iconify"
                        data-icon="akar-icons:chevron-left"
                ></span>
            </div>
            <h1>Xác nhận và thanh toán</h1>
          </div>
          <div id="booking-trip" class="booking-content-wrapper">
            <div class="booking-content-wrapper--heading">
              Thông tin chuyến đi
            </div>
            <div class="booking-content-wrapper--block">
              <div class="booking-content-wrapper--block--left">
                <label
                        for="booking-date"
                        class="booking-content-wrapper--block--left__heading"
                >
                  Ngày
                </label>
                <input
                        type="text"
                        class="booking-content-wrapper--block--left__subheading"
                        id="booking-checkin"
                        value="25/11/2021 - 27/11/2021"
                        disabled
                />
              </div>
              <div class="booking-content-wrapper--block--right">
                <button class="booking-content-edit-date" href="" type="button">
                  Chỉnh sửa
                </button>
              </div>
            </div>

            <div class="booking-content-wrapper--block">
              <div class="booking-content-wrapper--block--left">
                <label
                        for="booking-guesss"
                        class="booking-content-wrapper--block--left__heading"
                >
                  Khách
                </label>
                <input
                        type="text"
                        disabled
                        class="booking-content-wrapper--block--left__subheading"
                        id="booking-guess"
                        value="1 khách"
                />
              </div>
              <div class="booking-content-wrapper--block--right">
                <button class="booking-content-edit-guess" href="" type="button">
                  Chỉnh sửa
                </button>
              </div>
            </div>

            <div id="booking-box-guests" class="booking-box-guests-container">
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
          <div class="line-space"></div>
          <div id="booking-payment" class="booking-content-wrapper">
            <div class="booking-content-wrapper--heading">
              Phương thức thanh toán
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
                <div class="booking-payment-select__text">Chuyển khoản</div>
              </button>
              <button
                      type="button"
                      name="payment"
                      id="booking-payment-paypal"
                      class="box-outline booking-payment-paypal"
              >
                <span class="iconify" data-icon="fontisto:paypal"></span>
                <div class="booking-payment-select__text">Paypal</div>
              </button>
            </div>
            <div class="booking-transfer-container active">
              <p>
                Hướng dẫn thanh toán sẽ được gửi tới
                <strong>email</strong> của bạn. Vui lòng thanh toán trước
                <strong>2 ngày sau thời gian đăng kí</strong>. Quá thời hạn
                thanh toán trên, đơn phòng sẽ tự động bị hủy.
              </p>
            </div>
            <div class="booking-paypal-container">
              <div class="booking-paypal-heading">
                Đăng nhập để sử dụng PayPal.
              </div>
              <a
                      href="https://www.paypal.com/uk/home"
                      class="booking-paypal-direct"
              >
                <div class="booking-paypal-btn">
                  <span class="iconify" data-icon="uim:paypal"></span>
                  PayPal
                </div>
              </a>
            </div>
          </div>

          <div class="line-space"></div>
          <div class="booking-content-wrapper">
            <div class="booking-content-wrapper--heading">Chính sách hủy</div>
            <div class="booking-canceled-wrapper">
              <ul>
                <li>
                  Hủy trước 14:00 ngày 20 thg 11 để được hoàn lại 50% trừ đêm
                  đầu tiên và phí dịch vụ. <a href="">Tìm hiểu thêm</a>
                </li>
                <li>
                  Chính sách trường hợp bất khả kháng của chúng tôi không áp
                  dụng cho các trường hợp gián đoạn đi lại do COVID-19 gây ra.
                  <a href="">Tìm hiểu thêm</a>
                </li>
              </ul>
            </div>
          </div>
          <div class="line-space"></div>
          <div class="booking-content-wrapper">
            <div class="booking-term">
              Bằng việc chọn nút bên dưới, tôi đồng ý với
              <a href=""> Nội quy nhà của Chủ nhà </a> ,
              <a href=""
              >Các yêu cầu về an toàn trong đại dịch COVID-19 của Airbnb</a
              >
              và <a href=""> Chính sách hoàn tiền cho khách.</a>
            </div>
          </div>
          <div class="booking-content-wrapper">
            <button class="booking-btn-pay">Xác nhận & thanh toán</button>
          </div>
        </div>
      </div>
      <div class="col-5 booking-move-container">
        <div class="booking-move-wrapper">
          <div class="booking-move-heading-wrapper">
            <div class="booking-move-heading__image">
              <img src="/images/bigsize.jpg" alt="" />
            </div>
            <div class="booking-move-heading__content">
                <span class="booking-move-heading__content-heading"
                >Room in boutique hotel in Thành phố Đà Lạt</span
                >
              <div class="booking-move-heading__content-subheading">
                <span>Áp mái view thung lũng đồi</span>
                <span>1 phòng ngủ · 1 phòng tắm</span>
              </div>
              <div class="booking-move-heading__content-footer">
                <div class="booking-move-heading__content-footer-left">
                    <span
                            class="iconify booking-subheading--star"
                            data-icon="bx:bxs-star"
                            style="color: #ee6c4d"
                    ></span>
                  <div class="booking-rating">
                    <strong> 9/10 </strong>
                    (50 đánh giá)
                  </div>
                </div>
                <div class="booking-move-heading__content-footer-right">
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
            </div>
          </div>
          <div class="line-space"></div>
          <div class="booking-move-price-detail-wrapper">
            <div class="booking-move-price-detail-heading">Chi tiết giá</div>
            <div class="booking-move-price-detail-content">
              <div class="booking-move-price-detail-content-wrapper">
                <div class="booking-move-price__label">
                  $<span id="booking-move-price__room-price">15</span>
                  x
                  <div id="booking-move-price__days">2 đêm</div>
                </div>
                <div class="booking-box-price__label">
                  $<span id="booking-box-price__room-price-total">30</span>
                </div>
              </div>
              <div class="booking-move-price-detail-content-wrapper">
                <div class="booking-move-price__label">
                    <span class="booking-move-price__fee-service"
                    >Phí dịch vụ</span
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
                  <span class="booking-move-price__discount">Giảm giá</span>
                </div>
                <div class="booking-box-price__label">
                  $
                  <div id="booking-box-price__discount-total">-10</div>
                </div>
              </div>
              <div class="booking-move-price-detail-content-wrapper">
                <div class="booking-move-price__label">
                  <span class="booking-move-price__total">Tổng</span>
                </div>
                <div class="booking-box-price__label">
                  $<span id="booking-box-price__total-total">35</span>
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
    </form>
  </div>

  <script src="<c:url value="/user/js/booking.js"/> "></script>
  <script src="<c:url value="/user/node_modules/moment/moment.js"/> "></script>
  <script>
    var format = "DD-MM-YYYY";
    var today = moment();
    today.subtract(1, "days").format(format);

    const disallowedDates = [
      ["2001-01-01", today],
      "2021-12-1",
      ["2021-11-21", "2021-11-22"],
    ];
    var picker = new Litepicker({
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
      var date = 0;

      picker.on("selected", (date1, date2) => {
        var start = picker.getStartDate().getTime();
        var end = picker.getEndDate().getTime();
        const oneDay = 1000 * 60 * 60 * 24;
        const diffInTime = date2.getTime() - date1.getTime();
        const diffInDays = Math.round(diffInTime / oneDay);
        document.getElementById("booking-move-price__days").innerHTML =
                diffInDays + " đêm";
        var price_room = parseFloat(
                document.getElementById("booking-move-price__room-price").innerHTML
        );
        var fee = parseFloat(
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
    $(".booking-box-guests__btn-adult-add").click(function (e) {
      var temp = parseInt(
              document.getElementById("booking-box-guests__count--adult").innerHTML
      );
      var quantity = parseInt(document.getElementById("booking-guess").value);

      if (temp < 5) {
        temp += 1;
        quantity += 1;
        document.getElementById(
                "booking-box-guests__count--adult"
        ).innerHTML = temp;
        document.getElementById("booking-guess").value = quantity + " Khách";
      }
    });
    $(".booking-box-guests__btn-adult-sub").click(function (e) {
      var quantity = parseInt(document.getElementById("booking-guess").value);
      var temp = parseInt(
              document.getElementById("booking-box-guests__count--adult").innerHTML
      );
      if (temp > 1) {
        temp -= 1;
        quantity -= 1;
        document.getElementById(
                "booking-box-guests__count--adult"
        ).innerHTML = temp;
        document.getElementById("booking-guess").value = quantity + " Khách";
      }
    });
    $(".booking-box-guests__btn-child-add").click(function (e) {
      var temp = parseInt(
              document.getElementById("booking-box-guests__count--child").innerHTML
      );
      var quantity = parseInt(document.getElementById("booking-guess").value);
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
        document.getElementById("booking-guess").value = quantity + " Khách";
      }
    });
    $(".booking-box-guests__btn-child-sub").click(function (e) {
      var temp = parseInt(
              document.getElementById("booking-box-guests__count--child").innerHTML
      );
      var quantity = parseInt(document.getElementById("booking-guess").value);
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
        document.getElementById("booking-guess").value = quantity + " Khách";
      }
    });
  </script>
  </body>
  <footer id="footer"></footer>
</html>
