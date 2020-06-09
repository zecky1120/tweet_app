class UsersController < ApplicationController
  require 'securerandom' # ランダムに乱数を生成してくれる
  before_action :authenticate_user, {only: [:index, :show, :edit, :update]}
  before_action :forbid_login_user, {only: [:new, :create, :login, :login_form]}
  before_action :ensure_correct_user, {only: [:edit, :update]}
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
      @user.image_name = "#{SecureRandom.hex(10)}.png" # 画像のファイル名をimage_nameカラムに保尊する
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
      image_name: "default_user.jpg",
      password: params[:password]
    )
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "ユーザ登録が完了しました"
      redirect_to("/users/#{@user.id}")
    else
      render("/users/new")
    end
  end
  #ログイン
  def login_form
  end
  def login
    @user = User.find_by(email: params[:email], password: params[:password])
    if @user
      session[:user_id] = @user.id # 変数sessionに、ログインに成功したユーザーのidを代入
      flash[:success] = "ログインしました"
      redirect_to("/posts/index")
    else
      @error_message = "メールアドレスまたはパスワードが間違っています"
      @email = params[:email]
      @password = params[:password]
      render("/users/login_form")
    end
  end
  #ログアウト
  def logout
    session[:user_id] = nil
    flash[:danger] = "ログアウトしました"
    redirect_to("/login")
  end
  def ensure_correct_user
    if @current_user.id != params[:id].to_i
      flash[:danger] = "権限がありません"
      redirect_to("/posts/index")
    end
  end
end
