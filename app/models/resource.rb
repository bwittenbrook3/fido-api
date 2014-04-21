class Resource < ActiveRecord::Base

	sync :all

	has_and_belongs_to_many :events
	dragonfly_accessor :image do
		storage_options do |attachment|
      {
        path: "fido-api/resource/image/#{self.created_at}_#{self.image_name}",
        headers: {"x-amz-acl" => "public-read-write"}
      }
    end
  end
end
