Rails.application.routes.draw do
  # ログイン
  get "login" => "users#login_form"
  post "login" => "users#login"

  # ログアウト
  get "logout" => "users#logout"
  ###################################
  # ユーザー一覧トップページ
  get "users/index" => "users#index"

  # ユーザー新規登録
  get "signup" => "users#new"
  post "users/create" => "users#create"

  # ユーザー詳細
  get "users/:id" => "users#show"

  # ユーザー編集
  get "users/:id/edit" => "users#edit"
  post "users/:id/update" => "users#update"
  ###################################
  # 投稿一覧トップページ
  get "posts/index" => "posts#index"

  # 新規投稿ページ
  get "posts/new" => "posts#new"
  post "posts/create" => "posts#create"

  # 投稿詳細ページ
  get "posts/:id" => "posts#show"

  # 編集ページ
  get "posts/:id/edit" => "posts#edit"
  post "posts/:id/update" => "posts#update"

  # 削除
  get "posts/:id/destroy" => "posts#destroy"

  # トップページ
  get "/" => "home#top"
end
