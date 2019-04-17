FactoryBot.define do
  factory :user do
    user_name { Faker::Name.name }
    phone Faker::PhoneNumber
    password 'foobar'
  end
end