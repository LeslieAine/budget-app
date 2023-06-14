Rails.application.routes.draw do
  devise_for :users
  root 'groups#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :users
  resources :groups, only: [:index, :new, :create]
  # Defines the root path route ("/")
  # root "articles#index"
end
