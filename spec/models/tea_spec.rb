require 'rails_helper'

RSpec.describe Tea, type: :model do
  context 'validations' do
    it {should validate_presence_of(:title)}
    it {should validate_presence_of(:description)}
    it {should validate_presence_of(:brew_time)}
  end

  context 'relationships' do
    it {should have_many(:drink_subscriptions)}
    it {should have_many(:subscriptions).through(:drink_subscriptions)}
  end
end