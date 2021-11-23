// root
document.querySelectorAll('a[href^="#"]').forEach((anchor) => {
  anchor.addEventListener("click", function (e) {
    e.preventDefault();

    document.querySelector(this.getAttribute("href")).scrollIntoView({
      behavior: "smooth",
    });
  });
});

// show location slect list
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

// end

