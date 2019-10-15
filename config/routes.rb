Rails.application.routes.draw do
  post 'signup', to: 'users#create'
  post 'auth/login', to: 'authentication#authenticate'
  resources :members do
    resources :leaders
  end
  resources :departments
  resources :events
  resources :services
  resources :tithes
end
