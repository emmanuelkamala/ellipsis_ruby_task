Rails.application.routes.draw do
  resources :links
  root 'home#index'
  devise_for :users, controllers: { registrations: "registrations" }
end
