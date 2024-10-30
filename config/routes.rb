Rails.application.routes.draw do
  devise_for :users

  resources :posts, only: [:index, :show] do
    collection do
      get "my"
    end
  end
  resources :startups, only: [:index, :show] do
    collection do
      get "my"
    end
  end
  resources :subscriptions, only: [:create]


  namespace :admin do
    resources :tags
    resources :tag_types
    resources :messages
    resources :comments
    resources :chats
    resources :subscriptions

    resources :startups, except: [:show] 
    resources :posts, except: [:show] 
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  match '/index', to: 'posts#index', via: 'get'

  get 'welcome/index'
  get 'welcome/about'
  root "welcome#index"
end
