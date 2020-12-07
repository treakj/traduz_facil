Rails.application.routes.draw do
  get 'users/show'
  devise_for :users
  root to: 'pages#home'

  resources :jobs, only: %i[new create index show destroy] do
    resources :proposals, only: %i[new create update edit show destroy]
    resources :review, only: %i[new create]
  end
  # get '/jobs/myjobs', to: 'jobs#my_jobs'

  # creating user/:id
  resources :users, only: [:show]
end
