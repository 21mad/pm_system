Rails.application.routes.draw do
  root 'projects#index'
  resources :projects do
    collection do
      get 'finished'
      get 'analytics'
    end
    resources :tasks, only: :new
  end
  resources :tasks, only: [:create, :update, :destroy]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
