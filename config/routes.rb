Rails.application.routes.draw do
  resource :registration, only: [:create], controller: :registration
end
