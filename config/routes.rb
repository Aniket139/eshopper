Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self) 
  namespace :admin do
    put '/product/:id/update_cover/:image_id', to: 'products#update_cover', as: :product_update_cover
  end

  root "home#index"
  resources :products, only: %i[index show]
end
