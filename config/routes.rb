Rails.application.routes.draw do
  root 'dashboard#index'

  resources :machines do
    member do
      post :register_delay
      post :reset_delay
    end
  end

  resources :production_orders
end
