$(document).ready(function() {
  var counter = 3;
  var form = $('form#new_survey');

  $('.container').on("click", "a#new_choice", function(event) {
    event.preventDefault();
    $('form#new_question').append("<input type='text' name='choice[" + counter + "]' placeholder='Additional Choice' />");
    counter ++ ;
  });

  // $('.container').on("submit", "#new_survey", function(event) {
  //   event.preventDefault();
  //   var url = $('form#new_survey').attr("action");
  //   var data = $('form#new_survey').serialize();
  //   $.post(url, data, function(results) {
  //     var question = $(results).find('.create_question').html();
  //     $('.create_survey').html(question);
  //   });
  // });

  $('.container').on('submit', '#new_question', function(event){
    event.preventDefault();
    var url = $('form#new_question').attr("action");
    var data = $('form#new_question').serialize();
    $.post(url, data, function(results) {
      var question1 = $(results).find('.create_question').html();
      $('.create_question').html(question1);
    });
  });

});

