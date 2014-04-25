Rails.application.routes.draw do
  resources :measurements, only: [:index]
  resources :meals, only: [:index]

  resource :user, only: [] do
    resources :appliances, only: [:index, :create, :destroy], controller: 'user/appliances'
    resources :ingredients, only: [:index, :create, :update, :destroy], controller: 'user/ingredients'
    resources :meals, only: [:index, :create, :destroy], controller: 'user/meals'
  end

  resource :session, only: [:create], controller: :session
  resource :registration, only: [:create], controller: :registration
end
