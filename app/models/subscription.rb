class Subscription < ApplicationRecord
  validates :title, presence: true
  validates :frequency, presence: true
  validates :price, presence: true

  has_many :drink_subscriptions, dependent: :destroy
  has_many :teas, through: :drink_subscriptions

  has_many :customer_subscriptions, dependent: :destroy
  has_many :customers, through: :customer_subscriptions

    class << self
    def all_customer_subscriptions(id)
      joins(:customer_subscriptions)
      .select('subscriptions.*, customer_subscriptions.active')
      .where("customer_subscriptions.customer_id = ?", id)
    end
  end
end
