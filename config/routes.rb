Rails.application.routes.draw do
# get 'tasks', to: 'tasks#index', as: :tasks
  # get 'tasks/show'
  # get 'tasks/new'
  # get 'tasks/edit'


  resources :tasks 


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
