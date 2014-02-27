class AddVestIdToAttachments < ActiveRecord::Migration
  def change
    add_column :attachments, :vest_id, :integer
  end
end
