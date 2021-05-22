Rails.application.routes.draw do

  devise_for :admins, controllers: {
    sessions: 'admins/sessions',
    passwords: 'admins/passwords',
    registrations: 'admins/registrations'
  }

  devise_for :customers


  root :to => "public/homes#top"
  get 'home/about' => 'public/homes#about'


  resources :customers, module: 'public', only: [:show, :edit, :update]
  get 'customer/withdraw' => 'public/customers#withdraw'
  patch 'customer/hide' => 'public/customers#hide'

  resources :products, module: 'public', only: [:index, :show]

  resources :cart_products, module: 'public', only: [:index, :create, :update, :destroy]
  delete 'cart_product/destroy_all' => 'public/cart_products#destroy_all'

  resources :orders, module: 'public', only: [:index, :new, :create, :show]
  post 'order/confirm' => 'public/orders#confirm'
  get 'order/complete' => 'public/orders#complete'

  resources :addresses, module: 'public', only: [:index, :create, :edit, :update, :destroy]

  namespace :admins do

    get 'homes' => 'homes#top'

    resources :products, only: [:index, :new, :create, :show, :edit, :update]

    resources :genres, only: [:index, :create, :edit, :update]

    resources :customers, only: [:index, :show, :edit, :update]

    resources :orders, only: [:index, :show, :update] do

      resources :order_details, only: [:update]

    end
  end
end
