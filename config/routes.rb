Kiitos::Engine.routes.draw do
  root to: 'home#show'

  namespace :admin do
    root to: 'panel#index', as: 'panel'
    get '/users', to: 'users_panel#index', as: 'users'
    resources :administrators, only: [:create, :destroy]
  end

  get '/dashboard', to: 'user_dashboard#index', as: 'user_dashboard'
end
