class ModifyLongAndLat < ActiveRecord::Migration
  def change
  	remove_column :events, :lat, :string
  	remove_column :events, :long, :string
  	add_column :events, :latitude, :float
  	add_column :events, :longitude, :float
  end
end
