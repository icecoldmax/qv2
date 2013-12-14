$ ->
  newQuestionTemplate = """
    <div class="row question" data-question-index="<%= questionIndex %>">
      <h3>Question <span class="question_number"></span><a class="remove_question btn btn-default" href="#">Remove</a></h3>

      <div class="form-group">
        <label for="quiz_questions_attributes_<%= questionIndex %>_content">Question Content</label>
        <input class="form-control" id="quiz_questions_attributes_<%= questionIndex %>_content" name="quiz[questions_attributes][<%= questionIndex %>][content]" type="text">

        <div class="row answer">
          <div class="form-group col-xs-9">
            <label for="quiz_questions_attributes_<%= questionIndex %>_answers_attributes_0_content">Answer</label>
            <input class="form-control" id="quiz_questions_attributes_<%= questionIndex %>_answers_attributes_0_content" name="quiz[questions_attributes][<%= questionIndex %>][answers_attributes][0][content]" type="text">
          </div>
          <div class="form-group col-xs-3 correct_checkbox">
            <label for="quiz_questions_attributes_<%= questionIndex %>_answers_attributes_0_correct">Correct?</label>
            <input name="quiz[questions_attributes][<%= questionIndex %>][answers_attributes][0][correct]" type="hidden" value="0"><input id="quiz_questions_attributes_<%= questionIndex %>_answers_attributes_0_correct" name="quiz[questions_attributes][<%= questionIndex %>][answers_attributes][0][correct]" type="checkbox" value="1">
          </div>
        </div>

        <div class="row answer">
          <div class="form-group col-xs-9">
            <label for="quiz_questions_attributes_<%= questionIndex %>_answers_attributes_1_content">Answer</label>
            <input class="form-control" id="quiz_questions_attributes_<%= questionIndex %>_answers_attributes_1_content" name="quiz[questions_attributes][<%= questionIndex %>][answers_attributes][1][content]" type="text">
          </div>
          <div class="form-group col-xs-3 correct_checkbox">
            <label for="quiz_questions_attributes_<%= questionIndex %>_answers_attributes_1_correct">Correct?</label>
            <input name="quiz[questions_attributes][<%= questionIndex %>][answers_attributes][1][correct]" type="hidden" value="0"><input id="quiz_questions_attributes_<%= questionIndex %>_answers_attributes_1_correct" name="quiz[questions_attributes][<%= questionIndex %>][answers_attributes][1][correct]" type="checkbox" value="1">
          </div>
        </div>

        <div class="row answer">
          <div class="form-group col-xs-9">
            <label for="quiz_questions_attributes_<%= questionIndex %>_answers_attributes_2_content">Answer</label>
            <input class="form-control" id="quiz_questions_attributes_<%= questionIndex %>_answers_attributes_2_content" name="quiz[questions_attributes][<%= questionIndex %>][answers_attributes][2][content]" type="text">
          </div>
          <div class="form-group col-xs-3 correct_checkbox">
            <label for="quiz_questions_attributes_<%= questionIndex %>_answers_attributes_2_correct">Correct?</label>
            <input name="quiz[questions_attributes][<%= questionIndex %>][answers_attributes][2][correct]" type="hidden" value="0"><input id="quiz_questions_attributes_<%= questionIndex %>_answers_attributes_2_correct" name="quiz[questions_attributes][<%= questionIndex %>][answers_attributes][2][correct]" type="checkbox" value="1">
          </div>
        </div>

        <div class="row answer">
          <div class="form-group col-xs-9">
            <label for="quiz_questions_attributes_<%= questionIndex %>_answers_attributes_3_content">Answer</label>
            <input class="form-control" id="quiz_questions_attributes_<%= questionIndex %>_answers_attributes_3_content" name="quiz[questions_attributes][<%= questionIndex %>][answers_attributes][3][content]" type="text">
          </div>
          <div class="form-group col-xs-3 correct_checkbox">
            <label for="quiz_questions_attributes_<%= questionIndex %>_answers_attributes_3_correct">Correct?</label>
            <input name="quiz[questions_attributes][<%= questionIndex %>][answers_attributes][3][correct]" type="hidden" value="0"><input id="quiz_questions_attributes_<%= questionIndex %>_answers_attributes_3_correct" name="quiz[questions_attributes][<%= questionIndex %>][answers_attributes][3][correct]" type="checkbox" value="1">
          </div>
        </div>
      </div>
    </div>
  """

  window.setQuestionNumbers = ->
    question_number_spans = $(".question:visible span.question_number")
    for span, i in question_number_spans
      $(span).text("#{i + 1}")

  setQuestionNumbers()

  $(".add_question").on click: (event) ->
    event.preventDefault()
    questionIndex = $(".question").last().data("question-index") + 1
    $(".question").last().after(_.template(newQuestionTemplate)(questionIndex: questionIndex))
    setQuestionNumbers()

  $("body").on "click", ".remove_question", (event) ->
    event.preventDefault()

    unless $(".question:visible").length is 1
      question = $($(@).parents(".question"))
      destroy_field = $(question.find("input[type=hidden].destroy"))
      if destroy_field.length > 0
        destroy_field.val("1")
        question.hide()
      else
        question.remove()

      setQuestionNumbers()
    else
      alert "Can't remove the last question!"

  $(".correct_checkbox input[type=checkbox]").on "change",  ->
    $(@).parents(".answer").siblings().each ->
      $(@).find("input[type=checkbox]").prop("checked", false)
