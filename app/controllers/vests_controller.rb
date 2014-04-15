class VestsController < ApplicationController
	def index
		@vests = Vest.all
	end
end
