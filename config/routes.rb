Rails.application.routes.draw do
  devise_for :users
  # resources :users, only: [:index]
  root 'projects#index'
  resources :projects do
    collection do
      get 'finished'
      get 'analytics'
    end
    resources :tasks, only: :new
    resources :participations, only: :new
  end
  resources :tasks, only: [:create, :update, :destroy]
  resources :participations, only: [:create, :destroy]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
