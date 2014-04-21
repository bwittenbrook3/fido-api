module Api
	class EventsController < ApplicationController

		enable_sync only: [:create, :update, :destroy]

		def new_channel
			@channel = Sync::PartialCreator.new("event", Event.new, nil, nil).channel
			render :json => {channel: @channel}, status: :ok
		end

		def index
			@events = Event.all
			render :json => @events
		end

		def create
			@event = Event.new(event_params)
			if @event.valid?
				@event.save
				sync_new @event
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

		def recent_locations
			max_length = 100
			@event = Event.find(params[:id])
			@event.recent_locations ||= "[]"
			@recent_locations = eval(@event.recent_locations)
			@recent_locations << {longitude: params[:location][:longitude], latitude: params[:location][:latitude]}
			if @recent_locations.length > max_length
				@recent_locations.shift
			end
			@event.recent_locations = @recent_locations.to_s
			@event.save
			render :json => @recent_locations, status: :ok
		end

		private
		def event_params
			params.require(:event).permit(
				:vest_id, :attachment_id, :alert, :details, :latitude, :longitude
			)
		end
	end
end