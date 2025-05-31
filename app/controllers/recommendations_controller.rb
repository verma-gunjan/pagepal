class RecommendationsController < ApplicationController
    before_action :authenticate_user!

  def create
    @recommendation = Recommendation.new(recommendation_params)
    @recommendation.user = current_user # ensures ownership

    if @recommendation.save
      redirect_to book_path(@recommendation.book), notice: "Recommendation posted successfully."
    else
      flash.now[:alert] = "There was a problem with your recommendation."
      render :new, status: :unprocessable_entity
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
  