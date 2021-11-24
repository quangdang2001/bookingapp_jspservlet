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
  $(".room-people-number-warning").removeClass("active");
  document.querySelector(".room-people-age-child").className = document
      .querySelector(".room-people-age-child")
      .className.replace(" active", "");
});

$("#room-people").click(function (e) {
  e.stopPropagation();
});

$("#room-people").click(function (e) {
  $(".room-people-number").addClass("active");
  if(parseInt(
      document.getElementById("room-people__count--child").innerHTML
  )!=0)
  {
    document.querySelector(".room-people-number-warning").className +=
        " active";
    document.querySelector(".room-people-age-child").className +=
        " active";
  }
});

// end

