Rails.application.routes.draw do
  devise_for :users
  get '/dashboard', to: 'dashboard#index', as: :dashboard
  root 'static_pages#home'

  resources :listings

  namespace :host do
    resources :listings
  end
end
