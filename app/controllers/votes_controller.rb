class VotesController < ApplicationController
  before_action :authenticate_user!
  def create
    recommendation = Recommendation.find(params[:recommendation_id])
    vote = recommendation.votes.build(user: current_user)

    if vote.save
      redirect_back fallback_location: root_path, notice: "Vote added!"
    else
      redirect_back fallback_location: root_path, alert: "You already voted."
    end
  end
end
