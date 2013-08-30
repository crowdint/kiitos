Kiitos::Engine.routes.draw do
  root to: 'home#show'

  get '/admin', to: 'administrator_panel#index', as: 'administrator_panel'
end
