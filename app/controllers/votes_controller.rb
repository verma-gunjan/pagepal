class VotesController < ApplicationController
  before_action :authenticate_user!
  def create
    @recommendation = Recommendation.find(params[:recommendation_id])
    @vote = @recommendation.votes.build(user: current_user)
  
    respond_to do |format|
      if @vote.save
        format.turbo_stream
        format.html { redirect_back fallback_location: root_path, notice: "Voted!" }
      else
        format.turbo_stream { render turbo_stream: turbo_stream.replace("vote_flash_#{@recommendation.id}", partial: "votes/error", locals: { recommendation: @recommendation }) }
        format.html { redirect_back fallback_location: root_path, alert: "You already voted." }
      end
    end
  end
end