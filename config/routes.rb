Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get "tyres", to: "cars#tyres"
  get "oil_and_filter", to: "cars#oil_filter"
  get "spark_plugs_and_ignition", to: "cars#spark_plugs_and_ignition"
  get "brakes", to: "cars#brakes"


  # Defines the root path route ("/")
  # root "articles#index"
  resources :cars, only: [:index, :new, :create, :show]
  resources :bookings, only: [:new, :index, :show, :create]
  resources :garages, only: [:new, :index, :show]
  resources :service_histories, only: [:index, :show, :new, :create]
  resources :chatrooms, only: :show do
    resources :messages, only: :create
  end
end
