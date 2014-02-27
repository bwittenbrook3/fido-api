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

		private
		def vest_params
			params.require(:vest).permit(
				:name, :description
			)
		end
	end
end