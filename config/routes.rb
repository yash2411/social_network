Rails.application.routes.draw do
  get 'sessions/new'
  root 'home#index'
  devise_for :users
  resources :users

  resources :registrations
  post '/signup', to: 'registrations#signup', as: :signup
  get '/signup', to: 'registrations#new', as: :new_signup
  get '/send_otp', to: 'registrations#send_otp', as: :send_otp
  post '/verify_otp', to: 'registrations#verify_otp', as: :verify_otp

  resources :sessions
  post '/login', to: 'sessions#login', as: :login
  get '/login', to: 'sessions#new', as: :new_login
  delete '/logout', to: 'sessions#logout', as: :logout
end
