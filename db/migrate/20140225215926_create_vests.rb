class CreateVests < ActiveRecord::Migration
  def change
    create_table :vests do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
