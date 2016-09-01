Rails.application.routes.draw do
  root 'routes#new'
  resources :routes
end
