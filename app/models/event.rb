class Event < ActiveRecord::Base
	belongs_to :attachment
	belongs_to :vest
	has_many :resources

	validates :vest, presence: true 
	validates :attachment, presence: true

	reverse_geocoded_by :latitude, :longitude 
	after_validation :reverse_geocode

	sync :all

	searchkick suggest: ["alert"], text_start: [:alert]
	include Grape::Entity::DSL

	def entity
		Entity.new(self)
	end

	def send_text_message_alert
		#number_to_send_to ='xxxxxxxxxx'

		#account_sid = 'xxx' 
		#auth_token = 'xxx' 

		# set up a client to talk to the Twilio REST API 
		#@client = Twilio::REST::Client.new account_sid, auth_token 
		 
		#@client.account.messages.create({
		#		:from => '+xxxxxxxxxx',
		#	:to => number_to_send_to,
    #  		:body => "ALERT: Attachment #{self.attachment.id} was triggered on Vest #{self.vest.id}!"  
		#})
	end

	class Entity < Grape::Entity
		expose :id, documentation: {type: "Integer", desc: "Unique id of Event"}
		expose :vest_id, documentation: {type: "Integer", desc: "ID of the Vest"}
		expose :attachment_id, documentation: {type: "Integer", desc: "ID of the Attachment"}
		expose :alert, documentation: {type: "String", desc: "Alert text"}
		expose :latitude, documentation: {type: "Float"}
		expose :longitude, documentation: {type: "Float"}
	end
end
