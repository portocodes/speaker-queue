Rails.application.routes.draw do
  resource :session, only: [:new, :create, :destroy] do
    get :login
  end

  resource :preferences, only: [:show, :update], controller: :users

  resources :talks

  root 'talks#index'
end
