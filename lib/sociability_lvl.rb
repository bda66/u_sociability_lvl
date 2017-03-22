class SociabilityLvl

  def initialize(questions, results)
    @questions = questions
    @results = results
    @name = "Ваш уровень общительности."
    @about = "Тест поможет определить ваш уровень коммуникабельности.\n" \
             "Для этого необходимо ответить на вопросы.\n\n"
    @test_size = @questions.size
    @result = 0
    @test_answers = "1 - да.\n2 - нет.\n3 - иногда.\n\n"
  end

  def check_answers(user_answers)
    @result = 0
    for i in 0..user_answers.size
      if user_answers[i] == 1
        @result += 2
      elsif user_answers[i] == 2
        @result += 0
      elsif user_answers[i] == 3
        @result += 1
      end
    end
  end

  def show_results
    puts "Вы набрали #{@result}, ваш результат теста:\n"
    case @result
    when 30..32
      puts @results[0]
    when 25..29
      puts @results[1]
    when 19..24
      puts @results[2]
    when 14..18
      puts @results[3]
    when 9..13
      puts @results[4]
    when 4..8
      puts @results[5]
    when 0..3
      puts @results[6]
    end
  end

  def get_question(num)
    @questions[num]
  end

  def all_questions
    @questions
  end

  def show_test_size
    @test_size
  end

  def show_test_answers
    @test_answers
  end

  def show_about
    @about
  end

  def check_answer(user_answer)
    if (user_answer == 1 || user_answer == 2 || user_answer == 3)
      return true
    else
      puts "Введите 1, 2 или 3 в зависимости от выбранного вами ответа"
      return false
    end
  end
end