Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :products do
    resources :rents, only: %i[create]
    get "rented", on: :collection
    get "mine", on: :collection
  end
  resources :products, only: :destroy
end
