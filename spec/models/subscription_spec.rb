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
end