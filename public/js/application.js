$(document).ready(function() {
  $("#create_event_button").on("click", function(event){
    event.preventDefault();
    var data = this.serialize();
    $.post('/create_event', data, function(response) {
      $("#created_events_box").append($("#first-question").html());

    })


  });
});