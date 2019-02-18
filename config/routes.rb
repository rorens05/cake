Rails.application.routes.draw do
  resources :orders
  resources :customers
  resources :sizes
  resources :products
  resources :categories
  resources :admins
  root 'dashboard#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
