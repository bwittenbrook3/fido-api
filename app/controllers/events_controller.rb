class EventsController < ApplicationController

	swagger_controller :events, "Event Management"

	swagger_api :index do 
		summary "Fetches all Event items"
		param :query, :page, :integer, :optional, "Page number"
    	response :unauthorized
	end

	swagger_api :create do 
		summary "Creates a new Event"
		param :form, :vest_id, :integer, :required, "Vest ID"
		param :form, :attachment_id, :integer, :required, "Attachment ID"
		response :unauthorized
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
