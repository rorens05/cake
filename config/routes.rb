Rails.application.routes.draw do
  get '/search', to: 'search#search'
  resources :custom_cake_orders do
    post :update_status, on: :member
  end
  post 'custom_api/update_control'
  post 'custom_api/add_custom_cake'
  post 'custom_api/add_to_cart'
  post 'custom_api/checkout_cart'
  get 'custom_api/get_cakes'
  get 'custom_api/get_categories'
  get 'custom_api/get_sizes'
  get 'custom_api/get_orders'
  get 'custom_api/get_cart'
  post 'custom_api/login'
  post 'custom_api/create_user'
  post 'custom_api/create_cod_order'
  post 'custom_api/signup'
  post 'custom_api/change_password'
  delete 'access/logout'
  post 'access/attempt_login'
  get 'access/login'
  get '/cart', to: 'orders#cart'
  get '/calendar', to: 'orders#calendar'
  get '/reports', to: 'reports#index'

  resources :orders do
    post :update_status, on: :member
  end
  resources :customers do
    post :update_status, on: :member
  end
  resources :sizes
  resources :products
  resources :categories
  resources :admins
  root 'dashboard#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
