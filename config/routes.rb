Rails.application.routes.draw do
  root 'books#index'
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'

  resources :sessions, only: [:create, :destroy]
  
  resources :books do
    resources :orders, only: [:create]
    resource :return, controller: :returns, only: [:update]
  end

end
