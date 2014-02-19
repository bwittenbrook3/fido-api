FidoApi::Application.routes.draw do
  devise_for :users

  resources :events

  root to: 'high_voltage/pages#show', id: 'index'
end
