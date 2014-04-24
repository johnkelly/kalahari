Rails.application.routes.draw do
  resources :measurements, only: [:index]

  namespace :user do
    resources :appliances, only: [:index, :create, :destroy]
    resources :ingredients, only: [:index, :create, :update, :destroy]
    resources :meals, only: [:index, :create, :destroy]
  end

  resource :session, only: [:create], controller: :session
  resource :registration, only: [:create], controller: :registration
end
