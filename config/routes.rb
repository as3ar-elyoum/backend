Rails.application.routes.draw do
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'

  root 'pages#main'
  resources :devices
  resources :categories

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
        member do
          get :similar
        end
      end
    end
  end
end
