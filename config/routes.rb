Rails.application.routes.draw do
  resources :apartment_requests
  resources :profiles
  get 'home' => 'home#index'
  controller :sessions do
    get 'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end

  controller :register do
    get 'register'  => :new
    post 'register' => :create
  end

  resources :users
  
  resources :apartments do
    member do
      patch 'occupy'
      patch 'vacate'
    end
    resources :apartment_requests, only: [:create, :update, :destroy]
  end

  resources :cities do
    resources :neighborhoods
  end
 
  get "up" => "rails/health#show", as: :rails_health_check
  
  root "home#index"
end
