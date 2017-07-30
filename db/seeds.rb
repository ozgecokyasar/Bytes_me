# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Answer.destroy_all
Drill.destroy_all
DrillGroup.destroy_all


i ||= 0;
while i < 20 do
  u = User.create(
  first_name: Faker::Superhero.name,
  last_name: Faker::Superhero.name,
  email: "#{i}@email.com",
  password: "supersecret",
  is_admin?: false)
  i = i + 1;
end


5.times do
  dg = DrillGroup.create(
  drill_group_name: Faker::Hacker.adjective,
  difficulty: ['easy','medium','hard'].sample
  )

50.times do
  d = Drill.create(
  title: Faker::Hacker.say_something_smart,
  points: 0,
  drill_group_id: dg.id
  )

  3.times do
    a = Answer.create(
    body: Faker::ChuckNorris.fact,
    is_correct: false,
    drill_id: d.id
    )
  end

  a = Answer.create(
  body: Faker::ChuckNorris.fact,
  is_correct: true,
  drill_id: d.id
  )
end
end
