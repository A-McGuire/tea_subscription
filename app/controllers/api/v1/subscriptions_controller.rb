class Api::V1::SubscriptionsController < ApplicationController
  def index
    subscriptions = Subscription.all_customer_subscriptions(params[:id])
  end
end