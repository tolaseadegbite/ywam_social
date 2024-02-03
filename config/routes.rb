Rails.application.routes.draw do
  devise_for :users
  get '/dashboard', to: 'dashboard#index', as: :dashboard
  root 'static_pages#home'

  resources :listings, only: [:index, :show] do
    resources :listing_photos
  end

  namespace :host do
    resources :listings do
      resources :rooms
      resources :listing_photos
    end
  end

  resources :wishlists, only: [:create, :destroy]
end
