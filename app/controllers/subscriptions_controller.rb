class SubscriptionsController < ApplicationController

  def create
    @subscription = Subscription.new(subscription_params)

    respond_to do |format|
      if @subscription.save
        format.turbo_stream { render :show }
      #  format.html { redirect_to root_path, notice: "Вы успешно подписаны" }
      else
        format.html { redirect_to root_path, notice: "Произошла ошибка :(" }
      end
    end
  end

  private

  def subscription_params
    params.require(:subscription).permit(:email)
  end


end
