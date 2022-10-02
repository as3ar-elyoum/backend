Rails.application.routes.draw do
  root 'sources#index'
  resources :sources do
    resources :source_pages
  end
  resources :products
end
