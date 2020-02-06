Rails.application.routes.draw do
  root 'persons#index', as: 'home'

  resources :persons
end
