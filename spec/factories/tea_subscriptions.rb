FactoryBot.define do
  factory :tea_subscriptions do
    subscription_id { 1 }
    tea_id { 1 }
    status { [1,2,3] }
  end
end
