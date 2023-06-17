Rails.application.routes.draw do
  devise_for :users
  authenticated :user do
    root 'groups#index', as: :authenticated_root
  end

  unauthenticated do
    root 'splash#splash', as: :unauthenticated_root
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :users
  resources :groups, path: 'categories', only: [:index, :new, :create, :destroy] do
    resources :operations, path: 'transactions', only: [:index, :new, :create, :destroy]
  end
  # Defines the root path route ("/")
  # root "articles#index"
end
