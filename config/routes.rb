Rails.application.routes.draw do
  mount Thredded::Engine => '/forum'

  # Set root to be the Thredded forums index page at /forum
  # root to: 'thredded/messageboards#index'
  
  devise_for :users
  get '/dashboard', to: 'dashboard#index', as: :dashboard
  root 'listings#index'

  resources :listings, only: [:index, :show] do
    resources :listing_photos
    resources :reviews
  end

  namespace :host do
    resources :listings do
      resources :rooms
      resources :listing_photos
    end
  end

  resources :wishlists, only: [:create, :destroy]

  get '/users/:id' => 'profiles#show'
end
