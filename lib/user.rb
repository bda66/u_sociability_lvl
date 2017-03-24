class User
  attr_accessor :answers, :name

  def initialize(name)
    @name = name
    @answers = []
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

    puts "#{hello}, #{@name}!\n\n"
  end
end