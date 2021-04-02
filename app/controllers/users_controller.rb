class UsersController < ApplicationController
  
  def show
    # ログイン時
    @user = User.find(params[:id])
    # 新規投稿時
    @book = Book.new
  end
end
