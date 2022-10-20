Rails.application.routes.draw do
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'

  root 'sources#index'
  resources :sources do
    resources :source_pages
  end

  resources :products do
    member do
      post :scrap
    end
  end
  resources :categories, except: %i[show]

  defaults format: :json do
    namespace :api do
      resources :products
    end
  end
end
