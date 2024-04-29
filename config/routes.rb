# frozen_string_literal: true

Rails.application.routes.draw do
  # use_doorkeeper
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get 'up' => 'rails/health#show', as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  # root to: "home#index"

  namespace :api do
    namespace :v1 do
      resources :users, only: %i[create index]
      # use_doorkeeper 
        # controllers :authorizations, :applications, :authorized_applications
      # end
    end
  end

  # for swagger ui
  resources :swagger, only: [:index]

  # for api end point
  resources :apidocs, only: [:index]

  scope 'api/v1' do
    use_doorkeeper do
      skip_controllers :applications, :authorized_applications
    end
  end
  
  # root to: "doorkeeper/token_info#show"
end
