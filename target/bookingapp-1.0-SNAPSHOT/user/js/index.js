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




