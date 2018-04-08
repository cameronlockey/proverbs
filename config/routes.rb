Rails.application.routes.draw do

  get 'verses/index'

  root 'pages#home'
  get 'pages/home'

  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'logout', to: 'sessions#destroy', as: 'logout'

  resources :sessions, only: [:create, :destroy]

  resources :users

  resources :verses
  get 'version/:version', to: 'verses#set_version'
  get 'chapter/:chapter', to: 'verses#chapter'
  get 'chapter/:chapter/:display', to: 'verses#chapter'

  get 'account', to: 'users#show', as: 'account'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
