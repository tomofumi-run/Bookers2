class BooksController < ApplicationController

include Typenews
before_action :set_news

include Typealls
before_action :set_alls
  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
      if @book.save
        flash[:notice] = "You have created book successfully."
        redirect_to book_path(@book.id)
      else
        # @books = Book.all
        @user = current_user
        @new_book = @book
        render :index
      end
  end


  def index
    # @books = Book.all
    @user = current_user
  end


  def show
    @book = Book.find(params[:id])
    @user = @book.user
  end
  
  
  def edit
    @book = Book.find(params[:id])
      if @book.user != current_user
        redirect_to books_path
      end
  end
  
  
  def update
    @book = Book.find(params[:id])
      if @book.update(book_params)
        flash[:notice] = "You have updated book successfully."
        redirect_to book_path(@book.id)
      else
        # binding.pry
        render :edit
      end
  end


  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end
  
  
  private
  
  def book_params
    params.require(:book).permit(:title,:body)
  end
  
end
