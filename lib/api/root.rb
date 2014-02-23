require 'grape-swagger'

module API
  class Root < Grape::API
  	mount API::Events
    add_swagger_documentation({:base_path => '/api', :markdown => true})
  end
end