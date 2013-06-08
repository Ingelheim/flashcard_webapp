$(document).ready(function() {

  $('body').on('submit', '#game', function(e){
    e.preventDefault();
    // send a request to controller (via AJAX post)

    // have controller record response (same as it currently does)

    // find out if response was correct or incorrect
    // e.g. var answer = "The answer to the last question was: Correct"

    // insert html string onto page
    // $('.answer').html(answer)

    // get back partial of the new form to put on page (and store it in response, etc.)

    // replace current form with new form
    // $('#game').html(response);
  });

});
