Rails.application.routes.draw do
  get 'custom_api/get_categories'
  post 'custom_api/login'
  post 'custom_api/create_user'
  delete 'access/logout'
  post 'access/attempt_login'
  get 'access/login'
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
