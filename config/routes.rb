Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: "devise/registrations"
  }

  get 'static_pages/home'
  get 'static_pages/list'
  get 'static_pages/portfolio'

  get 'ticker', to: 'static_pages#home'

  #might not need this settings
  get 'static_pages/settings'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'static_pages#home'
end
