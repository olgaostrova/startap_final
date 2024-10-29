Rails.application.routes.draw do
  devise_for :users

  match '/index', to: 'posts#index', via: 'get'

  resources :tags
  resources :tag_types
  resources :messages
  resources :comments
  resources :startups do
    collection do
      get "my"
    end
  end
  resources :chats
  resources :posts do
    collection do
      get "my"
    end
  end

  namespace :admin do
    resources :posts, only: [:index]
    resources :startups, only: [:index]
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get 'welcome/index'
  get 'welcome/about'
  root "welcome#index"
end
