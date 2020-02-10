Rails.application.routes.draw do
  root to: 'home#index', as: 'home'
  resources :posts
  resources :persons

  devise_scope :user do
    get '/login', to: 'users/sessions#new'
    get '/registrations' => 'users/registrations#new'
    get '/users/sign_out' => 'users/sessions#destroy'
    get '/forgot', to: 'users/passwords#new'
  end
  get "/edit", to: 'users#edit_about'
  get "/about", to: 'users#add_about'


  devise_for :users, controllers: {registrations: 'users/registrations'}



end
