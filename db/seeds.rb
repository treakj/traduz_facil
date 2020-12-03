# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Proposal.destroy_all
Job.destroy_all
User.destroy_all

User.create(
  username: 'kenji',
  email: 'teste@gmail.com',
  skill: 'Portuguese',
  first_name: 'Alexandre',
  last_name: 'Tsuchiya',
  password: "123456",
  password_confirmation: "123456",
  admin: true
)

200.times do
  User.create(
    username: Faker::Internet.username,
    email: Faker::Internet.email,
    skill: Faker::Nation.language,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    password: "123456",
    password_confirmation: "123456"
  )
  puts "created user #{User.last.username}"
end

50.times do
  Job.create(
    content: "translate #{Faker::Nation.language} to #{Faker::Nation.language}",
    user_id: User.find(User.pluck(:id).sample).id
  )
  puts "created job #{Job.last.content}"

  Proposal.create(
    job_id: Job.last.id, # Job.find(Job.pluck(:id).sample).id,
    status: 'pending',
    price: (50..100).to_a.sample,
    deadline: Faker::Date.forward(days: 23)
  )
  puts "created proposal #{Proposal.last.status}"
end
