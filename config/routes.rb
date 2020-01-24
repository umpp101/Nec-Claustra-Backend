Rails.application.routes.draw do
  resources :conversations 
  resources :messages
  resources :users
  post '/login', to: 'auth#create'
  post '/signup',to: 'users#create'

  # *************************************
  # mount ActionCable.server, at: '/cable'
  # root to: 'messages#root'
  mount ActionCable.server => '/cable'
  # *************************************
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
