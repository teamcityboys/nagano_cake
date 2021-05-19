Rails.application.routes.draw do
  devise_for :customers
  root :to => "public/homes#top"
  get 'home/about' => 'public/homes#about'
  
  resources :customer, module: 'public', only: [:show, :edit, :update]
  get 'customer/withdraw' => 'public/customers#withdraw'
  patch 'customer/hide' => 'public/customers#hide'
  
  resources :product, module: 'public', only: [:index, :show]
  
  resources :cart_product, module: 'public', only: [:index, :create, :update, :destroy]
  delete 'cart_product/destroy_all' => 'public/cart_products#destroy_all'
  
  resources :order, module: 'public', only: [:index, :new, :create, :show]
  post 'order/confirm' => 'public/orders#confirm'
  get 'order/complete' => 'public/orders#complete'
  
  resources :address, module: 'public', only: [:index, :create, :edit, :update, :destroy]
  
  namespace :admin do
    resources :product, only: [:index, :new, :create, :show, :edit, :update]
    
    resources :genre, only: [:index, :create, :edit, :update]
    
    resources :customer, only: [:index, :show, :edit, :update]
    
    resources :order, only: [:index, :show, :update] do
      
      resources :order_detail, only: [:update]
      
    end
  end
end
