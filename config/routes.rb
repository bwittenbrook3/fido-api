FidoApi::Application.routes.draw do
  devise_for :users

	constraints subdomain: 'api' do
		scope :module => 'api' do
			resources :events, :constraints => {:format => /(json)/}
		end
		mount API::Root => '/'
		get '/', to: 'high_voltage/pages#show', id: 'api_documentation'
	end

	resources :events
  root to: 'high_voltage/pages#show', id: 'index'
end
