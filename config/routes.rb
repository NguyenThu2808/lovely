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

  post 'set_session_cart', to: 'cart_items#set_session_cart', as: 'session_cart'
  post 'set_session_address', to: 'cart_items#set_session_address', as: 'session_address'
end
