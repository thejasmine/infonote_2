Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :contacts do
    resources :meetings, only: [:new, :create]
    resources :tasks
  end
  resources :meetings, only: [:edit, :update,:destroy]
end

