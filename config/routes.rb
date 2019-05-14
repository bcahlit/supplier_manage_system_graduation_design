Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post 'auth/login', to: 'authentication#authenticate'
  # post 'signup', to: 'users#create'
  get 'me', controller: :users, action: :me
  get '/product_supplier',   to: 'order_forms#product_supplier'
  get '/supplier_product_detail', to: 'supplier_products#get_detail'
  get '/get_number_by_supplier', to: 'data_show#get_number_by_supplier'
  get '/get_order_number_by_time', to: 'data_show#get_order_number_by_time'

  resources :notes
  resources :users
  resources :schedules
  resources :suppliers
  resources :supplier_products
  resources :products
  resources :order_forms
  resources :comments
  
end
