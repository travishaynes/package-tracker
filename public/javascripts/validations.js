(function($){
  
  $.fn.validate_form = function() {
    this.submit(function(){
      // validate required inputs
      $(this).find("input.required").validate_required_input();
      // check for failed inputs
      var failed_inputs = $("input.failed");
      if (failed_inputs.length > 0) {
        // flash the failed inputs
        failed_inputs.effect("highlight", {}, 1500);
        // validation failed
        return false
      } else {
        // validation passed
        return true
      }
    });
  }
  
  $.fn.validate_required_input = function() {
    var $input = $(this);
    
    if ($input.val() == "" && !$input.hasClass("failed")) {
      $input.addClass("failed");
      $input.unbind('keyup');
      $input.keyup(function(){ $(this).validate_required_input(); });
    } else if ($input.hasClass("failed")) $input.removeClass("failed");
    
    return this;
  }
  
})(jQuery);

$(document).ready(function(){
  $("form").each(function(){
    $(this).validate_form();
  })
})
