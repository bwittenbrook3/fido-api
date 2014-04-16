class AddStatusToVest < ActiveRecord::Migration
  def change
    add_column :vests, :status, :string
  end
end
