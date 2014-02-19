class EventsController < ApplicationController

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
		
		respond_to do |format|
			format.html
			format.json {render :json => @event}
		end
	end

	private
	def event_params
		params.require(:event).permit(
			:vest_id, :attachment_id
		)
	end
end
