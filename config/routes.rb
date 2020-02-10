Rails.application.routes.draw do
  authenticated :user do
    root to: 'home#index', as: 'home'
  end
  unauthenticated :user do
    root 'home#front'
  end

  resources :persons

  devise_scope :user do
    get '/login', to: 'users/sessions#new'
    get '/registrations' => 'users/registrations#new'
    get '/users/sign_out' => 'users/sessions#destroy'
    get '/forgot', to: 'users/passwords#new'
  end

  devise_for :users, controllers: {registrations: 'users/registrations'}



end
