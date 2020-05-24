Rails.application.routes.draw do
  # 投稿一覧トップページ
  get "posts/index" => "posts#index"

  # 新規投稿ページ
  get "posts/new" => "posts#new"
  post "posts/create" => "posts#create"

  # 投稿詳細ページ
  get "posts/:id" => "posts#show"

  # トップページ
  get "/" => "home#top"
end
