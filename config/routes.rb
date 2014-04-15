FidoApi::Application.routes.draw do
  devise_for :users



  get 'current_user', to: 'user#show'
  post '/send_text_message', to: 'send_text#send_text_message'
	resources :events do
		get 'recent', on: :collection 
		get 'recent', on: :member
	end

	resources :vests, path: "k9s", as: "k9s"




	namespace :api, :constraints => {:format => /(json)/} do 
		resources :attachments
		resources :vests
		resources :events
	end
	mount API::Root => '/api'
	get '/api', to: 'high_voltage/pages#show', id: 'api_documentation'

  root to: 'high_voltage/pages#show', id: 'index'
end
