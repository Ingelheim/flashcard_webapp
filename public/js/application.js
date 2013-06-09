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
  
  // magnifies links on hover
  $('#history a').hover(function(){
    $(this).css({"font-size" : "20px"})
  },
  function(){
    $(this).css({"font-size" : "15px"})
  }); 

  // This opens and closes the game stats on the user page
  $("#history a").on("click", function(event){
    event.preventDefault()
    var url = $(this).attr("href")

    if($(this).hasClass('clicked')==false){
      $("a").removeClass("clicked")
      $(this).addClass("clicked")
      $.get(url, function(response){
        $("#appended_stats").remove()
        $('.clicked').next().append(response)
      });
 
    } else {
      $("#appended_stats").remove()
      $(this).removeClass("clicked")
    }

  });

  
});


