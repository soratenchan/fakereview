Rails.application.routes.draw do
  root to: 'toppages#index'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  get 'signup', to: 'users#new'
  resources :users, only: [:show, :new, :create, :destroy] do
    member do
      get :likes
    end
  end  
  
  resources :reviews, only: [:new, :create, :destroy]
  resources :favorites, only: [:create, :destroy]
end
