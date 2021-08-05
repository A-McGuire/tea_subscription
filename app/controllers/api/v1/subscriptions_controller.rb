class Api::V1::SubscriptionsController < ApplicationController
  def index
    return render status: :unprocessable_entity unless params[:id]
    subscriptions = SubscriptionsFacade.format_all_customer_subscriptions(params[:id])

    render json: SubscriptionsSerializer.new(subscriptions).serializable_hash
  end

  def update
    return render status: :unprocessable_entity unless params[:operation] && params[:subscription_id]
    updated_subscription = SubscriptionsFacade.update_subscription({customer_id: params[:id], operation: params[:operation], subscription_id: params[:subscription_id]})

    updated_subscription ? (render status: :no_content) : (render status: :bad_request)
  end
end