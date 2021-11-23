document.querySelectorAll('a[href^="#"]').forEach((anchor) => {
  anchor.addEventListener("click", function (e) {
    e.preventDefault();

    document.querySelector(this.getAttribute("href")).scrollIntoView({
      behavior: "smooth",
    });
  });
});

// payment btn
$("#booking-payment-transfer").click(function (e) {
  e.stopPropagation();
});

$("#booking-payment-transfer").click(function (e) {
  $(".booking-payment-transfer").addClass("active");
  $(".booking-payment-paypal").removeClass("active");
  $(".booking-transfer-container").addClass("active");
  $(".booking-paypal-container").removeClass("active");
});

$("#booking-payment-paypal").click(function (e) {
  e.stopPropagation();
});

$("#booking-payment-paypal").click(function (e) {
  $(".booking-payment-paypal").addClass("active");
  $(".booking-payment-transfer").removeClass("active");
  $(".booking-paypal-container").addClass("active");
  $(".booking-transfer-container").removeClass("active");
});

// edit btn

//date
$(".booking-content-edit-date").click(function (e) {
  e.stopPropagation();
});

$(".booking-content-edit-date").click(function (e) {
  $(".booking-box-date-container").addClass("active");
});

//guess

$(".booking-content-edit-guess").click(function (e) {
  e.stopPropagation();
});

$(".booking-content-edit-guess").click(function (e) {
  $(".booking-box-guests-number").addClass("active");
});

// btn add sub

// total money
