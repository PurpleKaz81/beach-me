Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :products do
    resources :rents, only: %i[index new create]
  end
end
