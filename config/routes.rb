Rails.application.routes.draw do
  resources :blog_posts
  root to: 'visitors#index'
  devise_for :users
  
resources :conversations do
  resources :messages
 end  

  post 'semimatch', to: 'semimatch#create'
  post 'unmatch', to: 'unmatch#create'

  get 'matches', to: 'visitors#matches'
  get 'messages', to: 'conversations#index'
  get 'settings', to: 'visitors#settings'
  get 'profile', to: 'visitors#index'
  
end
