class PostsController < ApplicationController
  #投稿一覧ページ
  def index
    @posts = Post.all.order(created_at: :desc)
  end
  #投稿詳細ページ
  def show
    @post = Post.find_by(id: params[:id])
  end
  #新規投稿ページ
  def new
    @post = Post.new
  end
  def create
    @post = Post.new(title: params[:title],content: params[:content])
    if @post.save
      flash[:success] = "新規投稿しました"
      redirect_to("/posts/index")
    else
      render("/posts/new")
    end
  end
  #投稿編集ページ
  def edit
    @post = Post.find_by(id: params[:id])
  end
  def update
    @post = Post.find_by(id: params[:id])
    @post.title = params[:title]
    @post.content = params[:content]
    if @post.save
      flash[:success] = "投稿を編集しました"
      redirect_to("/posts/index")
    else
      render("/posts/edit")
    end
  end
  #削除
  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    flash[:danger] = "投稿を削除しました"
    redirect_to("/posts/index")
  end
end
