Rails.application.routes.draw do
  resource :session, only: [:create], controller: :session
  resource :registration, only: [:create], controller: :registration
end
