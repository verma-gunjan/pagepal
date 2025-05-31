class BooksController < ApplicationController
  before_action :authenticate_user!

  def create
    @book = Book.new(book_params)

    if @book.save
      redirect_to @book, notice: "Book was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def index
    @books = Book.includes(:categories).all
  end

  private

  def book_params
    params.require(:book).permit(:title, :author, category_id: params[:book][:category_id])
  end
end