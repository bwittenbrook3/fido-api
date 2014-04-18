class MapController < ApplicationController
	def index
		@events = Event.near(request.location.coordinates, 25)
		@hash = Gmaps4rails.build_markers(@events) do |event, marker|
		  marker.lat event.latitude
		  marker.lng event.longitude
		  marker.infowindow info_window_builder(event)
		end
	end

	private 
	def info_window_builder(event)
		builder = render_to_string(partial: 'map/event', locals: { event: event })
	end
end
