Rails.application.routes.draw do

  devise_for :users, controllers: { registrations: "registrations" }
  root 'talks#index'
  resources :talks
  
end
