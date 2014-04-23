FidoApi::Application.routes.draw do
  devise_for :users



  get 'current_user', to: 'user#show'
  post '/send_text_message', to: 'send_text#send_text_message'
	resources :events do
		get 'recent', on: :collection 
		get 'recent', on: :member
		get 'autocomplete_alert', on: :collection
	end

	resources :vests, path: "k9s", as: "k9s" do
		get "add_training", on: :member, to: "vests#get_training_modal"
		post "add_training", on: :member
	end

	resources :training
	get 'maps', to: "map#index"



	namespace :api, :constraints => {:format => /(json)/} do 
		resources :attachments
		resources :vests do 
			get 'image_path', on: :member
			get 'training', on: :member
			get 'events', on: :member
			post "recent_locations", on: :member
			get 'recent_location', on: :member
			get 'location_updated_channel', on: :member
		end
		resources :events do
			resources :resources do 
				get 'new_channel', on: :collection
			end
			get 'new_channel', on: :collection
			get 'new_resource_channel', on: :member
			post "recent_locations", on: :member
		end
	end
	mount API::Root => '/api'
	get '/api', to: 'high_voltage/pages#show', id: 'api_documentation'

  root to: 'high_voltage/pages#show', id: 'index'
end
