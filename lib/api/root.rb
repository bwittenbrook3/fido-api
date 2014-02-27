require 'grape-swagger'

module API
  class Root < Grape::API
  	mount API::Attachments
  	mount API::Events
  	mount API::Vests
    add_swagger_documentation({:base_path => '/api', :markdown => true})
  end
end