FidoApi::Application.routes.draw do
  devise_for :users
  mount API::Root => 'api/'

  resources :events

  root to: 'high_voltage/pages#show', id: 'index'
end
