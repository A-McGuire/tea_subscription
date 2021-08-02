FactoryBot.define do
  factory :subscription do
    title { "#{Faker::Artisrt.name} collection" }
    frequency { 1 }
    price { "9.99" }
  end
end
