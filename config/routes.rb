FidoApi::Application.routes.draw do
  devise_for :users

	namespace :api do 
		resources :events, :constraints => {:format => /(json)/}
	end
	mount API::Root => '/api'
	get '/api', to: 'high_voltage/pages#show', id: 'api_documentation'

	resources :events
  root to: 'high_voltage/pages#show', id: 'index'
end
