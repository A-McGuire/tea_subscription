FactoryBot.define do
  factory :tea do
    title { Faker::Superhero.name }
    description { Faker::GreekPhilosophers.quote }
    brew_time { [1,2,3,4,5].sample }
  end
end
