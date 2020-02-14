Rails.application.routes.draw do
  root to: "public#homepage" ,as: "home"
  devise_for :accounts

  resources :posts, only: [:new, :create, :show]

  devise_scope :account do
    get '/accounts/sign_out', to: 'devise/sessions#destroy'
    get '/login', to: 'devise/sessions#new'
  end

  get 'post/like/:post_id' => 'likes#save_like', as: :like_post
  get '/dashboard' => "accounts#index"
  get 'profile/:username', to: 'accounts#profile', as: :profile
end
