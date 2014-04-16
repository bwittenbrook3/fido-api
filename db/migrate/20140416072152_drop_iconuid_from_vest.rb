class DropIconuidFromVest < ActiveRecord::Migration
  def change
  	remove_column :vests, :icon_uid, :string
  end
end
