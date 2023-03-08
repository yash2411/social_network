Rails.application.routes.draw do
  get 'sessions/new'
  root 'home#index'
  devise_for :users
  resources :users

  resources :registrations
  post '/signup', to: 'registrations#signup', as: :signup
  get '/signup', to: 'registrations#new', as: :new_signup

  resources :sessions
  post '/login', to: 'sessions#login', as: :login
  get '/login', to: 'sessions#new', as: :new_login
  delete '/logout', to: 'sessions#logout', as: :logout
end
