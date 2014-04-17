class MapController < ApplicationController
	def index
		@events = Event.near(request.location, 100)
	end
end
