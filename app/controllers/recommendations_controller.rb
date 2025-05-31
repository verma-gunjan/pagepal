class RecommendationsController < ApplicationController
    before_action :authenticate_user!

  def new
    @recommendation = Recommendation.new
  end

  def create
    @recommendation = current_user.recommendations.build(recommendation_params)
    if @recommendation.save
      redirect_to user_path(current_user), notice: 'Recommendation added successfully.'
    else
      flash[:tab] = 'recommend'
      flash[:errors] = @recommendation.errors.full_messages
      redirect_to user_path(current_user)
    end
  end

  def index
    @recommendations = Recommendation.includes(:user, :book)
  end

  private

  def recommendation_params
    params.require(:recommendation).permit(:book_id, :text)
  end
end
  