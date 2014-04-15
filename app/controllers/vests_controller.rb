class VestsController < ApplicationController
	def index
		@vests = Vest.all.order("created_at ASC")
	end

	def show
		@vest = Vest.find(params[:id])

		respond_to do |format|
			format.js
		end
	end

	def edit
		@vest = Vest.find(params[:id])
		render :edit, :layout => false
	end

	def update
		@vest = Vest.find(params[:id])
		@vest.update(vest_params)
		redirect_to k9s_path
	end

	private
	def vest_params
		params.require(:vest).permit(
			:K9, :officer, :image
		)
	end
end
