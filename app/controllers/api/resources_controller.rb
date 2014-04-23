module Api
	class ResourcesController < ApplicationController
		enable_sync only: [:create, :update, :destroy]

		def index
			@resources = Event.find(params[:event_id]).resources
			render :json => @resources, status: :ok
		end

		def create
			@resource = Resource.create(resource_params)
			@event = Event.find(params[:event_id])
			@resource.event_id = @event.id
			@resource.save
			sync_new @resource
			render :json => @resource, status: :ok
			#@resource = Event.find(params[:event_id]).resources.create(resource_params)
		end

		def new_channel
			@event = Event.find(params[:event_id])
			@channel = Sync::PartialCreator.new("resource", @event.resources.new, nil, nil).channel
			render :json => {channel: @channel}, status: :ok
		end

		private
		def resource_params
			params.require(:resource).permit(
				:data_type, :data, :image
			)
		end
	end
end