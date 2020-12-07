Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :jobs, only: %i[new create index show destroy] do
    resources :proposals, only: %i[index show create edit update destroy]    
    resources :review, only: %i[new create]    
  end

  # Implementa a rota do users no controller do proposals, para não precisar
  # sobrescrever o controller do devise
  resource :users do
    get '/:user_id/myjobs', to: 'proposals#myjobs', as: :myjobs
  end
  # get '/jobs/myjobs', to: 'jobs#my_jobs'
end
