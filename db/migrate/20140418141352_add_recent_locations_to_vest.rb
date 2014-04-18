class AddRecentLocationsToVest < ActiveRecord::Migration
  def change
    add_column :vests, :recent_locations, :string
  end
end
