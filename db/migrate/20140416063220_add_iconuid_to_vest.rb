class AddIconuidToVest < ActiveRecord::Migration
  def change
    add_column :vests, :icon_uid, :integer
  end
end
