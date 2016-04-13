Rails.application.routes.draw do

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
