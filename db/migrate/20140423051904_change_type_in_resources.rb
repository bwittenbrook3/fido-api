class ChangeTypeInResources < ActiveRecord::Migration
  def change
  	rename_column :resources, :type, :data_type
  end
end
