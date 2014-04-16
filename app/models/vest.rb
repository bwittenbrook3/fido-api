class Vest < ActiveRecord::Base
	has_many :attachments
	has_many :events
	has_and_belongs_to_many :trainings

	dragonfly_accessor :image do
		storage_options do |attachment|
      {
        path: "fido-api/vest/image/#{self.created_at}_#{self.image_name}",
        headers: {"x-amz-acl" => "public-read-write"}
      }
    end
  end

	include Tire::Model::Search
	include Tire::Model::Callbacks 
	include Grape::Entity::DSL

	def entity
		Entity.new(self)
	end

	class Entity < Grape::Entity
		expose :id, documentation: {type: "Integer", desc: "Unique id of Vest"}
		expose :name, documentation: {type: "String", desc: "Name of the Vest"}
		expose :description, documentation: {type: "Text", desc: "Description of the Vest"}
		expose :events, using: Event::Entity
	end
end
