Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'projects#index'

  get '/register', to: 'users#new'

  resources :projects
  resources :tickets
  resources :tags, except: [:show]
  resources :users, only: [:create, :edit, :update]
end
