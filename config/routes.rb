Rails.application.routes.draw do
  resources :purposes
  resources :hangouts
  resources :friendships
  resources :introverts
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
