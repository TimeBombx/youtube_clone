Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "subscriptions#index"

  get 'login', to: 'sessions#new'
  get 'signup', to: 'users#new'
  
  get 'upload', to: 'upload#new'
  
  post 'signup', to: 'users#create'
  post 'login', to: 'sessions#create'
  post 'logout', to: 'sessions#destroy'

  resources :users, except: [:create] do
    get '/settings', to: 'users#settings'
  end
  
  resources :subscriptions
end
