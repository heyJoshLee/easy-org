Rails.application.routes.draw do
  root "pages#home"
  get "signup", to: "users#new"
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"
  get "logout", to: "sessions#destroy"
  get "my_organizations", to: "pages#my_organizations"
  resources :organizations do
    resources :projects
  end
  resources :users, except: [:new]
end
