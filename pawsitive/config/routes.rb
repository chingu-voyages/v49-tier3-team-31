Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }

  resources :users, only: [] do
    get :profile, on: :collection
  end
  
  resources :bookings, only: [:new, :create, :show, :edit, :index] do
    post 'create_message', on: :member
    patch 'update_status', on: :member
    resources :messages, only: [:show]
  end
  
  resources :services, only: [:index, :show, :new, :create]
  
  resources :notifications, only: [:index, :show] do
    collection do
      get :unread_count
    end
    
    member do
      patch :mark_as_read
    end
  end
  
  get 'home/index'
  get "up" => "rails/health#show", as: :rails_health_check

  root "home#index"
end
