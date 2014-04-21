class ChangeDataInResourcesToText < ActiveRecord::Migration
  def change
  	change_column :resources, :data, :text
  end
end
