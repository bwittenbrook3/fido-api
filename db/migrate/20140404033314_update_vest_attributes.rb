class UpdateVestAttributes < ActiveRecord::Migration
  def change
  	remove_column :vests, :name, :string
  	remove_column :vests, :description, :text
  	add_column :vests, :K9, :string
  	add_column :vests, :officer, :string
  end
end
