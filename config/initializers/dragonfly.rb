require 'dragonfly'
require 'dragonfly/s3_data_store'

# Configure
Dragonfly.app.configure do
  plugin :imagemagick

  response_header "Cache-Control", "public, max-age=3600"
  protect_from_dos_attacks true
  secret "0e3a70467d930430a462b2bd7093d8992856a79e60907e0d8bf9edc61990c2a2"

  url_format "/media/:job/:name"

  datastore :s3,
    bucket_name: 'fido-api-bucket',
    access_key_id: ENV['S3_KEY'],
    secret_access_key: ENV['S3_SECRET']

end

# Logger
Dragonfly.logger = Rails.logger

# Mount as middleware
Rails.application.middleware.use Dragonfly::Middleware

# Add model functionality
if defined?(ActiveRecord::Base)
  ActiveRecord::Base.extend Dragonfly::Model
  ActiveRecord::Base.extend Dragonfly::Model::Validations
end
