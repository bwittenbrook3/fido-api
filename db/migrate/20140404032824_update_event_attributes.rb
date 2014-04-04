class UpdateEventAttributes < ActiveRecord::Migration
  def change
  	add_column :events, :alert, :string
  	add_column :events, :lat, :string
  	add_column :events, :long, :string
  	add_column :events, :details, :text
  end
end
