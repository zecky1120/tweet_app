class PostsController < ApplicationController
  #投稿一覧ページ
  def index
    @posts = Post.all
  end
  #投稿詳細ページ
  def show
    @post = Post.find_by(id: params[:id])
  end
  #新規投稿ページ
  def new
  end
  def create
    @post = Post.new(title: params[:title])
    @post = Post.new(content: params[:content])
    @post.save
    redirect_to("/posts/index")
  end
end
