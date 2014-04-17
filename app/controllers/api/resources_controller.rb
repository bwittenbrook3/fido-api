module Api
	class ResourcesController < ApplicationController

		def index
			@resources = Event.find(params[:event_id]).resources
			render :json => @resources, status: :ok
		end

		def create
			@resource = Resource.create(resource_params)
			Event.find(params[:event_id]).resources << @resource
			render :json => @resource, status: :ok
			#@resource = Event.find(params[:event_id]).resources.create(resource_params)
		end

	private
	def resource_params
		params.require(:resource).permit(
			:data, :image
		)
	end
	end
end