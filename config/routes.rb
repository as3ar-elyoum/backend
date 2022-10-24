Rails.application.routes.draw do
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'

  root 'sources#index'
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
  resources :categories
  defaults format: :json do
    namespace :api do
      resources :categories
    end
  end

  defaults format: :json do
    namespace :api do
      resources :products
    end
  end
end
