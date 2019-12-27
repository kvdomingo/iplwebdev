// Initialize tooltip component
$(function () {
  $('[data-toggle="tooltip"]').tooltip()
})

// Initialize popover component
$(function () {
  $('[data-toggle="popover"]').popover()
})

$('.dropdown').hover(
    function() {
        $(this).find('.dropdown-menu').stop(true, true).delay(20).fadeIn();
    },
    function() {
        $(this).find('.dropdown-menu').stop(true, true).delay(20).fadeOut();
    }
);

$('.dropdown-menu').hover(
    function() {
        $(this).stop(true, true);
    },
    function() {
        $(this).stop(true, true).delay(20).fadeOut();
    }
);
