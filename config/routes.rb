Rails.application.routes.draw do
  namespace :user do
    resources :appliances, only: [:index, :create, :destroy]
    resources :ingredients, only: [:index]
  end

  resource :session, only: [:create], controller: :session
  resource :registration, only: [:create], controller: :registration
end
