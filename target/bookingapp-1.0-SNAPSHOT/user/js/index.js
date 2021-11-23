$("html").click(function () {
  $(".location-search-select-list").removeClass("active");
});

$("#search_location").click(function (e) {
  e.stopPropagation();
});

$("#search_location").click(function (e) {
  $(".location-search-select-list").addClass("active");
});

$("html").click(function () {
  $(".room-people-number").removeClass("active");
});

$("#input_customer").click(function (e) {
  e.stopPropagation();
});

$("#input_customer").click(function (e) {
  $(".room-people-number").addClass("active");
});

