Rails.application.routes.draw do
  devise_for :users

  resources :registered_applications

  namespace :api, defaults: { format: :json } do  # defaults tells routes to get in JSON form. seperates API routes from rest of app routes
    match '/events', to: 'events#preflight', via: [:options]  # CORS implementation
  	resources :events, only: [:create]            # API need only support 1 route to record new events
  end

  get 'welcome/index'

  get 'welcome/about'

  root to: 'welcome#index'

end
