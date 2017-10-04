
require 'random_data'
require 'faker'

5.times do
  User.create!(
    email: Faker::Internet.email,
    password: Faker::Internet.password
  )
end
users = User.all


10.times do
  RegisteredApplication.create!(
    name: Faker::Lorem.sentence,
    user: users.sample,
    url: Faker::Internet.url
  )
end
registered_applications = RegisteredApplication.all

20.times do
  Event.create!(
    name: Faker::Lorem.sentence,
    registered_application: registered_applications.sample
  )
end
events = Event.all

# member = User.create!(
#   email: 'member@example.com',
#   password: 'helloworld',
#   password_confirmation: 'helloworld',
#   confirmed_at: Time.now
# )

# member = User.create!(
#   email: 'admin@example.com',
#   password: 'helloworld',
#   password_confirmation: 'helloworld',
#   confirmed_at: Time.now,
#   role: 'admin'
# )

puts "Seed finished"
puts "#{Event.count} events created"
puts "#{RegisteredApplication.count} registered_applications created"
puts "#{User.count} users created"
