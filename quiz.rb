# Викторина с баллами
# Давайте отрефакторим нашу мини-викторину и добавим новый функционал.
# Создайте папку data, и положите в неё 5-7 текстовых файлов. Теперь, кроме вопроса, и ответа, в каждом файле третьей строкой лежит число баллов, которые получит юзер за правильный ответ на этот вопрос. Пример файла:
# Напишите класс «Вопрос», у экземпляров которого есть переменные: текст вопроса, текст ответа и количество баллов.
# Дальше сделайте так, чтобы программа читала все вопросы из папки data, выбирала из них случайным образом 5 и задавала бы их пользователю. Задав вопрос, программа ждет ответа пользователя в консоли и говорит, правильно ли он ответил.
# Если ответ верный — программа добавляет баллы за вопрос к счету пользователя, а если неверный — сообщает правильный ответ.
# В конце программа должна написать, сколько правильных ответов дал пользователь и сколько баллов он набрал.

if Gem.win_platform?
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__
  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end

require_relative 'lib/question'

all_files = Dir[File.join(__dir__, 'data', '*.txt')].sample(5)
filenames = all_files.map { |filename| File.readlines(filename, chomp: true)}

user_points = []

filenames.each do |file|

  question = Question.new(file[0], file[1], file[2])

  puts question

  question.user_answer = STDIN.gets.chomp

  if question.right_answer?
    puts 'Верный ответ!'
  else
    puts "Неправильно. Правильный ответ: #{question.answer}"
  end

  user_points << question.points
end

right_answer_count = user_points.count(&:positive?)

puts
puts "Правильных ответов: #{right_answer_count} из 5"
puts "Количество набранных баллов #{user_points.sum}"
