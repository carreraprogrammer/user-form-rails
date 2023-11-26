Rails.application.routes.draw do
  root "users#new"
  resources :users, only: [:new, :create, :edit, :update, :destroy]
  resources :cities, only: [:index, :show]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
