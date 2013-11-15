$ ->

  newQuestionTemplate = """
    <div class="row question" data-question-index="<%= questionIndex %>">
      <h3>Question <%= questionIndex + 1%> <a class="remove_question btn btn-default" href="#">Remove</a></h3>

      <div class="form-group">
        <label for="quiz_questions_attributes_<%= questionIndex %>_content">Question Content</label>
        <input class="form-control" id="quiz_questions_attributes_<%= questionIndex %>_content" name="quiz[questions_attributes][<%= questionIndex %>][content]" type="text">

        <div class="row">
          <div class="form-group col-sm-9">
            <label for="quiz_questions_attributes_<%= questionIndex %>_answers_attributes_0_content">Answer</label>
            <input class="form-control" id="quiz_questions_attributes_<%= questionIndex %>_answers_attributes_0_content" name="quiz[questions_attributes][<%= questionIndex %>][answers_attributes][0][content]" type="text">
          </div>
          <div class="form-group col-sm-3 correct_checkbox">
            <label for="quiz_questions_attributes_<%= questionIndex %>_answers_attributes_0_correct">Correct?</label>
            <input name="quiz[questions_attributes][<%= questionIndex %>][answers_attributes][0][correct]" type="hidden" value="0"><input id="quiz_questions_attributes_<%= questionIndex %>_answers_attributes_0_correct" name="quiz[questions_attributes][<%= questionIndex %>][answers_attributes][0][correct]" type="checkbox" value="1">
          </div>
        </div>

        <div class="row">
          <div class="form-group col-sm-9">
            <label for="quiz_questions_attributes_<%= questionIndex %>_answers_attributes_1_content">Answer</label>
            <input class="form-control" id="quiz_questions_attributes_<%= questionIndex %>_answers_attributes_1_content" name="quiz[questions_attributes][<%= questionIndex %>][answers_attributes][1][content]" type="text">
          </div>
          <div class="form-group col-sm-3 correct_checkbox">
            <label for="quiz_questions_attributes_<%= questionIndex %>_answers_attributes_1_correct">Correct?</label>
            <input name="quiz[questions_attributes][<%= questionIndex %>][answers_attributes][1][correct]" type="hidden" value="0"><input id="quiz_questions_attributes_<%= questionIndex %>_answers_attributes_1_correct" name="quiz[questions_attributes][<%= questionIndex %>][answers_attributes][1][correct]" type="checkbox" value="1">
          </div>
        </div>

        <div class="row">
          <div class="form-group col-sm-9">
            <label for="quiz_questions_attributes_<%= questionIndex %>_answers_attributes_2_content">Answer</label>
            <input class="form-control" id="quiz_questions_attributes_<%= questionIndex %>_answers_attributes_2_content" name="quiz[questions_attributes][<%= questionIndex %>][answers_attributes][2][content]" type="text">
          </div>
          <div class="form-group col-sm-3 correct_checkbox">
            <label for="quiz_questions_attributes_<%= questionIndex %>_answers_attributes_2_correct">Correct?</label>
            <input name="quiz[questions_attributes][<%= questionIndex %>][answers_attributes][2][correct]" type="hidden" value="0"><input id="quiz_questions_attributes_<%= questionIndex %>_answers_attributes_2_correct" name="quiz[questions_attributes][<%= questionIndex %>][answers_attributes][2][correct]" type="checkbox" value="1">
          </div>
        </div>

        <div class="row">
          <div class="form-group col-sm-9">
            <label for="quiz_questions_attributes_<%= questionIndex %>_answers_attributes_3_content">Answer</label>
            <input class="form-control" id="quiz_questions_attributes_<%= questionIndex %>_answers_attributes_3_content" name="quiz[questions_attributes][<%= questionIndex %>][answers_attributes][3][content]" type="text">
          </div>
          <div class="form-group col-sm-3 correct_checkbox">
            <label for="quiz_questions_attributes_<%= questionIndex %>_answers_attributes_3_correct">Correct?</label>
            <input name="quiz[questions_attributes][<%= questionIndex %>][answers_attributes][3][correct]" type="hidden" value="0"><input id="quiz_questions_attributes_<%= questionIndex %>_answers_attributes_3_correct" name="quiz[questions_attributes][<%= questionIndex %>][answers_attributes][3][correct]" type="checkbox" value="1">
          </div>
        </div>

      </div>
    </div>
  """

  $(".add_question").on click: (event) ->
    event.preventDefault()
    questionIndex = $(".question").last().data("question-index") + 1
    $(".question").last().after(_.template(newQuestionTemplate)(questionIndex: questionIndex))

  $("body").on "click", ".remove_question", (event) ->
    event.preventDefault()
    unless $(".question").length is 1
      $(@).parents(".question").remove()
    else
      alert "Can't remove the last question!"
