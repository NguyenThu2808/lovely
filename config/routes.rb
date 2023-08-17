Rails.application.routes.draw do
  root 'products#index'
  resources :products, only: [:index, :show], path: 'p'
  resources :cart_items

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  resources :users, only: [:create, :update, :destroy]
  get 'profile', to: 'users#edit', as: 'profile'
  get 'register', to: 'users#new', as: 'register'
end
