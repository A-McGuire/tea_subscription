class Api::V1::SubscriptionsController < ApplicationController
  def index
    subscriptions = CustomerSubscription.where(customer_id: params[:id], status: 2)
  end
end