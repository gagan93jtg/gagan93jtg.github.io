var $root = $('html, body');
$('.nav-link').click(function() {
    var cls = $(this).attr('id').split('-')[0];
    $root.animate({
        scrollTop: $("." + cls + "-div").offset().top - 60
    }, 500);
    return false;
});
