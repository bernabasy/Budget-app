class AddTotalEntitiesToGroups < ActiveRecord::Migration[7.0]
  def change
    add_column :groups, :total_entities, :float
  end
end
