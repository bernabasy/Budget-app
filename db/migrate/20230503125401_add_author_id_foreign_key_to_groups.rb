class AddAuthorIdForeignKeyToGroups < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :groups, :users, column: :author_id
    add_foreign_key :entities, :users, column: :author_id
  end
end
