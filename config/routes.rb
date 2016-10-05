Rails.application.routes.draw do

  get 'users/show'

  devise_for :users, :controllers => { registrations: 'registrations' }

  resources :orders, only: [:show]

  root 'store#index', as: 'store'

  resources :items, only: [:show, :index]
  resources :categories, only: [:show, :index]
  resources :users, only: [:show]
  resources :carts
  resources :line_items, only: [:create]
  resources :orders, only: [:show]

  post 'carts/:id/checkout', to: 'carts#checkout', as: 'checkout'

end
