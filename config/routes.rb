Rails.application.routes.draw do
  resources :sources do
    resources :source_pages
  end
end
