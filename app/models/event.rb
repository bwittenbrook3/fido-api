class Event < ActiveRecord::Base
	belongs_to :attachment
	belongs_to :vest

	validates :vest, presence: true 
	validates :attachment, presence: true

	reverse_geocoded_by :latitude, :longitude

	sync :all

	searchkick 
	include Grape::Entity::DSL

	def entity
		Entity.new(self)
	end

	def send_text_message_alert
		number_to_send_to ='6787871824'

		account_sid = 'AC9a2cb1b0065296852a707eb38e8e9ded' 
		auth_token = '97edc27fff31c4128d95a20e6b2e869a' 

		# set up a client to talk to the Twilio REST API 
		@client = Twilio::REST::Client.new account_sid, auth_token 
		 
		#@client.account.messages.create({
		#		:from => '+16785345126',
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
