Rails.application.routes.draw do
  devise_for :users

  resources :users, only: [] do
    get :profile, on: :collection
   #get :update, on: :collection
   #post 'users/update_profile', to: 'users#update_profile'
  end

  resources :bookings, only: [:new, :create]
  resources :services, only: [:index, :show, :new, :create]

  get 'home/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
   root "home#index"

end
