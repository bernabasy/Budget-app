class RemoveEntityIdAndGroupIdFromUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :entity_id
    remove_column :users, :group_id
  end
end
