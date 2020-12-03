# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times do
  User.create(
    username: Faker::Internet.username,
    email: Faker::Internet.email,
    skill: Faker::Nation.language,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name
  )
  puts "created user"
end

20.times do
  Job.create(
    content: "translate #{Faker::Nation.language} to #{Faker::Nation.language}",
    user_id: (0..9).to_a.sample
  )
  puts "created job"
end

50.times do
  Proposal.create(
    job_id: (0..19).to_a.sample,
    status: 'pending',
    price: (50..100).to_a.sample,
    deadline: Faker::Date.forward(days: 23)
  )
  puts "created proposal"
end
