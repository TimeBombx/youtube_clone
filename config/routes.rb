Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "subscriptions#index"

  get 'login', to: 'sessions#new'
  get 'logout', to: 'sessions#destroy'

  get 'upload', to: 'upload#new'

  resources :users do
    get '/settings', to: 'users#settings'
  end
  
  resources :subscriptions
end
