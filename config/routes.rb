Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root "home#index"
  get '/products/:id', to: 'home#show', as: 'show_product'
  get '/products', to: 'products#index', as: 'products'
  resources :home
  resources :product
end
