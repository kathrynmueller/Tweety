// run this function when on the turbolinks:load event (delayed execution till page elements load)
$(document).on('turbolinks:load', function() {
	// line 5 defines the function referred to in line 4
  $('#unfollow_btn').hover(function(){
    $(this).removeClass('btn-default');
    $(this).addClass('btn-danger');
    $(this).html("Unfollow?");
  }, function(){
    $(this).html("Following");
    $(this).removeClass('btn-danger');
    $(this).addClass('btn-default');
  });
})