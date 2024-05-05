Rails.application.routes.draw do
  resources :push_notifications

  resources :products


  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "pages#home"

  use_doorkeeper do
    skip_controllers :authorizations, :authorized_applications
  end

  namespace :api do
    namespace :v1 do
      resources :users, only: %i[create]
      resources :addresses
      post '/setupPayment', to: 'payment_methods#create'
      get '/paymentMethods', to: 'payment_methods#index'
      resources :orders, only: %i[create show]
      post '/deviceTokens', to: 'device_tokens#create'
    end
  end
end
