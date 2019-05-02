Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post 'auth/login', to: 'authentication#authenticate'
  post 'signup', to: 'users#create'
  get 'me', controller: :users, action: :me
  
  resources :notes
  resources :schedules
  resources :suppliers
  resources :supplier_products
  resources :products
  resources :order_forms
  
end
