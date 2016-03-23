Rails.application.routes.draw do
  get 'tags/:tag', to: 'talks#index', as: :tag
  devise_for :users, controllers: { registrations: "registrations" }

  resources :talks do
    member do
      put "approve"
      put "reject"
      put "delay"
    end
  end

  root 'home#index'

end
