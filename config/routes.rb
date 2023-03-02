Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :cats do
    resources :bookings
  end
  resources :users do
    resources :bookings, only: [:new, :create]
  end

  resources :bookings, only: [:show]
end
