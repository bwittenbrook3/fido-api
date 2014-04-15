class AddImageToVests < ActiveRecord::Migration
  def change
  	add_column :vests, :image_uid,  :string
		add_column :vests, :image_name, :string 
  end
end
