Rails.application.routes.draw do
  root "reservations#index"

  resources :reservations

  resources :restaurants

end
