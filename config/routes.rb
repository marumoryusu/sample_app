Rails.application.routes.draw do

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
end
