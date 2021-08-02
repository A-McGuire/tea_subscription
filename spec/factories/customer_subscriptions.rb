FactoryBot.define do
  factory :customer_subscription do
    subscription_id { 1 }
    customer_id { 1 }
    status { [1,2,3].sample }
  end
end
