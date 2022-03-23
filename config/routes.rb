Rails.application.routes.draw do
  resources :days do
    resources :poohs
    resources :meals do
      resources :foods
      resources :meal_ingredients
    end
  end
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
