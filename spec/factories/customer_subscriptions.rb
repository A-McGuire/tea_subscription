FactoryBot.define do
  factory :customer_subscription do
    subscription_id { 1 }
    customer_id { 1 }
    active { [true, false].sample }
  end
end
