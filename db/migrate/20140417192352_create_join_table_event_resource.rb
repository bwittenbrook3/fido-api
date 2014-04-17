class CreateJoinTableEventResource < ActiveRecord::Migration
  def change
    create_join_table :events, :resources do |t|
      # t.index [:event_id, :resource_id]
      # t.index [:resource_id, :event_id]
    end
  end
end
