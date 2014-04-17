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

		private
		def vest_params
			params.require(:vest).permit(
				:name, :description
			)
		end
	end
end