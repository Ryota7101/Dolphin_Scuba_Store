Rails.application.routes.draw do
  
  get 'carts/show'

  get 'carts/add_item'

  get 'carts/update_item'

  get 'carts/delete_item'

  get 'carts/setup_cart_item'

  get 'products/index'
  get 'products/new'

  get 'sessions/new'

  resources :users
  get 'users/new'

  root 'static_pages#home'

  
  get  '/help',    to: 'static_pages#help'
  get  '/about',   to: 'static_pages#about'
  get  '/contact', to: 'static_pages#contact'
  get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'
  
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  
  resources :products
  resources :carts

  post '/add_item' => 'carts#add_item'
  post '/update_item' => 'carts#update_item'
  delete '/delete_item' => 'carts#delete_item'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
