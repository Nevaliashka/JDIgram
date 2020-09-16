Rails.application.routes.draw do
  root to: "public#homepage" ,as: "home"
  devise_for :accounts

  scope '/charge' do
    post 'create', to: 'charges#create', as: 'charge_create'
    get 'success', to: 'charges#success', as: 'charge_success'
    get 'cancel', to: 'charges#cancel', as: 'charge_cancel'
  end
  resources :items, only: [:index], as: :items
  resources :posts, only: [:new, :create, :show, :destroy]
  resources :comments, only: [:create, :destroy]
  resources :conversations, only: [:create] do
    member do
      post :close
    end
    resources :messages, only: [:create]
  end


  devise_scope :account do
    get '/accounts/sign_out', to: 'devise/sessions#destroy'
    get '/login', to: 'devise/sessions#new'
    get '/registrations' => 'accounts/registrations#new'
  end

  get '/messages' => 'accounts#messages', as: :messages
  get 'usery' => 'accounts#index', as: :usery
  get 'post/like/:post_id' => 'likes#save_like', as: :like_post
  get '/dashboard' => "accounts#dashboard", as: :dashboard
  get 'profile/:username', to: 'accounts#profile', as: :profile
  post 'follow/account' => 'accounts#follow_account', as: :follow_account
  get 'friendlist' => 'accounts#friendlist', as: :friendlist
  get 'subscribers' => 'accounts#subscribers', as: :subscribers
  delete '/deletefriend/:follower_id', :to => 'accounts#delete_friend', as: :destroy_friend

end
