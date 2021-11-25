$("html").click(function () {
  $(".location-search-select-list").removeClass("active");
});

$("#search_location").click(function (e) {
  e.stopPropagation();
});

$("#search_location").click(function (e) {
  $(".location-search-select-list").addClass("active");
});
//open room people form
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



