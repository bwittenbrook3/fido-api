class MapController < ApplicationController
	def index
		@events = Event.all #Event.near(request.location.coordinates, 25)
		@hash = Gmaps4rails.build_markers(@events) do |event, marker|
		  marker.lat event.latitude
		  marker.lng event.longitude
		end
	end
end
