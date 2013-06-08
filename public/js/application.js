// $(document).ready(function() {
//   $("#history a").on("click", function(event){
//     event.preventDefault()
//     var url = $(this).attr("href")
//     $(this).addClass("clicked")
//     $.get(url, function(response){
//       $(".container").append(response)
//     });
//   });
// });


$(document).ready(function() {
  $("#history a").on("click", function(event){
    event.preventDefault()
    var url = $(this).attr("href")

    if($(this).hasClass('clicked')==false){
      $(this).addClass("clicked")
      $.get(url, function(response){
        $(".container").append(response)
      });

    } else {
      $("#appended_stats").remove()
      $(this).removeClass("clicked")
    }

  });
});


