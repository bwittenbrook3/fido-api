class EventsController < ApplicationController

	enable_sync only: [:create, :update, :destroy]

	def recent


		if params[:search_string]
			@events = Event.search params[:search_string], page: params[:page], per_page: 20, suggest: true
			if params[:vest_id]
				@events = Event.search params[:search_string], where: {vest_id: params[:vest_id]}, page: params[:page], per_page: 20,  suggest: true
			end
			@events
		elsif params[:vest_id]
			@events = Event.search "*", where: {vest_id: params[:vest_id]}, order: {created_at: :desc}, page: params[:page], per_page: 10, suggest: true
		else
			@events = Event.search "*", order: {created_at: :desc}, page: params[:page], per_page: 5, suggest: true
		end

		if params[:id]
			@event = Event.find(params[:id])
		else
			@event = @events.first
		end

		respond_to do |format|
			format.html
			format.js
		end
	end

	def index
		@events = Event.all

		respond_to do |format|
			format.html
			format.json {render :json => @events}
		end
	end

	def new
		@event = Event.new

		respond_to do |format|
			format.html
			format.json {render :json => @event}
		end
	end

	def create
		@event = Event.new(event_params)
		@event.save

		number_to_send_to ='6787871824'

		account_sid = 'AC9a2cb1b0065296852a707eb38e8e9ded' 
		auth_token = '97edc27fff31c4128d95a20e6b2e869a' 

		# set up a client to talk to the Twilio REST API 
		@client = Twilio::REST::Client.new account_sid, auth_token 
		 
		@client.account.messages.create({
			:from => '+16785345126',
			:to => number_to_send_to,
      		:body => "This is an message. It gets sent to #{number_to_send_to}"  
		})
		
		respond_to do |format|
			format.html
			format.json {render :json => @event}
		end
	end

	def search
		@events = Event.search(params[:search_string].join(" "))
	end

	private
	def event_params
		params.require(:event).permit(
			:vest_id, :attachment_id, :alert, :details, :latitude, :longitude
		)
	end
end
