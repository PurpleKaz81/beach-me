Rails.application.routes.draw do
  devise_for :users, controllers: {sessions: "sessions"}
  resources :products do
    resources :rents, only: %i[create]
    get "rented", on: :collection
    get "mine", on: :collection
  end
  resources :products, only: :destroy
  root to: "pages#home"
end
