class BooksController < ApplicationController
  before_action :authenticate_user!
  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to user_path(current_user), notice: 'Book added successfully.'
    else
      flash[:tab] = 'add'
      flash[:errors] = @book.errors.full_messages
      redirect_to user_path(current_user)
    end
  end

  def index
    @books = Book.includes(:categories, :book_image_attachment).page(params[:page]).per(6)
  end

  private

  def book_params
    params.require(:book).permit(:title, :author, :book_image, category_ids: [])
  end
end