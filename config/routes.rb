Rails.application.routes.draw do
  get '/chart', to: 'pages#chart', as: 'chart'
  post '/chart', to: 'pages#chart', as: 'chart_date'
  get '/days/:id/details', to: 'days#details', as: 'day_details'
  get '/create_day', to: 'days#create_day', as: 'day_create'
  get '/days/:id/alert_details', to: 'days#alert_details', as: 'day_alert_details'
  resources :user_preferences
  resources :crises
  resources :days, except: [:index] do
    resources :poohs
    resources :meals do
      resources :ingredients
      resources :meal_ingredients, only: [:new, :create, :destroy]
    end
  end
  devise_for :users
  devise_scope :user do
    get 'users/sign_out' => "devise/sessions#destroy"
  end
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
