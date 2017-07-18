Rails.application.routes.draw do
  resources :books, only: [:index, :new, :create, :show]
  root 'books#index'
end
