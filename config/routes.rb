Rails.application.routes.draw do

  get 'password_resets/new'

  get 'password_resets/edit'

  # 静的ページ
  root 'static_pages#home'
  get '/help', to: 'static_pages#help'
  get '/about', to: 'static_pages#about'
  get '/contact', to: 'static_pages#contact'
  
  # ユーザーページ
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  resources :users
  
  # セッション
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  
  # アカウント有効化
  resources :account_activations, only: [:edit]
  
  # パスワード再設定
  resources :password_resets, only: [:new, :create, :edit, :update]
  
  # マイクロポスト
  resources :microposts, only: [:create, :destroy]
  
  # 統計情報
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :relationships, only: [:create, :destroy]
end
