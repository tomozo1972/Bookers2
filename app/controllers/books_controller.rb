class BooksController < ApplicationController

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice]="you have created book successfully."
      redirect_to books_path(@book)
    else
      @user = current_user
      @books = book.all
      render :index
    end
  end

  def index
    @book = Book.new
    @books = Book.all
    @user = current_user
  end


  def show
    @newbook = book.new
    @book = Book.find(params[:id])
    @user = @book.user
  end

  def edit
    @book = book.find(params[:id])
    if @book.user == current_user
      render :edit
    else
      redirect_to books_path
    end
  end

  def update
    @book = book.find(params[:id])
    @book.user_id = current_user.id
    if @book.update(book_params)
      flash[:notice]="book eas successfully updated."
      redirect_to book_path(@book.id)
    else
      render :edit
    end
  end

  def destroy
    @book = book.find(params[:id])
    if @book.destroy
      flash[:notice]="book was successfully destroyed."
      redirect_to books_path
    end
  end

  private

  def book_params
    params.require (:book).permit(:title, :body)
  end


end
