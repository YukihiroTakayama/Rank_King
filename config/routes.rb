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
    resources :meta_tags, only: [:index, :create, :destroy] do
      patch 'bulk_update', on: :collection
      post 'import', on: :collection
      post 'add_property'
    end
  end
end
