class UsersController < ApplicationController
  #ユーザー一覧トップ
  def index
    @users = User.all.order(id: :desc)
  end
  #ユーザー詳細
  def show
    @user = User.find_by(id: params[:id])
  end
  #ユーザー編集
  def edit
    @user = User.find_by(id: params[:id])
  end
  def update
    @user = User.find_by(id: params[:id])
    @user.name = params[:name]
    @user.email = params[:email]
    if params[:image] # もし画像が送信されたら
      @user.image_name = "#{@user.id}.png" # 画像のファイル名をimage_nameカラムに保尊する
      image = params[:image] # 送信されたファイルの情報
      File.binwrite("public/user_images/#{@user.image_name}", image.read) #画像のファイルの保存先とimage.readはimageに対して、readメソッドを用いることで画像データを取得
    end
    if @user.save
      flash[:success] = "ユーザー登録を編集しました"
      redirect_to("/users/#{@user.id}")
    else
      render("/user/edit")
    end
  end
  #ユーザー新規登録
  def new
    @user = User.new
  end
  def create
    @user = User.new(
      name: params[:name],
      email: params[:email],
      image_name: "default_user.jpg"
    )
    if @user.save
      flash[:success] = "ユーザ登録が完了しました"
      redirect_to("/users/#{@user.id}")
    else
      render("/users/new")
    end
  end
end
