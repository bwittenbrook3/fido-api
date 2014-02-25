class SendTextController < ApplicationController

	def send_text_message
		number_to_send_to = params[:number_to_send_to]

		account_sid = 'AC9a2cb1b0065296852a707eb38e8e9ded' 
		auth_token = '97edc27fff31c4128d95a20e6b2e869a' 

		# set up a client to talk to the Twilio REST API 
		@client = Twilio::REST::Client.new account_sid, auth_token 
		 
		@client.account.messages.create({
			:from => '+16785345126',
			:to => number_to_send_to,
      		:body => "This is an message. It gets sent to #{number_to_send_to}"  
		})
	end
end
