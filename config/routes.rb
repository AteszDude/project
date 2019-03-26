Rails.application.routes.draw do
  root to: 'visitors#index'
  devise_for :users
  
resources :conversations do
  resources :messages
 end  

  post 'semimatch', to: 'semimatch#create'

  get 'matches', to: 'visitors#matches'
#  get 'messages', to: 'visitors#messages'
  get 'settings', to: 'visitors#settings'
  get 'profile', to: 'visitors#index'
  
end
