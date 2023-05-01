class AddReferencesToUsers < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :entity, null: false, foreign_key: true
    add_reference :users, :group, null: false, foreign_key: true
  end
end
