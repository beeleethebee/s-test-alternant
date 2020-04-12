# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# User
unless User.find_by(login: 'admin')
  User.create login: 'admin', password: 'admin', role: 'admin', points: 42
  (0...10).each do |i|
    User.create login: "user#{i}", password: "user#{i}", points: rand(100)
  end
  puts "An admin user was created at admin:admin"
  puts "10 randoms users were created"
end

#Difficulty
unless Difficulty.find_by(name: "Tutoriel")
  diff_names = %w(Tutoriel Facile Moyen Difficile Insurmontable Impossible)
  (0...diff_names.length).each do |i|
    Difficulty.create name: diff_names[i], points:i*10
  end
  puts "6 difficulties were created"
end

#Question

unless Question.find_by(name: "Question0")
  (0...15).each do |i|
    Question.create name:"Question#{i}", good_answer:'Answer1', bad_answer1:'Answer2', bad_answer2:'Answer3', bad_answer3:'Answer3'
  end
  puts "15 questions were created"
end
# Quizz
(0...10).each do |i|
  questions = []
  3.times do
    questions.append(Question.order(Arel.sql('RANDOM()')).first.id)
  end
    Quizz.create title:"Quizz#{i}", difficulty_id: Difficulty.order(Arel.sql('RANDOM()')).first.id ,
               question_1_id: questions[0], question_2_id: questions[1], question_3_id: questions[2],
               display:true
end
puts "10 quizzs were created"

puts "Seed ended, your database is ready now :)"



