module Api
	class EventsController < ApplicationController

		def index
			@events = Event.all
			render :json => @events
		end

		def create
			@event = Event.create(event_params)
			render :json => @event
		end

		def show
			@event = Event.find(params[:id])
			render :json => @event
		end

		def update
			@event = Event.find(params[:id])
			render :json => @event.update_attributes(event_params)
		end

		def destroy
			@event = Event.find(params[:id])
			@event.destroy
			render :json => @event
		end

		private
		def event_params
			params.require(:event).permit(
				:vest_id, :attachment_id
			)
		end
	end
end