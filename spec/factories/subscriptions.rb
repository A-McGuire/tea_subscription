FactoryBot.define do
  factory :subscription do
    title { Faker::Books::CultureSeries.culture_ship }
    frequency { [1,2,3,4].sample }
    price { "9.99" }
  end
end
