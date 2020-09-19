Rails.application.routes.draw do
  devise_for :users
  get 'tasks/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :tasks
  resources :group_tasks
  root'tasks#index'
end
