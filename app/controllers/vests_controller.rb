class VestsController < ApplicationController
	def index
		@vests = Vest.all.order("created_at ASC")
	end

	def create
		@vest = Vest.create(vest_params)
		redirect_to k9s_path
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

	def get_training_modal
		@k9 = Vest.find(params[:id])
		render :get_training_modal, :layout => false
	end

	private
	def vest_params
		params.require(:vest).permit(
			:K9, :officer, :image, :status, :age, training_ids: []
		)
	end
end
