class VestsController < ApplicationController
	def index
		@vests = Vest.all
	end

	def show
		@vest = Vest.find(params[:id])

		respond_to do |format|
			format.js
		end
	end
end
