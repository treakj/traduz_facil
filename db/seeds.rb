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

user = User.create(
  username: 'kenji',
  email: 'teste@gmail.com',
  skill: 'Portuguese',
  first_name: 'Alexandre',
  last_name: 'Tsuchiya',
  password: "123456",
  password_confirmation: "123456",
  admin: true
)
  file = URI.open(Faker::Avatar.image)
  user.photo.attach(io: file, filename: "#{user.username}.png", content_type: 'image/png')

  response = Net::HTTP.get(URI("https://randomuser.me/api/?results=50"))
  datas = JSON.parse(response)
  datas["results"].each do |data|
    user = User.create(
      # username: Faker::Internet.username,
      # email: Faker::Internet.email,
      # skill: Faker::Nation.language,
      # first_name: Faker::Name.first_name,
      # last_name: Faker::Name.last_name,
      username: data["login"]["username"],
      email: data["email"],
      skill: Faker::Nation.language,
      first_name: data["name"]["first"].capitalize,
      last_name: data["name"]["last"].capitalize,

      password: "123456",
      password_confirmation: "123456"
    )
    file = URI.open(data["picture"]["medium"])
    user.photo.attach(io: file, filename: "#{user.username}.png", content_type: 'image/png')
    puts "uploaded " + user.username
end

puts "created user!"
100.times do
  #  Aqui para evitar que haja repeticao entre job e proposta do usuario
  for_job = User.find(User.pluck(:id).sample).id
  for_proposal = User.find(User.pluck(:id).sample).id
  if for_job == for_proposal
    for_job == User.last.id ? for_proposal = User.first.id : for_proposal += 1
    # se for_job e for_proposal forem iguais, entao tem que ver se algum deles e o ultimo
  end

  Job.create(
    content: "Translate #{Faker::Nation.language} to #{Faker::Nation.language}",
    user_id: for_job
  )

  # para que nem todos os jobs tenham alguma proposta
  next unless (0..99).to_a.sample > 50

  # para que nem todos os jobs tenham alguma proposta
  next unless (0..99).to_a.sample > 50

  Proposal.create(
    job_id: Job.last.id, # Job.find(Job.pluck(:id).sample).id,
    user_id: for_proposal, # Job.find(Job.pluck(:id).sample).id,
    status: 'pending',
    price: (50..100).to_a.sample,
    deadline: Faker::Date.forward(days: 23)
  )
end

puts "created proposal and job!"
