Rails.application.routes.draw do
  root "pages#index"
  get "signup", to: "users#new"
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"
  get "logout", to: "sessions#destroy"
  get "my_organizations", to: "pages#my_organizations"
  resources :organizations do
    member do
      get "users"
      post "users", to: "organizations#new_user"
    end
    resources :projects do
      resources :messages
      resources :posts do
        resources :comments
      end
    end
  end
  resources :users, except: [:new]

  mount ActionCable.server => '/cable'
end
