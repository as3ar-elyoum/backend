Rails.application.routes.draw do
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'

  root 'healthcheck#index'
  resources :devices
  resources :categories
  resources :product_hits

  resources :sources do
    member do
      post :scrap
    end

    resources :source_pages do
      member do
        post :scrap
      end
    end
  end

  resources :products do
    member do
      post :scrap
    end
  end

  defaults format: :json do
    namespace :api do
      resources :devices
      resources :categories
      resources :search
      resources :products do
        collection do
          get :home
        end
        member do
          get :similar
        end
      end
    end
  end
end
