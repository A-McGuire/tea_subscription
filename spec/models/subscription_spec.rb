require 'rails_helper'

RSpec.describe Subscription, type: :model do
  context 'validations' do
    it {should validate_presence_of(:title)}
    it {should validate_presence_of(:frequency)}
    it {should validate_presence_of(:price)}
  end

  context 'relationships' do
    it {should have_many(:drink_subscriptions)}
    it {should have_many(:teas).through(:drink_subscriptions)}
    
    it {should have_many(:customer_subscriptions)}
    it {should have_many(:customers).through(:customer_subscriptions)}
  end

  context 'class methods' do
    it 'all_customer_subscriptions' do
      customer1 = FactoryBot.create(:customer)
      customer2 = FactoryBot.create(:customer)
      customer3 = FactoryBot.create(:customer)
      customer4 = FactoryBot.create(:customer)
      customer5 = FactoryBot.create(:customer)

      subscription1 = FactoryBot.create(:subscription)
      subscription2 = FactoryBot.create(:subscription)
      subscription3 = FactoryBot.create(:subscription)
      subscription4 = FactoryBot.create(:subscription)
      subscription5 = FactoryBot.create(:subscription)

      customer_subscription1 = FactoryBot.create(:customer_subscription, status: :inactive, customer_id: customer1.id, subscription_id: subscription1.id)
      customer_subscription2 = FactoryBot.create(:customer_subscription, status: :inactive, customer_id: customer2.id, subscription_id: subscription2.id)
      customer_subscription3 = FactoryBot.create(:customer_subscription, status: :inactive, customer_id: customer1.id, subscription_id: subscription3.id)
      customer_subscription4 = FactoryBot.create(:customer_subscription, status: :cancelled, customer_id: customer3.id, subscription_id: subscription4.id)
      customer_subscription5 = FactoryBot.create(:customer_subscription, status: :active, customer_id: customer3.id, subscription_id: subscription5.id)
      customer_subscription6 = FactoryBot.create(:customer_subscription, status: :cancelled, customer_id: customer1.id, subscription_id: subscription5.id)

      expect(Subscription.all_customer_subscriptions(customer1.id)).to eq([subscription5])
      expect(Subscription.all_customer_subscriptions(customer2.id)).to eq([])
      expect(Subscription.all_customer_subscriptions(customer3.id)).to eq([subscription4, subscription5])
    end
  end
end