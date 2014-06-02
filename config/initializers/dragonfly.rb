require 'dragonfly'
require 'dragonfly/s3_data_store'

# Configure
Dragonfly.app.configure do
  plugin :imagemagick

  #url_host 'd1g1dresthe9tw.cloudfront.net'

  response_header "Cache-Control", "public, max-age=3600"
  protect_from_dos_attacks true
  secret "0e3a70467d930430a462b2bd7093d8992856a79e60907e0d8bf9edc61990c2a2"

  url_format "/media/:job/:name"

  datastore :s3,
    bucket_name: 'fido-api-bucket',
    access_key_id: ENV['S3_KEY'],
    secret_access_key: ENV['S3_SECRET']

  # Override the .url method...
  define_url do |app, job, opts|
    thumb = Thumb.find_by_signature(job.signature)
    # If (fetch 'some_uid' then resize to '40x40') has been stored already, give the datastore's remote url ...
    if thumb
      # "http://[cloudfront_url].cloudfront.net/#{thumb.uid}"   <= cloudfront
      "https://s3.amazonaws.com/fido-api-bucket/#{thumb.uid}" # <=  s3
    # ...otherwise give the local Dragonfly server url
    else
      app.server.url_for(job)
    end
  end

  # Before serving from the local Dragonfly server...
  before_serve do |job, env|
    # ...store the thumbnail in the datastore...
    uid = job.store

    # ...keep track of its uid so next time we can serve directly from the datastore
    Thumb.create!(uid: uid, signature: job.signature)
  end
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
