Rails.application.routes.draw do
  root to: "public#homepage" ,as: "home"
  devise_for :accounts

  resources :posts, only: [:new, :create, :show]
  resources :comments, only: [:create]

  devise_scope :account do
    get '/accounts/sign_out', to: 'devise/sessions#destroy'
    get '/login', to: 'devise/sessions#new'
    get '/registrations' => 'accounts/registrations#new'
  end

  get 'usery' => 'accounts#index', as: :usery
  get 'post/like/:post_id' => 'likes#save_like', as: :like_post
  get '/dashboard' => "accounts#dashboard", as: :dashboard
  get 'profile/:username', to: 'accounts#profile', as: :profile
  post 'follow/account' => 'accounts#follow_account', as: :follow_account
  get 'friendlist' => 'accounts#friendlist', as: :friendlist
  get 'subscribers' => 'accounts#subscribers', as: :subscribers
  delete '/deletefriend/:follower_id', :to => 'accounts#delete_friend', as: :destroy_friend
end
