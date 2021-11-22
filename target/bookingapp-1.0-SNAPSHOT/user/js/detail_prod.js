document.querySelectorAll('a[href^="#"]').forEach((anchor) => {
  anchor.addEventListener("click", function (e) {
    e.preventDefault();

    document.querySelector(this.getAttribute("href")).scrollIntoView({
      behavior: "smooth",
    });
  });
});

// show room people

$("html").click(function () {
  $(".booking-box-guests-number").removeClass("active");
});

$("#booking-box-guests").click(function (e) {
  e.stopPropagation();
});

$("#booking-box-guests").click(function (e) {
  $(".booking-box-guests-number").addClass("active");
});
// review score

// score bar

function init() {
  var list_score = document.getElementsByClassName(
      "room-review-comment-block__score-total"
  );
  var len = document.getElementsByClassName(
      "room-review-comment-block__score-total"
  ).length;
  var container_score = [];
  var avg_score = 0;
  for (var i = 0; i < len; i++) {
    var temp = parseFloat(list_score[i].innerHTML);
    container_score.push(temp);
    avg_score += temp;
  }
  document.getElementById("avg_score").innerHTML = (avg_score / len).toFixed(1);

  var container_1 = 0,
      container_2 = 0,
      container_3 = 0,
      container_4 = 0,
      container_5 = 0;
  container_score.forEach((x) => {
    if (x < 5 && x >= 4) {
      container_1 += 1;
    } else if (x < 4 && x >= 3) {
      container_2 += 1;
    } else if (x < 3 && x >= 2) {
      container_3 += 1;
    } else if (x < 2 && x >= 1) {
      container_4 += 1;
    } else {
      container_5 += 1;
    }
  });
  document.getElementById("room-review-average-score-bar__1").style.width = `${
      (container_1 * 100) / len
  }%`;
  document.getElementById("room-review-average-score-bar__2").style.width = `${
      (container_2 * 100) / len
  }%`;
  document.getElementById("room-review-average-score-bar__3").style.width = `${
      (container_3 * 100) / len
  }%`;
  document.getElementById("room-review-average-score-bar__4").style.width = `${
      (container_4 * 100) / len
  }%`;
  document.getElementById("room-review-average-score-bar__5").style.width = `${
      (container_5 * 100) / len
  }%`;
}

init();
$(".image-container").click(function (e) {
  document.getElementById("more_image").style.display = "block";
});
$(".modal-body-btn-back").click(function (e) {
  document.getElementById("more_image").style.display = "none";
});

$(".room-review-btn-edit").click(function (e) {
  document.getElementById("room-review-edit-container").style.display = "block";
});
$(".room-review-cancel-edit-btn").click(function (e) {
  document.getElementById("room-review-edit-container").style.display = "none";
});





