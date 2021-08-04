require 'rails_helper'

RSpec.describe CustomerSubscription, type: :model do
  describe "validations" do
    it { should validate_presence_of(:customer_id) }
    it { should validate_presence_of(:subscription_id) }
    it { should validate_numericality_of(:customer_id) }
    it { should validate_numericality_of(:subscription_id) }
  end

  describe "relationships" do
    it { should belong_to(:customer) }
    it { should belong_to(:subscription) }
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
      customer_subscription4 = FactoryBot.create(:customer_subscription, status: :cancelled, customer_id: customer3.id, subscription_id: subscription1.id)
      customer_subscription5 = FactoryBot.create(:customer_subscription, status: :active, customer_id: customer3.id, subscription_id: subscription1.id)
      customer_subscription6 = FactoryBot.create(:customer_subscription, status: :cancelled, customer_id: customer1.id, subscription_id: subscription5.id)

      expect(CustomerSubscription.all_customer_subscriptions(customer1.id)).to eq([customer_subscription6])
      expect(CustomerSubscription.all_customer_subscriptions(customer2.id)).to eq([])
      expect(CustomerSubscription.all_customer_subscriptions(customer3.id)).to eq([customer_subscription4, customer_subscription5])
    end
  end
end 
