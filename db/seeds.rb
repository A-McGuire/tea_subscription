require 'factory_bot_rails'

Tea.destroy_all 
Customer.destroy_all
Subscription.destroy_all

customer1 = FactoryBot.create(:customer)
customer2 = FactoryBot.create(:customer)
customer3 = FactoryBot.create(:customer)
customer4 = FactoryBot.create(:customer)
customer5 = FactoryBot.create(:customer)

tea1 = FactoryBot.create(:tea)
tea2 = FactoryBot.create(:tea)
tea3 = FactoryBot.create(:tea)
tea4 = FactoryBot.create(:tea)
tea5 = FactoryBot.create(:tea)

subscription1 = FactoryBot.create(:subscription)
subscription2 = FactoryBot.create(:subscription)
subscription3 = FactoryBot.create(:subscription)
subscription4 = FactoryBot.create(:subscription)
subscription5 = FactoryBot.create(:subscription)

drink_subscription1 = FactoryBot.create(:drink_subscription, tea_id: tea1.id, subscription_id: subscription1.id)
drink_subscription2 = FactoryBot.create(:drink_subscription, tea_id: tea2.id, subscription_id: subscription2.id)
drink_subscription3 = FactoryBot.create(:drink_subscription, tea_id: tea3.id, subscription_id: subscription3.id)
drink_subscription4 = FactoryBot.create(:drink_subscription, tea_id: tea4.id, subscription_id: subscription4.id)
drink_subscription5 = FactoryBot.create(:drink_subscription, tea_id: tea5.id, subscription_id: subscription5.id)

customer_subscription1 = FactoryBot.create(:customer_subscription, status: 1, customer_id: customer1.id, subscription_id: subscription1.id)
customer_subscription2 = FactoryBot.create(:customer_subscription, status: 1, customer_id: customer2.id, subscription_id: subscription2.id)
customer_subscription3 = FactoryBot.create(:customer_subscription, status: 1, customer_id: customer1.id, subscription_id: subscription3.id)
customer_subscription4 = FactoryBot.create(:customer_subscription, status: 2, customer_id: customer2.id, subscription_id: subscription4.id)
customer_subscription5 = FactoryBot.create(:customer_subscription, status: 2, customer_id: customer2.id, subscription_id: subscription5.id)
customer_subscription6 = FactoryBot.create(:customer_subscription, status: 2, customer_id: customer3.id, subscription_id: subscription1.id)
customer_subscription7 = FactoryBot.create(:customer_subscription, status: 3, customer_id: customer4.id, subscription_id: subscription2.id)
customer_subscription8 = FactoryBot.create(:customer_subscription, status: 3, customer_id: customer4.id, subscription_id: subscription3.id)
customer_subscription9 = FactoryBot.create(:customer_subscription, status: 3, customer_id: customer5.id, subscription_id: subscription4.id)
customer_subscription10 = FactoryBot.create(:customer_subscription, status: 3, customer_id: customer1.id, subscription_id: subscription5.id)