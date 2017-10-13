Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: "devise/registrations"
  }
  resources :coins

  get 'static_pages/home'
  get 'static_pages/list'
  get 'static_pages/portfolio', to: 'static_pages#portfolio'

  post '/static_pages/list', to: 'static_pages#create'
  # delete 'static_pages/portfolio/', to: 'static_pages#destroy'

  #might not need this settings
  get 'static_pages/settings'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'static_pages#home'
end
