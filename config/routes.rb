Rails.application.routes.draw do
  resources :purposes
  resources :hangouts
  resources :friendships
  resources :introverts
  resources :users do
    # stuff nested inside users, to produce URLS like /users/4/chart
    member do
      get 'chart'
    end
  end
  resources :auth
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
