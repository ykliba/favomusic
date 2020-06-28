$(document).on('turbolinks:load', function() {
  $('.comment_click').click(function() {
    $('.comment_field').fadeIn();
  });
  $('.btn').click(function() {
    $('.comment_field').fadeOut();
  });
});