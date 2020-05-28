class UsersController < ApplicationController
  #ユーザー一覧トップ
  def index
    @users = User.all
  end
  #ユーザー詳細
  def show
    @user = User.find_by(id: params[:id])
  end
  #ユーザー新規登録
  def new
  end
end
