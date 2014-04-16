require 'dragonfly'
require 'dragonfly/s3_data_store'

# Configure
Dragonfly.app.configure do
  plugin :imagemagick

  protect_from_dos_attacks true
  secret "0e3a70467d930430a462b2bd7093d8992856a79e60907e0d8bf9edc61990c2a2"

  url_format "/media/:job/:name"

  datastore :s3,
    bucket_name: 'fido-api-bucket',
    access_key_id: "AKIAJ6MHGWP5AYCW2FBA",
    secret_access_key: "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"

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
