Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :jobs, only: %i[new create index show destroy] do
    resources :proposals, only: %i[create update edit index show destroy]
    resources :review, only: %i[new create]
  end
  get '/jobs/myjobs', to: 'jobs#my_jobs'
  # get '/proposals/myjobs', to: 'proposals#my_jobs'
end
