class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.integer :vest_id
      t.integer :attachment_id


      t.timestamps
    end
  end
end
