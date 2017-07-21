Rails.application.routes.draw do
  root 'books#index'
  resources :books do
    resources :orders, only: [:create]
    resource :return, controller: :returns, only: [:update]
  end

end
