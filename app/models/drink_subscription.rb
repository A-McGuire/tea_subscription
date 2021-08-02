class DrinkSubscription < ApplicationRecord
  validates :tea_id, presence: true, numericality: true
  validates :subscription_id, presence: true, numericality: true

  belongs_to :tea
  belongs_to :subscription
end
