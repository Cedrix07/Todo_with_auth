Rails.application.routes.draw do

  root to: 'pages#home'

  # devise_for :users

  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  resources :tasks 


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
