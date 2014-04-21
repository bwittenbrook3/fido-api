class AddRecentLocationToEvent < ActiveRecord::Migration
  def change
  	add_column :events, :recent_locations, :text
  end
end
