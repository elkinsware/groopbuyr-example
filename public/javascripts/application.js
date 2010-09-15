jQuery.fn.submitWithAjax = function() {
  this.livequery('submit', function() {
    $.post(this.action, $(this).serialize(), null, "script");
    return false;
  })
  return this;
};

$(document).ready(function() {
  $('.deal form').submitWithAjax();
});