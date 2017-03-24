class SociabilityLvl
  attr_reader :user_result, :questions, :about, :result, :answers

  def initialize(questions, results)
    @questions = questions
    @results = results
    @name = "Ваш уровень общительности."
    @answers = "1 - да.\n2 - нет.\n3 - иногда.\n\n"
    @user_result = ""
  end

  def check_answers(user_answers)
    @result = 0
    user_answers.each do |i|
      if user_answers[i] == 1
        @result += 2
      elsif user_answers[i] == 2
        @result += 0
      elsif user_answers[i] == 3
        @result += 1
      end
    end
  end

  def process_results
    case @result
    when 30..32
      @user_result = @results[0]
    when 25..29
      @user_result = @results[1]
    when 19..24
      @user_result = @results[2]
    when 14..18
      @user_result = @results[3]
    when 9..13
      @user_result = @results[4]
    when 4..8
      @user_result = @results[5]
    when 0..3
      @user_result = @results[6]
    end
  end


  def check_user_input(user_input)
    if user_input == 1 || user_input == 2 || user_input == 3
      true
    else
      puts "Введите 1, 2 или 3 в зависимости от выбранного вами ответа"
      false
    end
  end
end