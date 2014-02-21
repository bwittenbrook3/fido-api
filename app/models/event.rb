class Event < ActiveRecord::Base
	include Grape::Entity::DSL

	def entity
		Entity.new(self)
	end

	def text
	end

	class Entity < Grape::Entity
		expose :id, documentation: {type: "Integer", desc: "Unique id of Event"}
		expose :vest_id, documentation: {type: "Integer", desc: "ID of the Vest"}
		expose :attachment_id, documentation: {type: "Integer", desc: "ID of the Attachment"}
	end
end
