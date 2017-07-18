Rails.application.routes.draw do
  resources :books, only: [:index]
  root 'books#index'
end
