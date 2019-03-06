Rails.application.routes.draw do
  root "products#index"
  get '/home/index'
  devise_for :users

  resources :line_items, only: [:create, :edit, :update, :destroy, :new]
  resources :facturations, except: [:destroy ,:new]
  resources :baskets, except: [:index ,:new]
    resources :charges
  resources :categories
  resources :products
end
