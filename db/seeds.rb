
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
    name: Faker::Lorem.word,
    user: users.sample,
    url: Faker::Internet.url
  )
end
registered_applications = RegisteredApplication.all

20.times do
  Event.create!(
    name: Faker::Lorem.word,
    registered_application: registered_applications.sample
  )
end
events = Event.all

puts "Seed finished"
puts "#{Event.count} events created"
puts "#{RegisteredApplication.count} registered_applications created"
puts "#{User.count} users created"
