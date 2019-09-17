Rails.application.routes.draw do
  resources :members do
    resources :leaders
  end
  resources :departments
  resources :events
end
