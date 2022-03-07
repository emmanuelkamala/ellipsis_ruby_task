Rails.application.routes.draw do
  resources :links
  root 'home#index'
  devise_for :users, controllers: { registrations: "registrations" }

  get '/:short_url', to: 'links#send_to_url'
end
