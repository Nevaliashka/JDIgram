Rails.application.routes.draw do
  root 'persons#index'

  resources :persons
end
