class AddColorToVest < ActiveRecord::Migration
  def change
    add_column :vests, :color, :string
  end
end
