require 'rails_helper'

RSpec.describe DrinkSubscription, type: :model do
  describe "validations" do
    it { should validate_presence_of(:tea_id) }
    it { should validate_presence_of(:subscription_id) }
    it { should validate_numericality_of(:tea_id) }
    it { should validate_numericality_of(:subscription_id) }
  end

  describe "relationships" do
    it { should belong_to(:tea) }
    it { should belong_to(:subscription) }
  end
end
