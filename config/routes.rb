Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :jobs, only: %i[new create index show] do
    resources :proposals, only: %i[new create update edit]
    resources :review, only: %i[new create]
  end
  get '/jobs/myjobs', to: 'jobs#my_jobs'
end
