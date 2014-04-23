module Api
	class VestsController < ApplicationController
		def index
			@vests = Vest.all
			render :json => @vests
		end

		def create
			@vest = Vest.create(vest_params)
			render :json => @vest
		end

		def show
			@vest = Vest.find(params[:id])
			render :json => @vest
		end

		def update
			@vest = Vest.find(params[:id])
			@vest.update(vest_params)
			render :json => @vest
		end

		def destroy
			@vest = Vest.find(params[:id])
			@vest.destroy
			render :json => nil, status: :ok
		end

		def image_path
			@image_path = Vest.find(params[:id]).image.remote_url
			render :json => {url: @image_path}, status: :ok
		end

		def training
			@training = Vest.find(params[:id]).trainings
			render :json => @training, status: :ok
		end

		def events
			@events = Vest.find(params[:id]).events 
			render :json => @events, status: :ok
		end

		def recent_location
			@vest = Vest.find(params[:id])
			@vest.recent_locations ||= "[]"
			@recent_locations = eval(@vest.recent_locations)
			render :json => {location: @recent_locations.last}, status: :ok
		end

		def recent_locations
			max_length = 10
			@vest = Vest.find(params[:id])
			@vest.recent_locations ||= "[]"
			@recent_locations = eval(@vest.recent_locations)
			@recent_locations << {longitude: params[:location][:longitude], latitude: params[:location][:latitude]}
			if @recent_locations.length > max_length
				@recent_locations.shift
			end
			@vest.recent_locations = @recent_locations.to_s
			@vest.save
			sync_update @vest
			render :json => @recent_locations, status: :ok
		end

		def location_updated_channel
			@vest = Vest.find(params[:id])
			@channel = Sync::Channel.new("/vests/#{@vest.id}-_vest").to_s + "-update"
			render :json => {channel: @channel}, status: :ok
		end

		private
		def vest_params
			params.require(:vest).permit(
				:K9, :officer, :image, :status, :age, :color, training_ids: []
			)
		end
	end
end