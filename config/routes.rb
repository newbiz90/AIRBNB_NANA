Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  root "pages#landing"

  get "/hosting", to: "pages#hosting"

  resources :listings do
    resources :bookings
  end
  resources :bookings do
    member do
      patch :accept
      patch :reject
    end
  end
  resources :users
  resources :reviews
end
