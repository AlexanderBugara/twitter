Rails.application.routes.draw do
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
  resources :microposts, only: [:create, :destroy]
  #get    'micropost_destroy' => 'microposts#destroy'
  resources :users
end
