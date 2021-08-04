class CustomerSubscription < ApplicationRecord
  validates :customer_id, presence: true, numericality: true
  validates :subscription_id, presence: true, numericality: true

  enum status: [:inactive, :active, :cancelled], _default: :inactive

  belongs_to :customer
  belongs_to :subscription

  class << self
    def all_customer_subscriptions(id)
      where(customer_id: id, status: :active)
      .or(self.where(customer_id: id, status: :cancelled))
    end
  end
end
