Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :listings, only: :show
  get "listing_images", to: "listing_images#index"
  get "reviews", to: "reviews#id"
end
