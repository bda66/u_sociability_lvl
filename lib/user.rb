class User
  attr_accessor :answers, :name

  def initialize(name)
    @name = name
    @answers = []
  end

  def say_hello
    time = Time.now.hour

    if time >= 6 && time < 10
      hello = 0
    elsif time >= 10 && time < 17
      hello = 1
    elsif time >= 17 && time < 23
      hello = 2
    elsif time == 23 || time < 6
      hello = 3
    end

    hello
  end
end