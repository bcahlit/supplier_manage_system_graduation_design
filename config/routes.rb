Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post 'auth/login', to: 'authentication#authenticate'
  post 'signup', to: 'users#create'
  get 'me', controller: :users, action: :me
  
  resources :notes
  resources :schedules
  resources :suppliers
  resources :order_details
  resources :products
  resources :order_forms
  
end
