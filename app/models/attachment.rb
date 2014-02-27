class Attachment < ActiveRecord::Base
	has_many :events
	belongs_to :vest
	validates :vest, presence: true 

	include Grape::Entity::DSL
	def entity
		Entity.new(self)
	end

	class Entity < Grape::Entity
		expose :name, documentation: {type: "String", desc: "Name of the Vest"}
		expose :description, documentation: {type: "Text", desc: "Description of the Vest"}
	end
end
