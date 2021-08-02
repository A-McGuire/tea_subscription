FactoryBot.define do
  factory :customer_subscriptions do
    subscription_id { 1 }
    tea_id { 1 }
    status { [1,2,3].sample }
  end
end
