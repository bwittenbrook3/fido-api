class EventsResources < ActiveRecord::Base
	belongs_to :event 
	belongs_to :resource
end
