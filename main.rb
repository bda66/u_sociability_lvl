require_relative "./lib/user.rb"
require_relative "./lib/sociability_lvl.rb"

file_path = "#{File.dirname(__FILE__)}"
file_questions = "#{file_path}/data/sociability_lvl_questions.txt"
file_results = "#{file_path}/data/sociability_lvl_results.txt"
file_answers = "#{file_path}/data/sociability_lvl_answers.txt"

begin
  questions = File.readlines(file_questions, encoding: 'UTF-8')
  results = File.readlines(file_results, encoding: 'UTF-8')
  answers = File.readlines(file_answers, encoding: 'UTF-8')
rescue SystemCallError => error
  abort "Ошибка чтения файла. #{error.message}"
end

hello_ru = ["Доброе утро", "Добрый день", "Добрый вечер", "Доброй ночи"]

test = SociabilityLvl.new("Ваш уровень общительности.", questions, results, answers)
system("clear")

puts "\nТест: #{test.name}\n\n"
print "Введите ваше имя: "
name = STDIN.gets.chomp
name = "Анончик" if name == ""

user = User.new(name)
system("clear")

puts "#{hello_ru[user.say_hello]}, #{name}.\n\n"
puts "Тест поможет определить ваш уровень коммуникабельности.\n" \
     "Для этого необходимо ответить на вопросы.\n\n"
sleep(3)

test.questions.each do |question|
  system("clear")
  puts question
  puts test.answers
  user_input = STDIN.gets.to_i

  until test.check_user_input?(user_input) != false
    puts test.answers
    user_input = STDIN.gets.to_i
  end

  user.answers << user_input
end

test.check_answers(user.answers)
test.process_results
system("clear")

puts "#{user.name}, вы набрали #{test.result}, ваш результат теста:\n\n"
puts test.user_result
