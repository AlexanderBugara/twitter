Rails.application.routes.draw do
  get    'likes/like'
  get    'likes/unlike'
  get    'sessions/new'
  get    'users/new'
  get    'home'   => 'static_pages#home'
  get    'help'   => 'static_pages#help'
  get    'about'  => 'static_pages#about'
  get    'signup' => 'users#new'
  get    'login' => 'sessions#new'
  post   'login' => 'sessions#create'
  get    'logout' => 'sessions#destroy'
  root   'static_pages#home'
  resources :microposts, only: [:create, :destroy] do 
    resources :likes, only: [:create, :destroy]  
  end
  
  resources :users
  
end
