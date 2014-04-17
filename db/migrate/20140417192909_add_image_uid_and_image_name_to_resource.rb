class AddImageUidAndImageNameToResource < ActiveRecord::Migration
  def change
    add_column :resources, :image_uid, :string
    add_column :resources, :image_name, :string
  end
end
