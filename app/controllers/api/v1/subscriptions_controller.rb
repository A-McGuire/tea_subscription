class Api::V1::SubscriptionsController < ApplicationController
  def index
    subscriptions = CustomerSubscription.all_customer_subscriptions(params[:id])
  end
end