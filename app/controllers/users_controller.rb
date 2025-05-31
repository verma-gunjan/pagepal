class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    @books = Book.includes(:categories, :book_image_attachment).all
    @recommendation = Recommendation.new
    @book = Book.new
  
    if flash[:tab]
      @active_tab = flash[:tab]
    else
      @active_tab = 'recommended'
    end
  end
end
