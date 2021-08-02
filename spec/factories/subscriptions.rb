FactoryBot.define do
  factory :subscription do
    title { Faker::SuperHero.name }
    frequency { 1 }
    price { "9.99" }
  end
end
