Rails.application.routes.draw do
  devise_for :customers, path: 'customer', path_names: {
    sign_in: 'login', sign_out: 'logout', sign_up: 'signup'
  }, controllers: {
    sessions: 'authentication/sessions',
    passwords: 'authentication/passwords',
    registrations: 'authentication/registrations'
  }

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
   
  namespace :admin do
    put '/product/:id/update_cover/:image_id', to: 'products#update_cover', as: :product_update_cover
  end

  namespace :autocomplete do
    get 'countries'
    get 'states'
    get 'cities'
  end

  root "home#index"
  resources :carts
  resources :customer
  resources :products, only: %i[index show]
  resources :orders
  get '/orders/check_out', to: 'orders#check_out', as: 'checkout'
  get '/orders/:id/cancel_information', to: 'orders#cancel_information', as: 'cancel_information'
  patch '/orders/:id/cancel', to: 'orders#cancel',  as: 'cancel'
end
