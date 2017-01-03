Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "subscriptions#index"

  get 'login', to: 'sessions#new'
  get 'signup', to: 'users#new'
  
  get 'uploads', to: 'uploads#new'
  
  post 'signup', to: 'users#create'
  post 'login', to: 'sessions#create'
  post 'logout', to: 'sessions#destroy'

  resources :users, except: [:create, :show] do
    # get '/settings', to: 'users#settings'
  end
  
  resources :channel, only: [:show, :edit, :update], path_names: {edit: "settings"}  do
    get '/videos', to: 'channel#videos'
    get '/about', to: 'channel#about'
    
    #ajax
    get 'subcount', to: 'channel#subcount'
    post 'subscribe', to: 'channel#subscribe'
    post 'unsubscribe', to: 'channel#unsubscribe'
  end
  
  resources :subscriptions
end
