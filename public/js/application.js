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

  $('#game').on('click', '.button', function(event){
    event.preventDefault();
    var url = $('form').attr('action');
    var data = $('form').serialize();
    $.post(url, data, function(response){
      $('.container').html('');
      $('#image_holder').html(response);

    });
  });

  $('.logout a').on('click', function(e){
    e.preventDefault();
    var url = $(this).attr('href');
    $.get(url, function(response){
      $('.links').hide();
      $('.container').remove();
      $('#image_holder').html(response);
    });
  });

  $('.user_page a').on('click', function(e){
    e.preventDefault();
    var url = $(this).attr('href');
    $.get(url, function(response){
      $('.container').remove();
      $('#image_holder').after(response);
    });
  });

  $('#create_user').on('submit', function(e){
    e.preventDefault();
    var url = $(this).attr('action');
    var data = $(this).serialize();
    $.post(url, data, function(response){
      $('.container').remove();
      $('#image_holder').after(response);
    });
  });
  
  $('#login_user').on('submit', function(e){
    e.preventDefault();
    var url = $(this).attr('action');
    var data = $(this).serialize();
    $.post(url, data, function(response){
      $('.container').remove();
      $('#image_holder').after(response);
    });
  });

  $('.select_deck').on('change', function(e){
    e.preventDefault();
    var url = $(this).val();
    $.get(url, function(response){
      $(".container").remove();
      $('#image_holder').html(response);
    });
  });

  $('.new_game a').on('click', function(e){
    e.preventDefault();
    var url = $(this).attr('href');
    $.get(url, function(response){
      $(".container").remove();
      $('#image_holder').after(response);
    });
  });


});


