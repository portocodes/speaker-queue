Rails.application.routes.draw do

  devise_scope :user do
    get 'submit', to: 'registrations#new', as: :submit
  end

  devise_for :users, controllers: { registrations: "registrations" }



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
