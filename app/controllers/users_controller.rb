class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    @user_recommendations = @user.recommendations.includes(:book).order(created_at: :desc).page(params[:page]).per(6)
    @books = Book.includes(:categories, :book_image_attachment).page(params[:page]).per(6)
    @recommendation = Recommendation.new
    @book = Book.new
  
    # Restore tab on redirect or decide based on validation errors
    if flash[:tab]
      @active_tab = flash[:tab]
    elsif @recommendation.errors.any?
      @active_tab = 'recommend'
    elsif @book.errors.any?
      @active_tab = 'add'
    else
      @active_tab = 'recommended'
    end
  end
end
