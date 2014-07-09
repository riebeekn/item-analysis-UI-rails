Web::Application.routes.draw do
  resources :home, only: [:index, :create]

  match '/home/create', to: 'home#create'

  root to: 'home#index'
end