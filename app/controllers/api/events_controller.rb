module Api
	class EventsController < ApplicationController

		def index
			@events = Event.all
			render :json => @events
		end

		def create
			@event = Event.new(event_params)
			if @event.valid?
				@event.save
				@event.send_text_message_alert
				render :json => @event
			else
				render :json => nil, status: :unprocessable_entity 
			end
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
			render :json => nil, status: :ok
		end

		private
		def event_params
			params.require(:event).permit(
				:vest_id, :attachment_id
			)
		end
	end
end