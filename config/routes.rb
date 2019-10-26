Rails.application.routes.draw do
  
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
  resources :cart_items
  resources :orders do
    patch :toggle_status
  end
  
  

  patch '/add_item' => 'carts#add_item'
  post '/update_item' => 'carts#update_item'
  delete '/destroy' => 'carts#delete_item'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
