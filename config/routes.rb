Rails.application.routes.draw do
  root 'home#index'

  devise_for :users, controllers

  resources :persons
  devise_scope :user do
    get '/login', to: 'users/sessions#new'
  end



end
