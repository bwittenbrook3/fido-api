class ChangeRecentLocationTypeInVest < ActiveRecord::Migration
  def change
  	change_column :vests, :recent_locations, :text
  end
end
