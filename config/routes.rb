Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :contacts do
    resources :meetings, only: [:new, :create]
    resources :tasks, only: [:new, :create]
  end
  resources :meetings, only: [:edit, :update,:destroy]
  resources :tasks, only: [:edit, :update,:destroy]
end

