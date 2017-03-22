class User

  def initialize
    @user_name = "Аноним"
    @user_answers = []
  end

  def set_name(user_name)
    @user_name = user_name
  end

  def show_name
    @user_name
  end

  def get_user_answer(user_answer)
    @user_answers << user_answer
  end

  def show_user_answers
    @user_answers
  end

  def say_hello
    time = Time.now.hour
    hello = ''

    if time >= 6 && time < 10
      hello = "Доброе утро"
    elsif time >= 10 && time < 17
      hello = "Добрый день"
    elsif time >= 17 && time < 23
      hello = "Добрый вечер"
    elsif time == 23 || time < 6
      hello = "Доброй ночи"
    end

    puts "#{hello}, #{@user_name}!\n"
  end
end