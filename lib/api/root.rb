require 'grape-swagger'

module API
  class Root < Grape::API
  	mount API::Events
    add_swagger_documentation({:markdown => true})
  end
end