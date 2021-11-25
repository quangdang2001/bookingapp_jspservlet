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


// end

