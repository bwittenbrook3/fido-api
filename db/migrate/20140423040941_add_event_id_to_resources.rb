class AddEventIdToResources < ActiveRecord::Migration
  def change
    add_column :resources, :event_id, :integer
  end
end
