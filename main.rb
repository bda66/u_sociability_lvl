require_relative "./lib/user.rb"
require_relative "./lib/sociability_lvl.rb"

file_path = "#{File.dirname(__FILE__)}"
file_questions = "#{file_path}/data/sociability_lvl_questions.txt"
file_results = "#{file_path}/data/sociability_lvl_results.txt"

begin
  questions = File.readlines(file_questions, encoding: 'UTF-8')
  results = File.readlines(file_results, encoding: 'UTF-8')
rescue SystemCallError => error
  abort "Ошибка чтения файла. #{error.message}"
end

print "Введите ваше имя: "
name = STDIN.gets.chomp
name = "Анончик" if name == ""
user = User.new(name)
user.say_hello

test = SociabilityLvl.new(questions, results)
sleep(3)

test.questions.each do |question|
  system("clear")
  puts question
  puts test.answers
  user_input = STDIN.gets.to_i

  until test.check_user_input(user_input) != false
    user_input = STDIN.gets.to_i
  end

  user.answers << user_input
end

test.check_answers(user.answers)
test.process_results
system("clear")
puts "#{user.name}, вы набрали #{test.result}, ваш результат теста:\n"
puts test.user_result
