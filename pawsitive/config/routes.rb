Rails.application.routes.draw do
  devise_for :users

  resources :users, only: [] do
    get :profile, on: :collection
  end

  resources :bookings, only: [:new, :create, :show] do
    post 'create_message', on: :member
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
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
   root "home#index"

end
