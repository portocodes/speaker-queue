Rails.application.routes.draw do

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
