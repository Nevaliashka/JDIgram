Rails.application.routes.draw do
  root 'persons#index', as: 'home'

  resources :persons
  devise_scope :user do
    get '/login', to: 'users/sessions#new'
    get '/registrations' => 'users/registrations#new'
  end

  devise_for :users, controllers: {registrations: 'users/registrations'}



end
