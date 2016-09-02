Rails.application.routes.draw do
  root 'routes#new'
  resources :routes, only: [:index, :new, :create, :show]
end
