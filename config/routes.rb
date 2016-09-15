Rails.application.routes.draw do
  root 'paths#new'
  resources :paths, only: [:index, :new, :create, :show]
end
