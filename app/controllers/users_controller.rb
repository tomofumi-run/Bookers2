class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
    @book = Book.new
    @books = @user.books
    # binding.pry
    # Book.where(user_id: @user.id)
  end
  
  
  def new
    @user = User.new
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name,:profile_image,:introduction)  
  end
  
end
