Rails.application.routes.draw do
  resources :measurements, only: [:index]
  resources :meals, only: [:index, :show]
  resources :foods, only: [:index]

  resource :user, only: [] do
    resources :appliances, only: [:index, :create, :destroy], controller: 'user/appliances'
    resources :ingredients, only: [:index, :create, :update, :destroy], controller: 'user/ingredients'
    resources :meals, only: [:index, :create, :destroy], controller: 'user/meals'
    resources :available_meals, only: [:index], controller: 'user/available_meals'
  end

  resource :session, only: [:create], controller: :session
  resource :registration, only: [:create], controller: :registration
end
