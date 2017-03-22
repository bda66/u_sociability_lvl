require_relative "./lib/user.rb"
require_relative "./lib/sociability_lvl.rb"
require_relative "./lib/test_reader.rb"
file_questions = "data/sociability_lvl_questions.txt"
file_results = "data/sociability_lvl_results.txt"

user = User.new

print "Введите ваше имя: "
user_name = STDIN.gets.chomp

if user_name == ""
  user_name = "Анончик"
end

user.set_name(user_name)
user.say_hello

if File.exist?(file_questions) && File.exist?(file_questions)
  questions = TestReader.new(file_questions).to_array
  results = TestReader.new(file_results).to_array
  test1 = SociabilityLvl.new(questions, results)
  puts test1.show_about
  sleep(3)
else
  abort "Ошибка чтения файла."
end


test1.all_questions.each_with_index { |obj, i|
  system("clear")
  puts test1.get_question(i)
  puts test1.show_test_answers
  user_answer = STDIN.gets.to_i

  until test1.check_answer(user_answer) != false
    user_answer = STDIN.gets.to_i
  end

  user.get_user_answer(user_answer)
}

test1.check_answers(user.show_user_answers)
test1.show_results
