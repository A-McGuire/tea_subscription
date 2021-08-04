class SubscriptionsFacade
  class << self
    def format_all_customer_subscriptions(id)
      subscriptions = Subscription.all_customer_subscriptions(id)
      subscriptions_json = subscriptions.map do |subscription|
        {
          title: subscription.title,
          frequency: subscription.frequency,
          price: subscription.price,
          status: subscription.status
        }
      end
      OpenStruct.new(id: nil, subscriptions: subscriptions_json)
    end
  end
end