Rails.application.routes.draw do

  devise_for :users
  resources :gossips
  root to: 'pages#index'

  get '/gossip', to: 'pages#gossip'


end
