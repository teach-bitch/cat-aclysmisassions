Rails.application.routes.draw do
  root "products#index"
  get '/home/index'
  devise_for :users

  resources :line_items, only: [:create, :update, :destroy]
  resources :facturations, only: [:index, :show, :create]
  resources :baskets, only: [:show, :create, :destroy]
  resources :categories, except: [:new, :edit]
  resources :products, except: [:new, :edit]
end
