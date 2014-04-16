class FixVestIcon < ActiveRecord::Migration
  def change
  	remove_column :vests, :icon_uid, :integer
  	add_column :vests, :icon_uid, :string
  end
end
