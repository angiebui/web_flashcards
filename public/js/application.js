$(document).on('ready', function() {
	//Store the total number of questions
  var totalQuestions = $('.flash').size();

  //Set the current question to display to 1
  var currentQuestion = 0;

  //Store the selector in a variable.
  $questions = $('.flash');
  console.log($questions);

  //Hide all the questions
  $questions.hide();

  //Show the first question
  $($questions.get(currentQuestion)).show();

	$('.button').on('click', function(e) {
		e.preventDefault();

		$(this).closest('form').hide();

		// $('.answer-form').toggle();
		// $('.buckets').toggle();
		$('.flip').find('.card').addClass('flipped')

		$.ajax({
			url: $(this).closest('form').attr('action'),
			method: $(this).closest('form').attr('method'),
			data: $(this).closest('form').serialize()
		}).done(function(data_server) {
      var result = $.parseJSON(data_server)
      //Hide the answer form
      // $(this).closest('form').hide();

      //Update and show check-answer div
      if (currentQuestion == totalQuestions - 1) {
        $('.game-over').show()
      } else {
        $('.response').html(result.check)
        $('.score').html(result.score);
        $('.check-answer').show();
      }
		}).fail(function(jqXHR, textStatus, errorThrown) {
	    console.log(errorThrown);
	  }).always(function(){
	    console.log("always on")
	  });
	});

  $('#next').click(function () {
  	$('.flip').find('.card').removeClass('flipped')
  	$(this).closest('.check-answer').hide()

    $($questions.get(currentQuestion)).hide()

    //increment the current question by one
    currentQuestion = currentQuestion + 1;

    //if there are no more questions do stuff
    if (currentQuestion > totalQuestions) {
      //Game over.. Do stuff..
      console.log('Game Over!');
    } else {
      //otherwise show the next question
      $($questions.get(currentQuestion)).show();
    }
  });
});