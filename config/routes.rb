Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :cats do
    resources :bookings
  end

  resources :bookings, only: [:show]
  get "dashboard", to: "pages#dashboard", as: :dashboard
end
