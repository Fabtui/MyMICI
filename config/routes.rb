Rails.application.routes.draw do
  get '/chart', to: 'pages#chart', as: 'chart'
  post '/chart', to: 'pages#chart', as: 'chart_date'
  resources :user_preferences
  resources :days do
    resources :poohs
    resources :meals do
      resources :ingredients
      resources :meal_ingredients
    end
  end
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
