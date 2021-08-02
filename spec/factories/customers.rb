FactoryBot.define do
  factory :customer do
    first_name { Faker::Games::Pokemon.name }
    last_name { Faker::Food.fruits }
    email { "123@email.com" }
    street { "123 St" }
    city { Faker::Games::Pokemon.location }
    state { "State" }
    zip { 12345 }
    unit { "123 My Unit" }
  end
end
