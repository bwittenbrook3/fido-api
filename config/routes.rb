FidoApi::Application.routes.draw do
  devise_for :users

	namespace :api do 
		resources :events, :constraints => {:format => /(json)/}
	end
	mount API::Root => '/api'
	get '/api', to: 'high_voltage/pages#show', id: 'api_documentation'


	post '/send_text_message', to: 'send_text#send_text_message'
	resources :events
  root to: 'high_voltage/pages#show', id: 'index'
end
