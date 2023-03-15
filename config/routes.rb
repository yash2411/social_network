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
  get '/forgot_password', to: "sessions#forgot_password", as: :forgot_password
  post '/reset_password', to: "sessions#reset_password", as: :reset_password
  delete '/logout', to: 'sessions#logout', as: :logout

  resources :profiles 
  get '/edit_profile', to: "profiles#edit_user_profile", as: :edit_user_profile
  put '/update_profile', to: "profiles#update_user_profile", as: :update_user_profile
end
