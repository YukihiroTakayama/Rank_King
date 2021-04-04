Rails.application.routes.draw do
  root 'search#category'
  namespace :search do
    get 'keyword'
    get 'category'
  end
  namespace :admin do
    resources :categories, only: [:index] do
      patch 'bulk_update', on: :collection
      post 'import', on: :collection
    end
  end
end
