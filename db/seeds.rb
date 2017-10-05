
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

200.times do
  Event.create!(
    name: Faker::Lorem.sentence,
    registered_application: registered_applications.sample,
    created_at: Faker::Date.between(10.days.ago, Date.today)
  )
end
events = Event.all

puts "Seed finished"
puts "#{Event.count} events created"
puts "#{RegisteredApplication.count} registered_applications created"
puts "#{User.count} users created"
