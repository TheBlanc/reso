Rails.application.routes.draw do
  root "reservations#today"

  get "today", to: "reservations#today"
  get "tomorrow", to: "reservations#tomorrow"
  get "twodays", to: "reservations#twodays"
  get "threedays", to: "reservations#threedays"
  get "fourdays", to: "reservations#fourdays"
  get "fivedays", to: "reservations#fivedays"
  get "sixdays", to: "reservations#sixdays"


  resources :reservations

  resources :restaurants, only: [:show, :edit, :update]

end
