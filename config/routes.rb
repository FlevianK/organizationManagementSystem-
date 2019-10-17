Rails.application.routes.draw do
  post 'signup', to: 'users#create'
  resources :users, only: [:index, :show, :update, :destroy]
  post 'auth/login', to: 'authentication#authenticate'
  resources :members do
    resources :leaders
  end
  resources :departments
  resources :events
  resources :services
  resources :tithes
end
