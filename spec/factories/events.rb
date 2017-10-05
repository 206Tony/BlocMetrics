FactoryGirl.define do
  factory :event do
    name "MyString"
    registered_application nil
    created_at Faker::Date.between(2.days.ago, Date.today)
  end
end
