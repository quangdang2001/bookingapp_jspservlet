// root
document.querySelectorAll('a[href^="#"]').forEach(anchor => {
  anchor.addEventListener('click', function (e) {
      e.preventDefault();

      document.querySelector(this.getAttribute('href')).scrollIntoView({
          behavior: 'smooth'
      });
  });
});

// mode nav bar
var btnContainer = document.getElementById("nav-mode");
var btns = btnContainer.getElementsByClassName("nav-mode__btn-hotel");
for (var i = 0; i < btns.length; i++) {
  btns[i].addEventListener("click", function () {
    var current = document.getElementsByClassName("nav-mode__btn-hotel active");
    current[0].className = current[0].className.replace(" active", "");
    this.className += " active";
  });
}

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

var container = document.querySelectorAll(
  ".ocation-search-select-wrapper__content__title"
);



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



// btn add sub
$(".room-people__btn-adult-add").click(function (e) {
  var temp = parseInt(
    document.getElementById("room-people__count--adult").innerHTML
  );
  var quantity= parseInt(document.getElementById("room-people_btn").value)

  if (temp < 5) {
    temp += 1;
    quantity+=1;
    document.getElementById("room-people__count--adult").innerHTML = temp;
    document.getElementById("room-people_btn").value= quantity +" Khách";
  }
});
$(".room-people__btn-adult-sub").click(function (e) {
  var quantity= parseInt(document.getElementById("room-people_btn").value)
  var temp = parseInt(
    document.getElementById("room-people__count--adult").innerHTML
  );
  if (temp > 1) {
    temp -= 1;
    quantity-=1;
    document.getElementById("room-people__count--adult").innerHTML = temp;
    document.getElementById("room-people_btn").value= quantity +" Khách";
  }
});
$(".room-people__btn-child-add").click(function (e) {
  var temp = parseInt(
    document.getElementById("room-people__count--child").innerHTML
  );
  var quantity= parseInt(document.getElementById("room-people_btn").value)
  if (temp < 5) {
    temp += 1;
    quantity+=1;
    document.getElementById("room-people__count--child").innerHTML = temp;
    document.querySelector(".room-people-number-warning").className+=" active"
    document.querySelector(".room-people-age-child").className+=" active"
    document.getElementById("room-people_btn").value= quantity +" Khách";
  }
});
$(".room-people__btn-child-sub").click(function (e) {
  var temp = parseInt(
    document.getElementById("room-people__count--child").innerHTML
  );
  var quantity= parseInt(document.getElementById("room-people_btn").value)
  if (temp > 0) {
    temp -= 1;
    quantity-=1;
    document.getElementById("room-people__count--child").innerHTML = temp;
    document.querySelector(".room-people-number-warning").className= document.querySelector(".room-people-number-warning").className.replace(" active","")
    document.querySelector(".room-people-age-child").className= document.querySelector(".room-people-age-child").className.replace(" active","")
    document.getElementById("room-people_btn").value= quantity +" Khách";
    
  }
});

// end



// product sort
$("html").click(function () {
  $(".product-sort-select-list").removeClass("active");
});

$("#product-sort").click(function (e) {
  e.stopPropagation();
});

$("#product-sort").click(function (e) {
  $(".product-sort-select-list").addClass("active");
});

$("#sort-mode-1").click(function (e) {
  document.getElementById("product-sort-mode").innerHTML = "Đề xuất";
});
$("#sort-mode-2").click(function (e) {
  document.getElementById("product-sort-mode").innerHTML = "Giá giãm dần";
});
$("#sort-mode-3").click(function (e) {
  document.getElementById("product-sort-mode").innerHTML = "Giá tăng dần";
});
$("#sort-mode-4").click(function (e) {
  document.getElementById("product-sort-mode").innerHTML = "Xếp hạng sao";
});
$("#sort-mode-5").click(function (e) {
  document.getElementById("product-sort-mode").innerHTML = "Đánh giá cao nhất";
});
