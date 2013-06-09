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
    $(this).css({"font-size" : "20px"});
  },
  function(){
    $(this).css({"font-size" : "15px"});
  }); 

  // This opens and closes the game stats on the user page
  $("#history a").on("click", function(event){
    event.preventDefault()
    var url = $(this).attr("href");

    if($(this).hasClass('clicked')==false){
      $("a").removeClass("clicked");
      $(this).addClass("clicked");
      $.get(url, function(response){
        $("#appended_stats").remove();
        $('.clicked').next().append(response);
      });
 
    } else {
      $("#appended_stats").remove();
      $(this).removeClass("clicked")
    }
  });

  $('#game').on('submit', function(event){
    event.preventDefault();
    var url = $(this).attr('action');
    var data = $(this).serialize();
    $.post(url, data, function(response){
      $('.container').html();
      $('.container').html(response);

    });
  });

  $('.logout a').on('click', function(e){
    e.preventDefault();
    var url = $(this).attr('href');
    $.get(url, function(response){
      $('.links').hide();
      $('#image_holder').html(response);
    });
  });

  $('#create_user').on('submit', function(e){
    e.preventDefault();
    var url = $(this).attr('action');
    var data = $(this).serialize();
    $.post(url, data, function(response){
      $('#image_holder').html(response);
    });
  });
  
  $('#login_user').on('submit', function(e){
    e.preventDefault();
    var url = $(this).attr('action');
    var data = $(this).serialize();
    $.post(url, data, function(response){
      
      $('html').html(response);
    });
  });

  $('#choose_deck').on('select', function(e){
    e.preventDefault();
  });
});


