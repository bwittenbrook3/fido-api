class CreateJoinTableVestTraining < ActiveRecord::Migration
  def change
    create_join_table :vests, :trainings do |t|
      # t.index [:vest_id, :training_id]
      # t.index [:training_id, :vest_id]
    end
  end
end
