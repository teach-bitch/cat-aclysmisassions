Rails.application.routes.draw do
  resources :facturations
    resources :charges
  resources :baskets
  resources :categories
  resources :products
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
