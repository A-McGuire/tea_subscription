class Tea < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true
  validates :brew_time, presence: true

  has_many :drink_subscriptions, dependent: :destroy
  has_many :subscriptions, through: :drink_subscriptions
end

