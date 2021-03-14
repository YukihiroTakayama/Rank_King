Rails.application.routes.draw do
  root 'ranks#index'
  get 'ranks/search'
end
