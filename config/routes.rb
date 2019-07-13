Rails.application.routes.draw do
  resources :users
  resources :pins
  post 'authenticate', to: 'authentication#authenticate'
end
