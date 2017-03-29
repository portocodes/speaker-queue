Rails.application.routes.draw do
  get 'login' , to: 'sessions#new', as: 'login'
  get 'login/*token', to: 'sessions#login', as: 'login_token', format: false
  get 'logout', to: 'sessions#destroy', as: 'logout'

  get 'tags/:tag', to: 'pages#landing', as: :tag
  get 'talks/tags/:tag', to: 'talks#index', as: 'tags'

  get 'preferences', to: 'users#edit'
  patch 'preferences', to: 'users#update'

  resources :talks do
    member do
      put 'approve'
      put 'reject'
      put 'delay'
    end
  end

  root 'talks#index'
end
