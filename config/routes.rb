Rails.application.routes.draw do
  # 投稿一覧トップページ
  get "posts/index" => "posts#index"

  # トップページ
  get "/" => "home#top"
end
