class BooksController < ApplicationController

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to books_path
  end

  def index
    @book = Book.new
    @books = Book.all
    @user = current_user
  end


  def show
    @user = User.find(params[:id])
    @books = @user.books
  end

  def edit
  end


  private

  def book_params
    params.require (:book).permit(:user_id, :title, :body)
  end


end
