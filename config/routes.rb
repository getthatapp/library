Rails.application.routes.draw do
  root 'books#index'
  resources :books, only: [:index, :new, :create, :show] do
    resources :orders, only: [:create]
    resource :return, controller: :returns, only: [:update]
  end

end
