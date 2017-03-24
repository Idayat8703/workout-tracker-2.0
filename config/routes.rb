Rails.application.routes.draw do


  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # homepage
  root 'static#home'

  # workouts
  resources :workouts

  #users
  resources :users

  resources :meals

end
