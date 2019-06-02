$( document ).ready(function() {
  $("#view-timeline-btn").click(function() {
      $('html, body').animate({
          scrollTop: $("#section2").offset().top
      },
      300);
  });
});
