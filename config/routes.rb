Rails.application.routes.draw do
  root 'ranks#index'
  resources :ranks, only: [:index] do
    get 'search', on: :collection
  end
end
