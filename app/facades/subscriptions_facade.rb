class SubscriptionsFacade
  class << self
    def format_all_customer_subscriptions(id)
      subscriptions = Subscription.all_customer_subscriptions(id)
      subscriptions_json = subscriptions.map do |subscription|
        {
          title: subscription.title,
          frequency: subscription.frequency,
          price: subscription.price,
          active: subscription.active
        }
      end
      OpenStruct.new(id: nil, subscriptions: subscriptions_json)
    end

    def update_subscription(params)
      case params[:operation]
      when 'subscribe'
        customer_subscription = CustomerSubscription.find_or_create_by(customer_id: params[:customer_id], subscription_id: params[:subscription_id])
        customer_subscription.active = true
        true if customer_subscription
      when 'cancel'
        customer_subscription = CustomerSubscription.find_by(customer_id: params[:customer_id], subscription_id: params[:subscription_id])
        customer_subscription.update(active: :false)
        return true if customer_subscription.active == false
        false
      end
    end
  end
end