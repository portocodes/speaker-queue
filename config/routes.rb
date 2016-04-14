Rails.application.routes.draw do

  get 'signup', to: 'users#new',        as: 'signup'
  get 'login' , to: 'sessions#new',     as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  resources :users
  resources :sessions

  get 'tags/:tag', to: 'talks#index', as: :tag

  resources :talks do
    member do
      put "approve"
      put "reject"
      put "delay"
    end
  end

  root 'talks#index'

end
