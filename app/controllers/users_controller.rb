class UsersController < ApplicationController
  
  def show
    # ユーザー情報編集
    @user = User.find(params[:id])
    # 個人の投稿のみ表示＝＞5章のページング
    # 新規投稿時
    @book = Book.new
    @books = Book.where(user_id: @user.id)
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
