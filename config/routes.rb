Rails.application.routes.draw do
  root 'search#category'
  namespace :search do
    get 'keyword'
    get 'category'
  end
end
