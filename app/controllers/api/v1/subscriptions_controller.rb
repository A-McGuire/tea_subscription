class Api::V1::SubscriptionsController < ApplicationController
  def index
    subscriptions = SubscriptionsFacade.format_all_customer_subscriptions(params[:id])

    render json: SubscriptionsSerializer.new(subscriptions).serializable_hash
  end
end