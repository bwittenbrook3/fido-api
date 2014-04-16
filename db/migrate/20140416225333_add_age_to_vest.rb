class AddAgeToVest < ActiveRecord::Migration
  def change
    add_column :vests, :age, :integer
  end
end
