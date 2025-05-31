class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    @recommendation = Recommendation.new
    @book = Book.new
  
    if flash[:tab]
      @active_tab = flash[:tab]
    else
      @active_tab = 'recommended'
    end
  end
end
