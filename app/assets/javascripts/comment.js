$(document).on('turbolinks:load', function() {
  $('.comment_click').click(function() {
    $('.comment_field').fadeIn();
    $('.footer__text').css('background-color','rgba(0, 0, 0, 0.6)');
  });
  $('.btn').click(function() {
    $('.comment_field').fadeOut();
  });
});