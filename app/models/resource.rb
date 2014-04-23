class Resource < ActiveRecord::Base

  sync :all
  sync_scope :by_event_id, ->(event_id) { where(event_id: event_id) }

	belongs_to :event

	dragonfly_accessor :image do
		storage_options do |attachment|
      {
        path: "fido-api/resource/image/#{self.created_at}_#{self.image_name}",
        headers: {"x-amz-acl" => "public-read-write"}
      }
    end
  end

end
