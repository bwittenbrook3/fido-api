FidoApi::Application.routes.draw do
  devise_for :users

  get 'current_user', to: 'user#show'

	namespace :api, :constraints => {:format => /(json)/} do 
		resources :attachments
		resources :vests
		resources :events
	end
	mount API::Root => '/api'
	get '/api', to: 'high_voltage/pages#show', id: 'api_documentation'


	post '/send_text_message', to: 'send_text#send_text_message'
	resources :events
  root to: 'high_voltage/pages#show', id: 'index'
end
